import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

/// One folder the phone may see. [writable] lets Modify tools change it.
@immutable
class SharedFolder {
  const SharedFolder(this.path, {this.writable = false});

  final String path;
  final bool writable;

  String get name => p.basename(path).isEmpty ? path : p.basename(path);

  SharedFolder copyWith({bool? writable}) => SharedFolder(path, writable: writable ?? this.writable);

  Map<String, dynamic> toJson() => {'path': path, 'writable': writable};

  static SharedFolder fromJson(Map j) => SharedFolder('${j['path']}', writable: j['writable'] == true);
}

/// How the phone reaches the PC.
enum NetworkMode {
  /// HTTPS through `tailscale serve`, from anywhere; listens on 127.0.0.1.
  tailscale('Tailscale', 'From anywhere, encrypted. Needs Tailscale on the PC and the phone.'),

  /// Plain http on the home network; listens on every interface.
  homeWifi('Home Wi-Fi', 'Only when the phone is on the same Wi-Fi. Nothing else to install.');

  const NetworkMode(this.label, this.explanation);
  final String label;
  final String explanation;
}

/// What the companion allows, saved next to the app's data on this PC.
@immutable
class CompanionConfig {
  const CompanionConfig({
    required this.token,
    this.port = 8765,
    this.paused = false,
    this.folders = const [],
    this.seeScreen = false,
    this.controlInput = false,
    this.clipboard = false,
    this.runCommands = false,
    this.system = false,
    this.askOnPc = true,
    this.allowedLogin = '',
    this.mode = NetworkMode.tailscale,
    this.lanAddress = '',
  });

  /// The secret the phone sends as `Authorization: Bearer …` (or in the
  /// URL path). Anyone holding it can use every tool that is switched on.
  final String token;

  /// Local port the server listens on (127.0.0.1 only; Tailscale serve
  /// proxies to it).
  final int port;

  /// Refuses every call while on.
  final bool paused;

  final List<SharedFolder> folders;

  /// Screenshots.
  final bool seeScreen;

  /// Mouse, keyboard and opening apps.
  final bool controlInput;

  /// Reading and writing the clipboard.
  final bool clipboard;

  /// PowerShell commands.
  final bool runCommands;

  /// Windows, apps and processes, system status, media keys and power.
  final bool system;

  /// Shows Allow / Deny on this PC before any Modify or Destructive call.
  final bool askOnPc;

  /// When set, only requests Tailscale says come from this login
  /// (e.g. you@gmail.com) are answered.
  final String allowedLogin;

  final NetworkMode mode;

  /// The PC's address on the home network the phone should use, when it
  /// has several (Wi-Fi and Ethernet, say). Empty picks the likeliest.
  final String lanAddress;

  static String newToken() {
    final r = Random.secure();
    final bytes = List<int>.generate(32, (_) => r.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  CompanionConfig copyWith({
    String? token,
    int? port,
    bool? paused,
    List<SharedFolder>? folders,
    bool? seeScreen,
    bool? controlInput,
    bool? clipboard,
    bool? runCommands,
    bool? system,
    bool? askOnPc,
    String? allowedLogin,
    NetworkMode? mode,
    String? lanAddress,
  }) =>
      CompanionConfig(
        token: token ?? this.token,
        port: port ?? this.port,
        paused: paused ?? this.paused,
        folders: folders ?? this.folders,
        seeScreen: seeScreen ?? this.seeScreen,
        controlInput: controlInput ?? this.controlInput,
        clipboard: clipboard ?? this.clipboard,
        runCommands: runCommands ?? this.runCommands,
        system: system ?? this.system,
        askOnPc: askOnPc ?? this.askOnPc,
        allowedLogin: allowedLogin ?? this.allowedLogin,
        mode: mode ?? this.mode,
        lanAddress: lanAddress ?? this.lanAddress,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'port': port,
        'paused': paused,
        'folders': [for (final f in folders) f.toJson()],
        'seeScreen': seeScreen,
        'controlInput': controlInput,
        'clipboard': clipboard,
        'runCommands': runCommands,
        'system': system,
        'askOnPc': askOnPc,
        'allowedLogin': allowedLogin,
        'mode': mode.name,
        'lanAddress': lanAddress,
      };

  static CompanionConfig fromJson(Map j) => CompanionConfig(
        token: (j['token'] as String?)?.isNotEmpty == true ? j['token'] as String : newToken(),
        port: j['port'] is int ? j['port'] as int : 8765,
        paused: j['paused'] == true,
        folders: [for (final f in (j['folders'] as List? ?? const [])) if (f is Map) SharedFolder.fromJson(f)],
        seeScreen: j['seeScreen'] == true,
        controlInput: j['controlInput'] == true,
        clipboard: j['clipboard'] == true,
        runCommands: j['runCommands'] == true,
        system: j['system'] == true,
        askOnPc: j['askOnPc'] != false,
        allowedLogin: '${j['allowedLogin'] ?? ''}',
        mode: NetworkMode.values.asNameMap()[j['mode']] ?? NetworkMode.tailscale,
        lanAddress: '${j['lanAddress'] ?? ''}',
      );
}

/// Loads and saves [CompanionConfig] as JSON in [dir].
class ConfigStore extends ValueNotifier<CompanionConfig> {
  ConfigStore._(this._file, CompanionConfig value) : super(value);

  final File _file;

  String get dir => _file.parent.path;

  static Future<ConfigStore> open(String dir) async {
    final file = File(p.join(dir, 'config.json'));
    CompanionConfig config;
    try {
      config = CompanionConfig.fromJson(jsonDecode(await file.readAsString()) as Map);
    } catch (_) {
      config = CompanionConfig(token: CompanionConfig.newToken());
    }
    final store = ConfigStore._(file, config);
    await store._save();
    return store;
  }

  Future<void> update(CompanionConfig Function(CompanionConfig c) change) async {
    value = change(value);
    await _save();
  }

  Future<void> _save() async {
    await _file.parent.create(recursive: true);
    final tmp = File('${_file.path}.tmp');
    await tmp.writeAsString(const JsonEncoder.withIndent('  ').convert(value.toJson()));
    await tmp.rename(_file.path);
  }
}
