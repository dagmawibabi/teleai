import 'dart:convert';
import 'dart:io';

/// One IPv4 address of this PC on a home network.
typedef LanAddress = ({String address, String interface});

/// Whether [ip] is a private home-network address (10/8, 172.16/12,
/// 192.168/16) — the ranges Triangle accepts plain http for.
bool isPrivateIPv4(String ip) {
  final p = ip.split('.').map(int.tryParse).toList();
  if (p.length != 4 || p.any((x) => x == null)) return false;
  return p[0] == 10 || (p[0] == 192 && p[1] == 168) || (p[0] == 172 && p[1]! >= 16 && p[1]! <= 31);
}

/// This PC's private addresses, likeliest first: real Wi-Fi and Ethernet
/// before virtual adapters (Hyper-V, WSL, VirtualBox, VMware, VPNs).
Future<List<LanAddress>> lanAddresses() async {
  final out = <LanAddress>[];
  for (final i in await NetworkInterface.list(type: InternetAddressType.IPv4)) {
    for (final a in i.addresses) {
      if (isPrivateIPv4(a.address)) out.add((address: a.address, interface: i.name));
    }
  }
  int rank(LanAddress a) {
    final n = a.interface.toLowerCase();
    var r = 0;
    if (RegExp(r'vethernet|virtual|vmware|vbox|wsl|hyper-v|docker|tailscale|vpn|loopback|bluetooth').hasMatch(n)) r += 10;
    if (!a.address.startsWith('192.168.')) r += 1;
    if (n.contains('wi-fi') || n.contains('wifi') || n.contains('wlan')) r -= 1;
    return r;
  }

  out.sort((a, b) => rank(a).compareTo(rank(b)));
  return out;
}

/// Whether Windows calls the current network Public, where its firewall
/// blocks incoming connections even with an allow rule for private networks.
Future<bool> onPublicNetwork() async {
  try {
    final r = await Process.run(
      'powershell.exe',
      ['-NoProfile', '-NonInteractive', '-Command', '(Get-NetConnectionProfile | Select-Object -ExpandProperty NetworkCategory) -join ","'],
      stdoutEncoding: utf8,
    ).timeout(const Duration(seconds: 10));
    final cats = '${r.stdout}'.trim().split(',');
    return cats.contains('Public') && !cats.contains('Private') && !cats.contains('DomainAuthenticated');
  } catch (_) {
    return false;
  }
}

/// Adds an inbound firewall rule for [port] on private networks. Windows
/// asks for administrator rights; returns false if that was refused.
Future<bool> allowThroughFirewall(int port) async {
  final rule = 'advfirewall firewall add rule name="Triangle Companion" dir=in action=allow protocol=TCP localport=$port profile=private';
  try {
    final r = await Process.run('powershell.exe', [
      '-NoProfile',
      '-NonInteractive',
      '-Command',
      "try { \$p = Start-Process netsh -ArgumentList '$rule' -Verb RunAs -WindowStyle Hidden -Wait -PassThru; exit \$p.ExitCode } catch { exit 1 }",
    ]);
    return r.exitCode == 0;
  } catch (_) {
    return false;
  }
}
