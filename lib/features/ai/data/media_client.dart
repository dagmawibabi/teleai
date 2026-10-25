import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../settings/data/settings.dart';
import 'gateway_client.dart';
import 'model_catalog.dart';

/// Images and speech through the Vercel AI Gateway or OpenRouter, the way
/// the dnd app calls them.
class MediaClient {
  MediaClient(this.settings);
  final AppSettings settings;
  final http.Client _http = http.Client();

  static const _vercelAiUrl = 'https://ai-gateway.vercel.sh/v4/ai';

  String _key(String model) {
    if (AiRoute.isOpenRouter(model)) {
      if (!settings.hasOpenRouterKey)
        throw GatewayException(
          'Add an OpenRouter key in Settings to use $model.',
        );
      return settings.openRouterKey.trim();
    }
    if (AiRoute.isGemini(model)) {
      if (!settings.hasGeminiKey) {
        throw GatewayException(
          'Add a Google AI Studio Gemini key in Settings to use $model.',
        );
      }
      return settings.geminiKey.trim();
    }
    if (!settings.hasVercelKey)
      throw GatewayException(
        'Add a Vercel AI Gateway key in Settings to use $model.',
      );
    return settings.vercelKey.trim();
  }

  Map<String, String> _headers(String model) => {
    'Authorization': 'Bearer ${_key(model)}',
    'Content-Type': 'application/json',
    'HTTP-Referer': 'https://github.com/dagmawibabi/triangle',
    'X-Title': 'Triangle',
  };

  String _base(String model) => AiRoute.isOpenRouter(model)
      ? GatewayClient.openRouterUrl
      : (AiRoute.isGemini(model)
            ? GatewayClient.geminiUrl
            : GatewayClient.vercelUrl);

  static String _size(String aspect) => switch (aspect) {
    'portrait' => '1024x1536',
    'landscape' => '1536x1024',
    _ => '1024x1024',
  };

  static String _ratio(String aspect) => switch (aspect) {
    'portrait' => '2:3',
    'landscape' => '3:2',
    _ => '1:1',
  };

