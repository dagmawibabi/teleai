import 'dart:io';

import '../core/config.dart';
import '../core/path_guard.dart';
import '../core/shares.dart';

/// The same three groups Triangle's Tools screen uses.
enum Access { read, modify, destructive }

/// Which switch on the PC a tool needs.
enum Feature {
  info('Always on'),
  files('Shared folders'),
  screen('See the screen'),
  input('Control mouse & keyboard'),
  clipboard('Clipboard'),
  commands('Run commands'),
  system('Apps & system');

  const Feature(this.label);
  final String label;

  bool on(CompanionConfig c) => switch (this) {
        Feature.info => true,
        Feature.files => c.folders.isNotEmpty,
        Feature.screen => c.seeScreen,
        Feature.input => c.controlInput,
        Feature.clipboard => c.clipboard,
        Feature.commands => c.runCommands,
        Feature.system => c.system,
      };
}

/// What a tool gets for one call.
class ToolContext {
  ToolContext({required this.config, required this.shares, required this.baseUrl, required this.screen, required this.tempDir});

  final CompanionConfig config;
  final ShareLinks shares;

  /// Where the phone reaches this PC, e.g. `https://pc.tail1234.ts.net`.
  final String baseUrl;

  /// Shared between calls: how the last screenshot maps to the screen.
  final ScreenMap screen;

  /// For screenshots and other files the companion makes.
  final String tempDir;

  late final PathGuard guard = PathGuard(config.folders);

  /// A download link for [path] the phone can open for [ttl].
  String link(String path, Duration ttl, {bool temporary = false}) =>
      '$baseUrl${ShareLinks.urlPath(shares.create(path, ttl, temporary: temporary), path)}';
}

/// How pixels in the last screenshot map to screen coordinates.
class ScreenMap {
  int originX = 0, originY = 0;
  double scale = 1;
  bool taken = false;

  ({int x, int y}) toScreen(num x, num y) => (x: originX + (x / scale).round(), y: originY + (y / scale).round());
}

typedef ToolHandler = Future<Object?> Function(Map<String, dynamic> args, ToolContext ctx);

/// One MCP tool.
class CompanionTool {
  const CompanionTool({
    required this.name,
    required this.title,
    required this.description,
    required this.access,
    required this.feature,
    required this.handler,
    this.properties = const {},
    this.required = const [],
  });

  final String name;
  final String title;
  final String description;
  final Access access;
  final Feature feature;
  final Map<String, Map<String, dynamic>> properties;
  final List<String> required;
  final ToolHandler handler;

  Map<String, dynamic> toMcp() => {
        'name': name,
        'title': title,
        'description': '$description [${access.name}]',
        'inputSchema': {
          'type': 'object',
          'properties': properties,
          if (required.isNotEmpty) 'required': required,
          'additionalProperties': false,
        },
        'annotations': {
          'title': title,
          'readOnlyHint': access == Access.read,
          'destructiveHint': access == Access.destructive,
          'openWorldHint': false,
        },
      };
}

// Small helpers for tool code.

String str(Map<String, dynamic> a, String key, {String? fallback}) {
  final v = a[key];
  if (v == null || (v is String && v.trim().isEmpty)) {
    if (fallback != null) return fallback;
    throw ToolRefused('"$key" is required.');
  }
  return '$v';
}

int integer(Map<String, dynamic> a, String key, {required int fallback, int? min, int? max}) {
  final v = a[key];
  var n = v is num ? v.round() : int.tryParse('${v ?? ''}') ?? fallback;
  if (min != null && n < min) n = min;
  if (max != null && n > max) n = max;
  return n;
}

num number(Map<String, dynamic> a, String key) {
  final v = a[key];
  final n = v is num ? v : num.tryParse('${v ?? ''}');
  if (n == null) throw ToolRefused('"$key" must be a number.');
  return n;
}

bool flag(Map<String, dynamic> a, String key, {bool fallback = false}) {
  final v = a[key];
  return v is bool ? v : (v == null ? fallback : '$v' == 'true');
}

Map<String, dynamic> prop(String type, String description, {List<String>? choices}) =>
    {'type': type, 'description': description, 'enum': ?choices};

String iso(DateTime t) => t.toIso8601String();

String typeOf(FileSystemEntity e) => switch (e) {
      Link() => 'link',
      Directory() => 'folder',
      _ => 'file',
    };
