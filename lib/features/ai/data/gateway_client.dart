import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../settings/data/settings.dart';
import 'model_catalog.dart';

class GatewayException implements Exception {
  GatewayException(this.message, {this.status});
  final String message;
  final int? status;

  @override
  String toString() => message;
}

/// A tool the model asked for, assembled from streamed fragments.
class ToolCallRequest {
  ToolCallRequest({required this.id, required this.name, required this.arguments});
  final String id;
  final String name;

  /// Raw JSON text, as the model wrote it.
  final String arguments;
}

sealed class AiEvent {
  const AiEvent();
}

class ReasoningDelta extends AiEvent {
  const ReasoningDelta(this.text);
  final String text;
}

class ContentDelta extends AiEvent {
  const ContentDelta(this.text);
  final String text;
}

/// A tool call has started streaming: its name is known, its arguments not yet.
class ToolCallStarted extends AiEvent {
  const ToolCallStarted(this.index, this.id, this.name);
  final int index;
  final String id;
  final String name;
}

class TurnEnd extends AiEvent {
  const TurnEnd({required this.toolCalls, this.finishReason, this.reasoningDetails, this.usage});
  final List<ToolCallRequest> toolCalls;
  final String? finishReason;

  /// Opaque reasoning blocks some providers want sent back on the next turn.
  final List<dynamic>? reasoningDetails;
  final Map<String, dynamic>? usage;
}

/// OpenAI-compatible chat completions through the Vercel AI Gateway or
/// OpenRouter, streamed, with tools and visible reasoning.
class GatewayClient {
  GatewayClient(this.settings);

  final AppSettings settings;
  final http.Client _http = http.Client();
  bool _cancelled = false;

  static const vercelUrl = 'https://ai-gateway.vercel.sh/v1';
  static const openRouterUrl = 'https://openrouter.ai/api/v1';

  void cancel() {
    _cancelled = true;
    _http.close();
  }

  String _keyFor(String model) {
    if (AiRoute.isOpenRouter(model)) {
      if (!settings.hasOpenRouterKey) {
        throw GatewayException('Add an OpenRouter key in Settings to use ${AiRoute.bare(model)}.');
      }
      return settings.openRouterKey.trim();
    }
    if (!settings.hasVercelKey) {
      throw GatewayException('Add a Vercel AI Gateway key in Settings to use $model.');
    }
    return settings.vercelKey.trim();
  }

  Map<String, String> _headers(String model) => {
    'Authorization': 'Bearer ${_keyFor(model)}',
    'Content-Type': 'application/json',
    'HTTP-Referer': 'https://github.com/teleai-app',
    'X-Title': 'TeleAI',
  };

  Map<String, dynamic> _reasoningOptions(String model) {
    final t = settings.thinking;
    return switch (t) {
      Thinking.off => const {'reasoning': {'enabled': false}},
      Thinking.low || Thinking.medium || Thinking.high => {'reasoning': {'effort': t.name}},
      Thinking.auto => AiRoute.isOpenRouter(model) ? const {'include_reasoning': true} : const {},
    };
  }

  static String errorText(String body) {
    try {
      final j = jsonDecode(body);
      final e = j['error'];
      if (e is Map && e['message'] != null) return '${e['message']}';
      if (e is String) return e;
      if (j['message'] != null) return '${j['message']}';
    } catch (_) {}
    return body.length > 300 ? '${body.substring(0, 300)}…' : body;
  }

  /// One model turn. Retries once without reasoning options or reasoning
  /// details when the provider rejects them.
  Stream<AiEvent> streamTurn({
    required String model,
    required List<Map<String, dynamic>> messages,
    List<Map<String, dynamic>> tools = const [],
  }) async* {
    // `await for`, not `yield*`, so the retry signal is caught here.
    try {
      await for (final e in _stream(model: model, messages: messages, tools: tools, plain: false)) {
        yield e;
      }
    } on _RetryPlain {
      final stripped = [
        for (final m in messages) {...m}..remove('reasoning_details'),
      ];
      await for (final e in _stream(model: model, messages: stripped, tools: tools, plain: true)) {
        yield e;
      }
    }
  }