  /// One image for [prompt]. Multimodal chat models answer through chat
  /// completions with `modalities`; image-only models through the images
  /// endpoint, which is tried when the first way is refused.
  Future<Uint8List> generateImage({
    required String model,
    required String prompt,
    String aspect = 'square',
  }) async {
    final or = AiRoute.isOpenRouter(model);
    final res = await _http
        .post(
          Uri.parse('${_base(model)}/chat/completions'),
          headers: _headers(model),
          body: jsonEncode({
            'model': AiRoute.bare(model),
            'messages': [
              {'role': 'user', 'content': prompt},
            ],
            'modalities': ['image', 'text'],
            if (or) 'image_config': {'aspect_ratio': _ratio(aspect)},
            'stream': false,
          }),
        )
        .timeout(const Duration(seconds: 180));
    if (res.statusCode == 200) {
      final j = jsonDecode(utf8.decode(res.bodyBytes));
      final choices = j['choices'];
      final message = choices is List && choices.isNotEmpty
          ? choices.first['message']
          : null;
      final images = message is Map ? message['images'] : null;
      if (images is List && images.isNotEmpty) {
        final url = images.first['image_url']?['url'] as String?;
        if (url != null) return _download(url);
      }
      if (or)
        throw GatewayException(
          'The model answered without an image. Pick an image model in Settings.',
        );
    } else if (or || res.statusCode == 401 || res.statusCode == 403) {
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(res.bodyBytes)),
        status: res.statusCode,
      );
    }
    // Image-only gateway models use the images endpoint.
    final r2 = await _http
        .post(
          Uri.parse('${GatewayClient.vercelUrl}/images/generations'),
          headers: _headers(model),
          body: jsonEncode({
            'model': model,
            'prompt': prompt,
            'n': 1,
            'size': _size(aspect),
            'response_format': 'b64_json',
          }),
        )
        .timeout(const Duration(seconds: 180));
    if (r2.statusCode != 200) {
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(r2.bodyBytes)),
        status: r2.statusCode,
      );
    }
    final data = jsonDecode(utf8.decode(r2.bodyBytes))['data'];
    if (data is List && data.isNotEmpty) {
      final b64 = data.first['b64_json'] as String?;
      if (b64 != null) return base64Decode(b64);
      final url = data.first['url'] as String?;
      if (url != null) return _download(url);
    }
    throw GatewayException('The image model returned no image.');
  }

  Future<Uint8List> _download(String url) async {
    if (url.startsWith('data:'))
      return base64Decode(url.substring(url.indexOf(',') + 1));
    final r = await _http
        .get(Uri.parse(url))
        .timeout(const Duration(seconds: 60));
    if (r.statusCode != 200)
      throw GatewayException('Could not download the image (${r.statusCode}).');
    return r.bodyBytes;
  }

  /// MP3 audio of [text] read by an AI voice model.
  Future<Uint8List> speak({
    required String model,
    required String text,
    String? voice,
    double speed = 1,
  }) async {
    if (AiRoute.isGemini(model)) {
      throw GatewayException(
        'Gemini TTS uses a native audio API that is not available through its OpenAI-compatible endpoint. Choose Addis AI, ElevenLabs, or a gateway voice model.',
      );
    }
    if (AiRoute.isOpenRouter(model)) {
      final res = await _http
          .post(
            Uri.parse('${GatewayClient.openRouterUrl}/audio/speech'),
            headers: _headers(model),
            body: jsonEncode({
              'model': AiRoute.bare(model),
              'input': text,
              if (voice != null && voice.isNotEmpty) 'voice': voice,
              'response_format': 'mp3',
              if (speed != 1) 'speed': speed,
            }),
          )
          .timeout(const Duration(seconds: 60));
      if (res.statusCode != 200) {
        throw GatewayException(
          GatewayClient.errorText(utf8.decode(res.bodyBytes)),
          status: res.statusCode,
        );
      }
      return res.bodyBytes;
    }
    final res = await _http
        .post(
          Uri.parse('$_vercelAiUrl/speech-model'),
          headers: {
            'Authorization': 'Bearer ${_key(model)}',
            'Content-Type': 'application/json',
            'ai-gateway-protocol-version': '0.0.1',
            'ai-gateway-auth-method': 'api-key',
            'ai-speech-model-specification-version': '4',
            'ai-model-id': model,
          },
          body: jsonEncode({
            'text': text,
            if (voice != null && voice.isNotEmpty) 'voice': voice,
            'outputFormat': 'mp3',
            if (speed != 1) 'speed': speed,
          }),
        )
        .timeout(const Duration(seconds: 60));
    if (res.statusCode != 200) {
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(res.bodyBytes)),
        status: res.statusCode,
      );
    }
    final audio = jsonDecode(utf8.decode(res.bodyBytes))['audio'];
    if (audio is! String || audio.isEmpty)
      throw GatewayException('The voice model returned no audio.');
    return base64Decode(audio);
  }

  /// Turns recorded WAV audio into text with a chat model that hears audio.
  Future<String> transcribe({
    required String model,
    required Uint8List wav,
  }) async {
    final res = await _http
        .post(
          Uri.parse('${_base(model)}/chat/completions'),
          headers: _headers(model),
          body: jsonEncode({
            'model': AiRoute.bare(model),
            'messages': [
              {
                'role': 'user',
                'content': [
                  {
                    'type': 'text',
                    'text':
                        'Transcribe this recording verbatim, in the language spoken. Reply with the transcript only, '
                        'no quotes or notes. If nothing is said, reply with nothing.',
                  },
                  {
                    'type': 'input_audio',
                    'input_audio': {'data': base64Encode(wav), 'format': 'wav'},
                  },
                ],
              },
            ],
            'stream': false,
            'temperature': 0,
          }),
        )
        .timeout(const Duration(seconds: 90));
    if (res.statusCode != 200) {
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(res.bodyBytes)),
        status: res.statusCode,
      );
    }
    final choices = jsonDecode(utf8.decode(res.bodyBytes))['choices'];
    final message = choices is List && choices.isNotEmpty
        ? choices.first['message']
        : null;
    final content = message is Map ? message['content'] : null;
    return content is String ? content.trim() : '';
  }

  void close() => _http.close();
}

/// Addis Voices 2. The catalog is live because voice availability can change.
class AddisVoice {
  const AddisVoice({
    required this.id,
    required this.name,
    required this.language,
    this.gender = '',
    this.style = '',
    this.previewUrl,
  });
  final String id;
  final String name;
  final String language;
  final String gender;
  final String style;
  final String? previewUrl;
  String get traits =>
      [language, gender, style].where((v) => v.isNotEmpty).join(' · ');
  factory AddisVoice.fromJson(Map<String, dynamic> j) => AddisVoice(
    id: '${j['id'] ?? ''}',
    name: '${j['name'] ?? j['id'] ?? 'Voice'}',
    language: '${j['language'] ?? ''}',
    gender: '${j['gender'] ?? ''}',
    style: '${j['style'] ?? ''}',
    previewUrl: j['preview_url']?.toString(),
  );
}

