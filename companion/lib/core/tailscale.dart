import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

/// What Tailscale on this PC says.
@immutable
class TailscaleState {
  const TailscaleState({
    this.installed = false,
    this.running = false,
    this.dnsName = '',
    this.login = '',
    this.httpsReady = false,
    this.serving = false,
    this.problem = '',
  });

  final bool installed;

  /// Logged in and connected.
  final bool running;

  /// This PC's MagicDNS name, e.g. `desktop.tail1234.ts.net`.
  final String dnsName;

  /// The Tailscale account this PC is logged in with.
  final String login;

  /// HTTPS certificates are enabled for the tailnet.
  final bool httpsReady;

  /// `tailscale serve` is forwarding HTTPS to the companion.
  final bool serving;

  /// What to fix, in plain words.
  final String problem;

  String get url => dnsName.isEmpty ? '' : 'https://$dnsName';
}

/// Runs the Tailscale CLI. The companion only listens on 127.0.0.1;
/// `tailscale serve` gives it `https://<pc>.<tailnet>.ts.net`, reachable only
/// from devices on the same tailnet, with a real certificate.
class Tailscale {
  static String? _exe;

  static Future<String?> _find() async {
    if (_exe != null) return _exe;
    for (final c in [
      r'C:\Program Files\Tailscale\tailscale.exe',
      r'C:\Program Files (x86)\Tailscale\tailscale.exe',
    ]) {
      if (await File(c).exists()) return _exe = c;
    }
    try {
      final r = await Process.run('where', ['tailscale.exe']);
      final first = '${r.stdout}'.split(RegExp(r'\r?\n')).firstWhere((l) => l.trim().isNotEmpty, orElse: () => '');
      if (r.exitCode == 0 && first.isNotEmpty) return _exe = first.trim();
    } catch (_) {}
    return null;
  }

  static Future<ProcessResult?> _run(List<String> args) async {
    final exe = await _find();
    if (exe == null) return null;
    return Process.run(exe, args, stdoutEncoding: utf8, stderrEncoding: utf8).timeout(const Duration(seconds: 20));
  }

  static Future<TailscaleState> status(int port) async {
    final r = await _run(['status', '--json']);
    if (r == null) return const TailscaleState(problem: 'Tailscale isn\'t installed. Get it from tailscale.com/download, sign in, and install it on your phone too.');
    Map j;
    try {
      j = jsonDecode('${r.stdout}') as Map;
    } catch (_) {
      return const TailscaleState(installed: true, problem: 'Tailscale isn\'t running. Open the Tailscale app and connect.');
    }
    final backend = '${j['BackendState'] ?? ''}';
    if (backend != 'Running') {
      return TailscaleState(
        installed: true,
        problem: backend == 'NeedsLogin' ? 'Sign in to Tailscale on this PC.' : 'Tailscale is $backend. Open the Tailscale app and connect.',
      );
    }
    final self = j['Self'] as Map? ?? const {};
    final dns = '${self['DNSName'] ?? ''}'.replaceFirst(RegExp(r'\.$'), '');
    final users = j['User'] as Map? ?? const {};
    final login = '${(users['${self['UserID']}'] as Map?)?['LoginName'] ?? ''}';
    final certs = j['CertDomains'];
    final https = certs is List && certs.isNotEmpty;
    final serving = await _serving(port);
    return TailscaleState(
      installed: true,
      running: true,
      dnsName: dns,
      login: login,
      httpsReady: https,
      serving: serving,
      problem: dns.isEmpty
          ? 'Turn on MagicDNS in the Tailscale admin console (DNS page).'
          : !https
              ? 'Turn on HTTPS certificates in the Tailscale admin console: login.tailscale.com/admin/dns → HTTPS Certificates → Enable.'
              : '',
    );
  }

  /// Whether serve already forwards :443 to our port.
  static Future<bool> _serving(int port) async {
    final r = await _run(['serve', 'status', '--json']);
    if (r == null || r.exitCode != 0) return false;
    return '${r.stdout}'.contains('127.0.0.1:$port') || '${r.stdout}'.contains('localhost:$port');
  }

  /// Starts forwarding `https://<pc>.ts.net` to the companion. Returns an
  /// error message, or null when it worked.
  static Future<String?> serve(int port) async {
    final r = await _run(['serve', '--bg', '--yes', '--https=443', 'http://127.0.0.1:$port']);
    if (r == null) return 'Tailscale isn\'t installed.';
    if (r.exitCode == 0) return null;
    final text = '${r.stderr}\n${r.stdout}'.trim();
    // Older CLIs don't know --yes.
    if (text.contains('flag provided but not defined: -yes')) {
      final again = await _run(['serve', '--bg', '--https=443', 'http://127.0.0.1:$port']);
      if (again != null && again.exitCode == 0) return null;
      return '${again?.stderr ?? ''}'.trim();
    }
    return text.isEmpty ? 'tailscale serve failed (${r.exitCode}).' : text;
  }

  static Future<void> stopServing() async {
    await _run(['serve', '--https=443', 'off']);
  }
}