  Stream<AiEvent> _stream({
    required String model,
    required List<Map<String, dynamic>> messages,
    required List<Map<String, dynamic>> tools,
    required bool plain,
  }) async* {
    final reasoning = plain ? const <String, dynamic>{} : _reasoningOptions(model);
    final base = AiRoute.isOpenRouter(model) ? openRouterUrl : vercelUrl;
    final req = http.Request('POST', Uri.parse('$base/chat/completions'))
      ..headers.addAll(_headers(model))
      ..body = jsonEncode({
        'model': AiRoute.bare(model),
        'messages': messages,
        if (tools.isNotEmpty) 'tools': tools,
        if (tools.isNotEmpty) 'tool_choice': 'auto',
        'stream': true,
        'stream_options': {'include_usage': true},
        // OpenRouter reports each request's cost when asked.
        if (AiRoute.isOpenRouter(model)) 'usage': {'include': true},
        if (!AiRoute.isOpenRouter(model))
          'providerOptions': {
            'gateway': {'caching': 'auto'},
          },
        ...reasoning,
      });

    final http.StreamedResponse res;
    try {
      res = await _http.send(req).timeout(const Duration(seconds: 90));
    } catch (e) {
      if (_cancelled) throw GatewayException('Stopped.');
      throw GatewayException('Could not reach ${AiRoute.routerName(model)}: $e');
    }
    if (res.statusCode != 200) {
      final body = await res.stream.bytesToString();
      final hasDetails = messages.any((m) => m.containsKey('reasoning_details'));
      if (res.statusCode == 400 && !plain && (reasoning.isNotEmpty || hasDetails)) throw _RetryPlain();
      throw GatewayException(errorText(body), status: res.statusCode);
    }

    final calls = <int, ({String id, String name, StringBuffer args})>{};
    final details = <dynamic>[];
    String? finish;
    Map<String, dynamic>? usage;
    var buffer = '';
    final chunks = res.stream.timeout(const Duration(seconds: 180)).transform(utf8.decoder).handleError((Object e) {
      if (_cancelled) throw GatewayException('Stopped.');
      throw e;
    });

    await for (final chunk in chunks) {
      buffer += chunk;
      while (true) {
        final nl = buffer.indexOf('\n');
        if (nl < 0) break;
        final line = buffer.substring(0, nl).trim();
        buffer = buffer.substring(nl + 1);
        if (!line.startsWith('data:')) continue;
        final data = line.substring(5).trim();
        if (data == '[DONE]') continue;
        final Map<String, dynamic> j;
        try {
          j = jsonDecode(data) as Map<String, dynamic>;
        } on FormatException {
          continue;
        }
        if (j['error'] != null) throw GatewayException(errorText(data));
        if (j['usage'] is Map) usage = Map<String, dynamic>.from(j['usage']);
        final choices = j['choices'];
        if (choices is! List || choices.isEmpty) continue;
        final first = choices.first as Map;
        if (first['finish_reason'] != null) finish = '${first['finish_reason']}';
        final d = first['delta'] ?? first['message'];
        if (d is! Map) continue;

        final thinking = d['reasoning'] ?? d['reasoning_content'];
        if (thinking is String && thinking.isNotEmpty) yield ReasoningDelta(thinking);
        if (d['reasoning_details'] is List) {
          for (final r in d['reasoning_details'] as List) {
            _mergeDetail(details, r);
            if (thinking == null && r is Map && r['text'] is String && (r['text'] as String).isNotEmpty) {
              yield ReasoningDelta(r['text'] as String);
            }
          }
        }

        final content = d['content'];
        final text = content is List ? content.map((p) => p is Map ? (p['text'] ?? '') : '$p').join() : content;
        if (text is String && text.isNotEmpty) yield ContentDelta(text);

        final toolCalls = d['tool_calls'];
        if (toolCalls is List) {
          for (final tc in toolCalls.whereType<Map>()) {
            final index = (tc['index'] as num?)?.toInt() ?? calls.length;
            final fn = (tc['function'] as Map?) ?? const {};
            var call = calls[index];
            if (call == null) {
              final id = '${tc['id'] ?? 'call_${DateTime.now().microsecondsSinceEpoch}_$index'}';
              final name = '${fn['name'] ?? ''}';
              call = calls[index] = (id: id, name: name, args: StringBuffer());
              yield ToolCallStarted(index, id, name);
            }
            final args = fn['arguments'];
            if (args is String) call.args.write(args);
            if (args is Map) call.args.write(jsonEncode(args));
          }
        }
      }
    }

    final ordered = calls.keys.toList()..sort();
    yield TurnEnd(
      toolCalls: [
        for (final i in ordered)
          ToolCallRequest(id: calls[i]!.id, name: calls[i]!.name, arguments: calls[i]!.args.toString()),
      ],
      finishReason: finish,
      reasoningDetails: details.isEmpty ? null : details,
      usage: usage,
    );
  }

  /// Reasoning details arrive in fragments sharing an index; text and
  /// signatures are concatenated per index, as OpenRouter expects them back.
  static void _mergeDetail(List<dynamic> details, dynamic r) {
    if (r is! Map) return;
    final index = r['index'];
    final existing = index == null ? null : details.whereType<Map>().where((d) => d['index'] == index).firstOrNull;
    if (existing == null) {
      details.add(Map<String, dynamic>.from(r));
      return;
    }
    for (final key in const ['text', 'signature', 'data', 'summary']) {
      final v = r[key];
      if (v is String) existing[key] = '${existing[key] ?? ''}$v';
    }
    r.forEach((k, v) => existing.putIfAbsent(k, () => v));
  }

  /// Checks a key against the router's model list endpoint or a tiny call.
  static Future<String?> verifyKey({required AiRouter router, required String key}) async {
    try {
      if (router == AiRouter.openRouter) {
        final r = await http
            .get(Uri.parse('$openRouterUrl/key'), headers: {'Authorization': 'Bearer $key'})
            .timeout(const Duration(seconds: 20));
        return r.statusCode == 200 ? null : GatewayClient.errorText(r.body);
      }
      final r = await http
          .post(
            Uri.parse('$vercelUrl/chat/completions'),
            headers: {'Authorization': 'Bearer $key', 'Content-Type': 'application/json'},
            body: jsonEncode({
              'model': 'openai/gpt-4o-mini',
              'messages': [
                {'role': 'user', 'content': 'Reply with OK'},
              ],
              'max_tokens': 4,
            }),
          )
          .timeout(const Duration(seconds: 30));
      if (r.statusCode == 401 || r.statusCode == 403) return GatewayClient.errorText(r.body);
      return null;
    } catch (e) {
      return 'Could not check the key: $e';
    }
  }

  void close() => _http.close();
}

class _RetryPlain implements Exception {}