class AddisAiClient {
  AddisAiClient(this.apiKey);
  final String apiKey;
  final http.Client _http = http.Client();
  static const base = 'https://api.addisassistant.com/api/v1/voice';
  Map<String, String> get _headers => {
    'x-api-key': apiKey.trim(),
    'Content-Type': 'application/json',
  };

  /// Speech languages Addis Voices 2 supports.
  static const languages = {'am', 'om', 'ti'};

  static bool _ok(int status) => status >= 200 && status < 300;

  Future<List<AddisVoice>> voices({String? language}) async {
    final query = language == null || language.isEmpty
        ? ''
        : '?language=$language';
    final r = await _http
        .get(Uri.parse('$base/voices$query'), headers: _headers)
        .timeout(const Duration(seconds: 30));
    if (!_ok(r.statusCode))
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(r.bodyBytes)),
        status: r.statusCode,
      );
    final j = jsonDecode(utf8.decode(r.bodyBytes));
    final list = j is Map ? (j['data'] ?? j['voices'] ?? const []) : j;
    return [
        for (final v in (list as List? ?? const []))
          if (v is Map) AddisVoice.fromJson(Map<String, dynamic>.from(v)),
      ]
      ..removeWhere((v) => v.id.isEmpty || !languages.contains(v.language))
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  /// What a sample says, in the voice's own language.
  static String sampleText(String language) => switch (language) {
    'om' => 'Akkam jirta! Ani gargaaraa kee Triangle dha. Har\'a maal si gargaaruu danda\'a?',
    'ti' => 'ሰላም! ኣነ ሓጋዚኻ ቴሌኤአይ እየ። ሎሚ ብምንታይ ክሕግዘካ?',
    _ => 'ሰላም! እኔ የቴሌኤአይ ረዳትህ ነኝ። ዛሬ በምን ልርዳህ?',
  };

  /// A ready-made sample of [voiceId], when Addis has one.
  Future<String?> previewUrl(String voiceId) async {
    try {
      final r = await _http
          .get(Uri.parse('$base/voices/$voiceId/preview'), headers: _headers)
          .timeout(const Duration(seconds: 20));
      if (!_ok(r.statusCode)) return null;
      final j = jsonDecode(utf8.decode(r.bodyBytes));
      final d = j is Map ? (j['data'] ?? j) : null;
      if (d is! Map) return null;
      final url = d['preview_url'] ?? d['url'] ?? d['audio_url'] ?? (d['playback'] is Map ? d['playback']['url'] : null);
      return url?.toString();
    } catch (_) {
      return null;
    }
  }

  /// The language of [voiceId]: from its prefix when it has one (am-…),
  /// else from the catalog. Null when it isn't an Addis voice, e.g. a
  /// gateway voice name left over from another engine.
  Future<String?> languageOf(String voiceId) async {
    final prefix = voiceId.split(RegExp(r'[-_]')).first.toLowerCase();
    if (languages.contains(prefix)) return prefix;
    if (voiceId.trim().isEmpty) return null;
    final match = (await voices()).where((v) => v.id == voiceId).firstOrNull;
    return match?.language;
  }

  Future<Uint8List> speak({
    required String text,
    required String voiceId,
    required String language,
    double speed = 1,
  }) async {
    final r = await _http
        .post(
          Uri.parse('$base/generations'),
          headers: _headers,
          // As the official SDK sends it; speed has no field of its own and
          // goes in voice_settings, which the API ignores where unsupported.
          body: jsonEncode({
            'text': text,
            'voice_id': voiceId,
            'language': language,
            'output_format': 'mp3_44100',
            'stream': false,
            'client_request_id': '${DateTime.now().microsecondsSinceEpoch}',
            if (speed != 1) 'voice_settings': {'speed': speed},
          }),
        )
        .timeout(const Duration(seconds: 95));
    if (!_ok(r.statusCode))
      throw GatewayException(
        GatewayClient.errorText(utf8.decode(r.bodyBytes)),
        status: r.statusCode,
      );
    final j = jsonDecode(utf8.decode(r.bodyBytes));
    final data = j is Map ? (j['data'] ?? j) : const {};
    final playback = data is Map ? data['playback'] : null;
    final url = data is Map
        ? (data['audio_url'] ?? (playback is Map ? playback['url'] : null))
              ?.toString()
        : null;
    if (url == null || url.isEmpty)
      throw GatewayException('Addis AI returned no audio URL.');
    final audio = await _http
        .get(Uri.parse(url))
        .timeout(const Duration(seconds: 60));
    if (!_ok(audio.statusCode))
      throw GatewayException(
        'Could not download Addis AI audio (${audio.statusCode}).',
      );
    return audio.bodyBytes;
  }

  void close() => _http.close();
}

