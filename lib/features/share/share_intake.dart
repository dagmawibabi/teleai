import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Something another app handed to Triangle.
class SharedPayload {
  const SharedPayload({required this.selection, required this.text, this.files = const []});

  /// Text selected in another app ("Ask Triangle"), rather than shared.
  final bool selection;
  final String text;

  /// Shared files, copied into the app's cache: (path, name).
  final List<(String, String)> files;

  factory SharedPayload.fromMap(Map<Object?, Object?> m) => SharedPayload(
    selection: m['kind'] == 'selection',
    text: '${m['text'] ?? ''}'.trim(),
    files: [
      for (final f in (m['files'] as List? ?? const []))
        if (f is Map && f['path'] != null) ('${f['path']}', '${f['name'] ?? 'file'}'),
    ],
  );
}

/// Shares and "Ask Triangle" selections from other apps (ShareChannel.kt).
abstract final class ShareIntake {
  static const _channel = MethodChannel('teleai/share');

  /// Calls [onShared] for each share, including the one that launched the
  /// app.
  static void listen(void Function(SharedPayload payload) onShared) {
    if (kIsWeb || !Platform.isAndroid) return;
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'shared' && call.arguments is Map) onShared(SharedPayload.fromMap(call.arguments as Map));
    });
    _channel.invokeMethod<Map<Object?, Object?>>('takeLaunch').then((m) {
      if (m != null) onShared(SharedPayload.fromMap(m));
    }, onError: (_) {});
  }
}
