import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../core/activity.dart';
import '../core/config.dart';
import '../core/mcp_server.dart';
import '../core/network.dart';
import '../core/tailscale.dart';
import '../tools/file_tools.dart';
import '../tools/control_tools.dart';
import '../tools/pc_tools.dart';
import '../tools/tool.dart';

/// A change waiting for Allow or Deny on the PC.
class PendingApproval {
  PendingApproval(this.tool, this.summary);
  final CompanionTool tool;
  final String summary;
  final _answer = Completer<bool>();
  final asked = DateTime.now();

  Future<bool> get answer => _answer.future;
  void decide(bool allow) {
    if (!_answer.isCompleted) _answer.complete(allow);
  }
}

/// A phone that used the companion.
class SeenClient {
  SeenClient(this.who, this.last);
  final String who;
  DateTime last;
  String lastTool = '';
  int liveSessions = 0;

  /// In touch in the last 90 seconds, or watching live.
  bool get connected => liveSessions > 0 || DateTime.now().difference(last) < const Duration(seconds: 90);

  SeenClient copy() => SeenClient(who, last)
    ..lastTool = lastTool
    ..liveSessions = liveSessions;
}

/// Holds the server, Tailscale and settings together for the window.
class CompanionController extends ChangeNotifier {
  CompanionController._(this.config, this.log);

  final ConfigStore config;
  final ActivityLog log;
  late final McpServer server;

  TailscaleState tailscale = const TailscaleState();

  /// This PC's home-network addresses, likeliest first.
  List<LanAddress> lan = const [];

  /// Windows treats the current network as Public (firewall blocks the phone).
  bool publicNetwork = false;
  String serverError = '';
  String serveError = '';
  bool busy = false;
  final approvals = ValueNotifier<List<PendingApproval>>(const []);

  /// Phones that connected, by who they are (Tailscale login or address).
  final clients = ValueNotifier<Map<String, SeenClient>>(const {});

  /// Called when a change needs an answer, to bring the window forward.
  VoidCallback? onApprovalNeeded;

  Timer? _poll;

  static final tools = <CompanionTool>[...pcTools.take(1), ...fileTools, ...pcTools.skip(1), ...controlTools];

  static Future<CompanionController> create() async {
    final dir = p.join((await getApplicationSupportDirectory()).path);
    final temp = p.join(dir, 'temp');
    await Directory(temp).create(recursive: true);
    // Screenshots left from last time.
    for (final f in Directory(temp).listSync()) {
      try {
        f.deleteSync(recursive: true);
      } catch (_) {}
    }
    final c = CompanionController._(await ConfigStore.open(dir), ActivityLog(dir));
    c.server = McpServer(
      config: () => c.config.value,
      tools: tools,
      log: c.log,
      approve: c._approve,
      baseUrl: () => c.origin.isNotEmpty ? c.origin : 'http://127.0.0.1:${c.config.value.port}',
      tempDir: temp,
      onSeen: c._seen,
    );
    c.server.live.onChange = c._live;
    return c;
  }

  String get dataDir => config.dir;

  bool get homeWifi => config.value.mode == NetworkMode.homeWifi;

  /// The home-network address in use: the one picked, else the likeliest.
  String get lanAddress {
    final picked = config.value.lanAddress;
    if (lan.any((a) => a.address == picked)) return picked;
    return lan.isEmpty ? '' : lan.first.address;
  }

  /// Where the phone reaches the companion, or empty when it can't yet.
  String get origin => homeWifi
      ? (lanAddress.isEmpty || !server.running ? '' : 'http://$lanAddress:${config.value.port}')
      : (tailscale.serving ? tailscale.url : '');

  /// The address to add in Triangle (Settings → MCP), token in the path.
  String get pairUrl => origin.isEmpty ? '' : '$origin/mcp/${config.value.token}';
  String get endpoint => origin.isEmpty ? '' : '$origin/mcp';

  Future<void> start() async {
    try {
      await server.start();
      serverError = '';
    } catch (e) {
      serverError = 'Could not listen on port ${config.value.port}: $e. Is the companion already running?';
    }
    notifyListeners();
    await refresh(autoServe: !homeWifi);
    _poll = Timer.periodic(const Duration(seconds: 15), (_) {
      refresh();
      // Let "connected" fade after 90 seconds of quiet.
      clients.value = {...clients.value};
    });
  }

  Future<void> refresh({bool autoServe = false}) async {
    lan = await lanAddresses();
    if (homeWifi) {
      publicNetwork = await onPublicNetwork();
      notifyListeners();
      return;
    }
    tailscale = await Tailscale.status(config.value.port);
    if (autoServe && tailscale.running && tailscale.httpsReady && !tailscale.serving && server.running) {
      await publish();
      return;
    }
    notifyListeners();
  }

  /// Turns on `tailscale serve` for the companion.
  Future<void> publish() async {
    busy = true;
    notifyListeners();
    serveError = await Tailscale.serve(config.value.port) ?? '';
    tailscale = await Tailscale.status(config.value.port);
    busy = false;
    notifyListeners();
  }

  Future<void> unpublish() async {
    busy = true;
    notifyListeners();
    await Tailscale.stopServing();
    tailscale = await Tailscale.status(config.value.port);
    busy = false;
    notifyListeners();
  }

  /// Switches between Tailscale and home Wi-Fi, listening again to match.
  Future<void> setMode(NetworkMode mode) async {
    if (mode == config.value.mode) return;
    busy = true;
    notifyListeners();
    if (mode == NetworkMode.homeWifi && tailscale.serving) await Tailscale.stopServing();
    await config.update((x) => x.copyWith(mode: mode));
    try {
      await server.start();
      serverError = '';
    } catch (e) {
      serverError = 'Could not listen on port ${config.value.port}: $e';
    }
    busy = false;
    await refresh(autoServe: mode == NetworkMode.tailscale);
  }

  /// Asks Windows (as administrator) to let the phone in on private networks.
  Future<bool> openFirewall() => allowThroughFirewall(config.value.port);

  Future<void> change(CompanionConfig Function(CompanionConfig c) f) async {
    await config.update(f);
    notifyListeners();
  }

  void _seen(String who, String tool) {
    final map = {for (final e in clients.value.entries) e.key: e.value.copy()};
    final x = map[who] ??= SeenClient(who, DateTime.now());
    x.last = DateTime.now();
    if (tool.isNotEmpty) x.lastTool = tool;
    clients.value = map;
  }

  void _live(String who, int delta) {
    _seen(who, '');
    final map = {for (final e in clients.value.entries) e.key: e.value.copy()};
    map[who]!.liveSessions = (map[who]!.liveSessions + delta).clamp(0, 99);
    clients.value = map;
  }

  /// Whether anyone is connected right now (for the tray).
  bool get anyConnected => clients.value.values.any((x) => x.connected);

  Future<bool> _approve(CompanionTool tool, String summary) async {
    final a = PendingApproval(tool, summary);
    approvals.value = [...approvals.value, a];
    onApprovalNeeded?.call();
    try {
      return await a.answer.timeout(McpServer.approvalTimeout, onTimeout: () => false);
    } finally {
      approvals.value = [for (final x in approvals.value) if (x != a) x];
    }
  }

  @override
  void dispose() {
    _poll?.cancel();
    unawaited(server.dispose());
    super.dispose();
  }
}