/// A voice from the user's ElevenLabs library.
class ElevenVoice {
  const ElevenVoice({
    required this.id,
    required this.name,
    this.category = '',
    this.previewUrl,
    this.labels = const {},
  });
  final String id;
  final String name;
  final String category;
  final String? previewUrl;
  final Map<String, String> labels;

  /// "American · female · young · narration"
  String get traits {
    final useCase = labels['use_case'] ?? labels['use case'];
    return <String?>[
      labels['accent'],
      labels['gender'],
      labels['age'],
      useCase,
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');
  }

  factory ElevenVoice.fromJson(Map<String, dynamic> j) => ElevenVoice(
    id: (j['voice_id'] ?? '').toString(),
    name: (j['name'] ?? 'Voice').toString(),
    category: (j['category'] ?? '').toString(),
    previewUrl: j['preview_url']?.toString(),
    labels: {
      for (final e in ((j['labels'] as Map?) ?? const {}).entries)
        e.key.toString(): e.value.toString(),
    },
  );
}

/// ElevenLabs speech models, cheapest first.
const elevenModels = [
  ('eleven_flash_v2_5', 'Flash v2.5', 'Fastest and cheapest'),
  ('eleven_multilingual_v2', 'Multilingual v2', 'Rich and steady'),
  ('eleven_v3', 'Eleven v3', 'Most expressive'),
];

/// ElevenLabs: voices, text to speech and speech to text.
class ElevenLabsClient {
  ElevenLabsClient(this.apiKey);
  final String apiKey;
  final http.Client _http = http.Client();

  static const base = 'https://api.elevenlabs.io/v1';
  Map<String, String> get _headers => {
    'xi-api-key': apiKey.trim(),
    'Content-Type': 'application/json',
  };

  String _error(http.Response r) {
    try {
      final j = jsonDecode(utf8.decode(r.bodyBytes));
      final d = j is Map ? j['detail'] : null;
      if (d is Map) return (d['message'] ?? d['status'] ?? r.body).toString();
      if (d != null) return d.toString();
    } catch (_) {}
    return 'ElevenLabs error ${r.statusCode}';
  }

  Future<List<ElevenVoice>> voices() async {
    final r = await _http
        .get(Uri.parse('$base/voices'), headers: _headers)
        .timeout(const Duration(seconds: 30));
    if (r.statusCode != 200)
      throw GatewayException(_error(r), status: r.statusCode);
    final j = jsonDecode(utf8.decode(r.bodyBytes)) as Map;
    return [
      for (final v in (j['voices'] as List? ?? const []))
        ElevenVoice.fromJson(Map<String, dynamic>.from(v)),
    ]..sort((a, b) => a.name.compareTo(b.name));
  }

  /// MP3 audio of [text] in [voiceId].
  Future<Uint8List> speak({
    required String voiceId,
    required String text,
    String model = 'eleven_flash_v2_5',
  }) async {
    final r = await _http
        .post(
          Uri.parse(
            '$base/text-to-speech/$voiceId?output_format=mp3_44100_128',
          ),
          headers: {..._headers, 'Accept': 'audio/mpeg'},
          body: jsonEncode({'text': text, 'model_id': model}),
        )
        .timeout(const Duration(seconds: 90));
    if (r.statusCode != 200)
      throw GatewayException(_error(r), status: r.statusCode);
    return r.bodyBytes;
  }

  /// Text of a recording, with ElevenLabs Scribe.
  Future<String> transcribe(
    Uint8List audio, {
    String filename = 'speech.wav',
  }) async {
    final req = http.MultipartRequest('POST', Uri.parse('$base/speech-to-text'))
      ..headers['xi-api-key'] = apiKey.trim()
      ..fields['model_id'] = 'scribe_v1'
      ..files.add(
        http.MultipartFile.fromBytes('file', audio, filename: filename),
      );
    final res = await http.Response.fromStream(
      await _http.send(req).timeout(const Duration(seconds: 90)),
    );
    if (res.statusCode != 200)
      throw GatewayException(_error(res), status: res.statusCode);
    final j = jsonDecode(utf8.decode(res.bodyBytes));
    return (j is Map ? j['text'] : null)?.toString().trim() ?? '';
  }

  void close() => _http.close();
}
