import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../core/activity.dart';
import '../core/config.dart';
import '../tools/tool.dart';
import 'controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.controller});
  final CompanionController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([controller, controller.config]),
      builder: (context, _) {
        final c = controller.config.value;
        Widget page(List<Widget> children) => Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: ListView(padding: const EdgeInsets.all(16), children: children),
              ),
            );
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Triangle Companion'),
              actions: [
                _ConnectedChip(controller),
                const SizedBox(width: 16),
                Text(c.paused ? 'Paused' : 'Answering', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(width: 8),
                Switch(
                  value: !c.paused,
                  onChanged: (on) => controller.change((x) => x.copyWith(paused: !on)),
                ),
                const SizedBox(width: 16),
              ],
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.lan_outlined), text: 'Connection'),
                Tab(icon: Icon(Icons.tune_rounded), text: 'Access'),
                Tab(icon: Icon(Icons.history_rounded), text: 'Activity'),
              ]),
            ),
            body: Stack(
              children: [
                TabBarView(children: [
                  page([_Devices(controller), _Connection(controller), _Pairing(controller)]),
                  page([_Folders(controller), _Abilities(controller)]),
                  page([_Activity(controller)]),
                ]),
                _Approvals(controller),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children, this.icon, this.trailing});
  final String title;
  final IconData? icon;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              if (icon != null) ...[Icon(icon, size: 20, color: t.colorScheme.primary), const SizedBox(width: 8)],
              Expanded(child: Text(title, style: t.textTheme.titleMedium)),
              ?trailing,
            ]),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.ok, required this.title, required this.detail, this.action});
  final bool ok;
  final String title;
  final String detail;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ok ? Icons.check_circle_rounded : Icons.error_outline_rounded, color: ok ? Colors.green : t.colorScheme.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: t.textTheme.bodyLarge),
              if (detail.isNotEmpty) SelectableText(detail, style: t.textTheme.bodySmall),
            ]),
          ),
          ?action,
        ],
      ),
    );
  }
}

class _Connection extends StatelessWidget {
  const _Connection(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    final ts = c.tailscale;
    final serveAction = !ts.running || !ts.httpsReady
        ? null
        : c.busy
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
            : ts.serving
                ? TextButton(onPressed: c.unpublish, child: const Text('Stop'))
                : FilledButton(onPressed: c.publish, child: const Text('Publish'));
    final mode = c.config.value.mode;
    return _Section(
      title: 'Connection',
      icon: Icons.lan_outlined,
      trailing: IconButton(tooltip: 'Check again', icon: const Icon(Icons.refresh_rounded), onPressed: c.refresh),
      children: [
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<NetworkMode>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: NetworkMode.tailscale, icon: Icon(Icons.public_rounded, size: 18), label: Text('Tailscale')),
              ButtonSegment(value: NetworkMode.homeWifi, icon: Icon(Icons.wifi_rounded, size: 18), label: Text('Home Wi-Fi')),
            ],
            selected: {mode},
            onSelectionChanged: c.busy ? null : (v) => c.setMode(v.first),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 4),
          child: Text(mode.explanation, style: Theme.of(context).textTheme.bodySmall),
        ),
        if (mode == NetworkMode.homeWifi) ..._homeWifi(context) else ..._tailscale(serveAction),
      ],
    );
  }

  List<Widget> _homeWifi(BuildContext context) {
    final t = Theme.of(context);
    return [
      _StatusRow(
        ok: c.server.running && c.serverError.isEmpty,
        title: c.server.running ? 'Listening on port ${c.server.port}' : 'Not listening',
        detail: c.serverError.isNotEmpty ? c.serverError : 'Answers only devices on your home network, and only with the token.',
      ),
      _StatusRow(
        ok: c.lan.isNotEmpty,
        title: c.lan.isEmpty ? 'Not on a home network' : 'This PC is at ${c.lanAddress}',
        detail: c.lan.isEmpty ? 'Connect the PC to your Wi-Fi or router.' : 'The phone must be on the same Wi-Fi.',
        action: c.lan.length < 2
            ? null
            : DropdownButton<String>(
                value: c.lanAddress,
                underline: const SizedBox.shrink(),
                items: [
                  for (final a in c.lan) DropdownMenuItem(value: a.address, child: Text('${a.address}  ${a.interface}')),
                ],
                onChanged: (v) => c.change((x) => x.copyWith(lanAddress: v)),
              ),
      ),
      if (c.publicNetwork)
        _StatusRow(
          ok: false,
          title: 'Windows calls this network Public',
          detail: 'Its firewall then blocks the phone. Set your Wi-Fi to Private: Settings → Network & internet → Wi-Fi → your network → Private.',
          action: TextButton(onPressed: () => Process.run('explorer.exe', ['ms-settings:network-wifi']), child: const Text('Open')),
        ),
      _StatusRow(
        ok: true,
        title: 'Windows Firewall',
        detail: 'If Triangle can\'t connect, Windows may be blocking it. Allow it for private networks (asks for admin rights).',
        action: TextButton(
          onPressed: () async {
            final ok = await c.openFirewall();
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? 'Allowed on private networks' : 'Not changed')));
          },
          child: const Text('Allow'),
        ),
      ),
      const SizedBox(height: 4),
      Text('Plain http: someone on the same Wi-Fi who watches traffic could see the token and files. Use it only on your own network.',
          style: t.textTheme.bodySmall?.copyWith(color: t.colorScheme.error)),
    ];
  }

  List<Widget> _tailscale(Widget? serveAction) {
    final ts = c.tailscale;
    return [
        _StatusRow(
          ok: c.server.running && c.serverError.isEmpty,
          title: c.server.running ? 'Listening on this PC only (127.0.0.1:${c.server.port})' : 'Not listening',
          detail: c.serverError,
        ),
        _StatusRow(
          ok: ts.running,
          title: ts.running ? 'Tailscale connected${ts.login.isEmpty ? '' : ' as ${ts.login}'}' : 'Tailscale',
          detail: ts.running ? ts.dnsName : ts.problem,
        ),
        if (ts.running)
          _StatusRow(
            ok: ts.serving,
            title: ts.serving ? 'Reachable from your tailnet' : 'Not reachable from the phone yet',
            detail: ts.serving ? '${ts.url}  (only devices in your tailnet)' : (c.serveError.isNotEmpty ? c.serveError : ts.problem),
            action: serveAction,
          ),
    ];
  }
}

class _Pairing extends StatelessWidget {
  const _Pairing(this.c);
  final CompanionController c;

  void _copy(BuildContext context, String text, String what) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$what copied'), duration: const Duration(seconds: 2)));
  }

  Future<void> _newToken(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Make a new token?'),
        content: const Text('Triangle stops working with this PC until you add the new address there.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('New token')),
        ],
      ),
    );
    if (ok == true) await c.change((x) => x.copyWith(token: CompanionConfig.newToken()));
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final ready = c.pairUrl.isNotEmpty;
    final cfg = c.config.value;
    return _Section(
      title: 'Pair with Triangle',
      icon: Icons.qr_code_2_rounded,
      children: [
        if (!ready)
          Text(
              c.homeWifi
                  ? 'Connect this PC to your home Wi-Fi first.'
                  : 'Finish the connection above first. You also need Tailscale on your phone, signed in to the same account.',
              style: t.textTheme.bodyMedium)
        else ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: QrImageView(data: c.pairUrl, size: 168, backgroundColor: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('In Triangle: Settings → MCP & Skills → MCP servers → Add by address.', style: t.textTheme.bodyMedium),
                    const SizedBox(height: 6),
                    Text('Name it "pc" and paste this address. Scan the code with your camera or Google Lens to copy it on the phone, '
                        'or copy it here and send it to yourself.', style: t.textTheme.bodySmall),
                    const SizedBox(height: 12),
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      FilledButton.tonalIcon(
                        icon: const Icon(Icons.copy_rounded, size: 18),
                        label: const Text('Copy address'),
                        onPressed: () => _copy(context, c.pairUrl, 'Address'),
                      ),
                      OutlinedButton(
                        onPressed: () => _copy(context, 'Bearer ${cfg.token}', 'Header value'),
                        child: const Text('Copy as header'),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
              'The address holds a secret token: anyone on your ${c.homeWifi ? 'Wi-Fi' : 'tailnet'} with it can use what you switch on below.',
              style: t.textTheme.bodySmall),
          Text('Header form: address ${c.endpoint} with header Authorization.', style: t.textTheme.bodySmall),
        ],
        const Divider(height: 24),
        if (!c.homeWifi) SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Only my Tailscale account'),
          subtitle: Text(cfg.allowedLogin.isEmpty
              ? 'Devices shared into your tailnet by other people can also connect if they have the token'
              : 'Only ${cfg.allowedLogin}'),
          value: cfg.allowedLogin.isNotEmpty,
          onChanged: c.tailscale.login.isEmpty && cfg.allowedLogin.isEmpty
              ? null
              : (on) => c.change((x) => x.copyWith(allowedLogin: on ? c.tailscale.login : '')),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            icon: const Icon(Icons.key_rounded, size: 18),
            label: const Text('Make a new token'),
            onPressed: () => _newToken(context),
          ),
        ),
      ],
    );
  }
}

class _Folders extends StatelessWidget {
  const _Folders(this.c);
  final CompanionController c;

  Future<void> _add() async {
    final path = await FilePicker.getDirectoryPath(dialogTitle: 'Share a folder with Triangle');
    if (path == null) return;
    final cfg = c.config.value;
    if (cfg.folders.any((f) => f.path.toLowerCase() == path.toLowerCase())) return;
    await c.change((x) => x.copyWith(folders: [...x.folders, SharedFolder(path)]));
  }

  Future<void> _remove(BuildContext context, SharedFolder f) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Stop sharing ${f.name}?'),
        content: const Text('Nothing is deleted; the phone just can\'t see this folder any more.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Stop sharing')),
        ],
      ),
    );
    if (ok == true) await c.change((x) => x.copyWith(folders: [for (final g in x.folders) if (g.path != f.path) g]));
  }

  @override
  Widget build(BuildContext context) {
    final folders = c.config.value.folders;
    return _Section(
      title: 'Shared folders',
      icon: Icons.folder_shared_outlined,
      trailing: FilledButton.tonalIcon(onPressed: _add, icon: const Icon(Icons.add_rounded, size: 18), label: const Text('Add')),
      children: [
        if (folders.isEmpty)
          Text('Nothing is shared. Add a folder to let Triangle list, search and read the files in it.',
              style: Theme.of(context).textTheme.bodyMedium),
        for (final f in folders)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.folder_outlined),
            title: Text(f.name),
            subtitle: Text(f.path, overflow: TextOverflow.ellipsis),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(f.writable ? 'Can change' : 'Read only', style: Theme.of(context).textTheme.labelMedium),
              Switch(
                value: f.writable,
                onChanged: (on) => c.change((x) => x.copyWith(folders: [
                      for (final g in x.folders) g.path == f.path ? g.copyWith(writable: on) : g,
                    ])),
              ),
              IconButton(tooltip: 'Stop sharing', icon: const Icon(Icons.close_rounded), onPressed: () => _remove(context, f)),
            ]),
          ),
      ],
    );
  }
}

class _Abilities extends StatelessWidget {
  const _Abilities(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    final cfg = c.config.value;
    Widget row(IconData icon, String title, String subtitle, bool value, CompanionConfig Function(CompanionConfig, bool) set,
            {bool warn = false}) =>
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: Icon(icon, color: warn && value ? Theme.of(context).colorScheme.error : null),
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: (v) => c.change((x) => set(x, v)),
        );
    return _Section(
      title: 'What Triangle can do',
      icon: Icons.tune_rounded,
      children: [
        row(Icons.screenshot_monitor_outlined, 'See the screen', 'Screenshots of every monitor', cfg.seeScreen,
            (x, v) => x.copyWith(seeScreen: v)),
        row(Icons.mouse_outlined, 'Control mouse & keyboard', 'Click, type, press shortcuts and open apps. Needs See the screen to aim.',
            cfg.controlInput, (x, v) => x.copyWith(controlInput: v)),
        row(Icons.apps_rounded, 'Apps & system',
            'List, focus, move and close windows; processes; CPU, memory, battery; volume and media; lock, sleep, restart',
            cfg.system, (x, v) => x.copyWith(system: v)),
        row(Icons.content_paste_rounded, 'Clipboard', 'Read and set copied text', cfg.clipboard, (x, v) => x.copyWith(clipboard: v)),
        row(Icons.terminal_rounded, 'Run commands', 'PowerShell as you. It can change anything you can.', cfg.runCommands,
            (x, v) => x.copyWith(runCommands: v),
            warn: true),
        const Divider(height: 16),
        row(Icons.front_hand_outlined, 'Ask on this PC before changes',
            'Allow or Deny here before anything is written, clicked, typed or run (25 s, then Deny)', cfg.askOnPc,
            (x, v) => x.copyWith(askOnPc: v)),
      ],
    );
  }
}

class _Activity extends StatelessWidget {
  const _Activity(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return _Section(
      title: 'Activity',
      icon: Icons.history_rounded,
      trailing: TextButton(
        onPressed: () => Process.run('explorer.exe', ['/select,', c.log.path]),
        child: const Text('Open log'),
      ),
      children: [
        ValueListenableBuilder<List<ActivityEntry>>(
          valueListenable: c.log,
          builder: (context, entries, _) {
            if (entries.isEmpty) return Text('Nothing yet. Every call from the phone shows here.', style: t.textTheme.bodyMedium);
            return Column(children: [
              for (final e in entries.take(300))
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    switch (e.outcome) {
                      Outcome.ok => Icons.check_rounded,
                      Outcome.denied => Icons.block_rounded,
                      Outcome.refused => Icons.do_not_disturb_on_outlined,
                      Outcome.failed => Icons.error_outline_rounded,
                    },
                    color: e.outcome == Outcome.ok ? Colors.green : t.colorScheme.error,
                    size: 18,
                  ),
                  title: Text('${e.tool}  ${e.summary}', maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                    '${_time(e.at)}${e.who.isEmpty ? '' : ' · ${e.who}'}${e.detail.isEmpty ? '' : ' · ${e.detail}'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ]);
          },
        ),
      ],
    );
  }

  static String _time(DateTime t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:${t.second.toString().padLeft(2, '0')}';
}

/// Allow / Deny cards for changes waiting on the PC.
class _Approvals extends StatelessWidget {
  const _Approvals(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<PendingApproval>>(
      valueListenable: c.approvals,
      builder: (context, pending, _) {
        if (pending.isEmpty) return const SizedBox.shrink();
        return Positioned.fill(
          child: ColoredBox(
            color: Colors.black54,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(mainAxisSize: MainAxisSize.min, children: [for (final a in pending) _ApprovalCard(a)]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ApprovalCard extends StatefulWidget {
  const _ApprovalCard(this.a);
  final PendingApproval a;

  @override
  State<_ApprovalCard> createState() => _ApprovalCardState();
}

class _ApprovalCardState extends State<_ApprovalCard> {
  late final Timer _tick;

  @override
  void initState() {
    super.initState();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _tick.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final a = widget.a;
    final left = 25 - DateTime.now().difference(a.asked).inSeconds;
    final danger = a.tool.access == Access.destructive;
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(danger ? Icons.warning_amber_rounded : Icons.phone_android_rounded, color: danger ? t.colorScheme.error : t.colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(child: Text('Triangle wants to: ${a.tool.title}', style: t.textTheme.titleMedium)),
          ]),
          const SizedBox(height: 10),
          if (a.summary.isNotEmpty) SelectableText(a.summary, style: t.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Row(children: [
            Text('Denied in ${left.clamp(0, 25)} s', style: t.textTheme.bodySmall),
            const Spacer(),
            TextButton(onPressed: () => a.decide(false), child: const Text('Deny')),
            const SizedBox(width: 8),
            FilledButton(
              style: danger ? FilledButton.styleFrom(backgroundColor: t.colorScheme.error) : null,
              onPressed: () => a.decide(true),
              child: const Text('Allow'),
            ),
          ]),
        ]),
      ),
    );
  }
}

/// Green when Triangle has been in touch in the last minute and a half.
class _ConnectedChip extends StatelessWidget {
  const _ConnectedChip(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, SeenClient>>(
      valueListenable: c.clients,
      builder: (context, clients, _) {
        final t = Theme.of(context);
        final on = clients.values.where((x) => x.connected).toList();
        final live = on.any((x) => x.liveSessions > 0);
        final label = on.isEmpty
            ? 'Waiting for Triangle'
            : live
                ? 'Triangle is watching live'
                : 'Triangle connected';
        return Tooltip(
          message: on.isEmpty ? 'Nothing has connected in the last 90 seconds' : on.map((x) => x.who).join(', '),
          child: Chip(
            avatar: Icon(Icons.circle, size: 12, color: on.isEmpty ? t.colorScheme.outline : (live ? Colors.redAccent : Colors.green)),
            label: Text(label),
            visualDensity: VisualDensity.compact,
          ),
        );
      },
    );
  }
}

/// Who has connected, and when.
class _Devices extends StatelessWidget {
  const _Devices(this.c);
  final CompanionController c;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, SeenClient>>(
      valueListenable: c.clients,
      builder: (context, clients, _) {
        final t = Theme.of(context);
        final list = clients.values.toList()..sort((a, b) => b.last.compareTo(a.last));
        return _Section(
          title: 'Triangle',
          icon: Icons.phone_android_rounded,
          children: [
            if (list.isEmpty)
              Text('Not connected yet. Pair below, then ask Triangle something about your PC or open its PC screen.',
                  style: t.textTheme.bodyMedium),
            for (final x in list)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.circle, size: 14, color: x.connected ? (x.liveSessions > 0 ? Colors.redAccent : Colors.green) : t.colorScheme.outline),
                title: Text(x.who.isEmpty ? 'This PC' : x.who),
                subtitle: Text([
                  if (x.liveSessions > 0) 'Watching the screen live',
                  x.connected ? 'Active ${_ago(x.last)}' : 'Last seen ${_ago(x.last)}',
                  if (x.lastTool.isNotEmpty) 'last used ${x.lastTool}',
                ].join(' · ')),
                trailing: x.liveSessions > 0
                    ? TextButton(onPressed: () => c.server.live.disconnectAll(), child: const Text('End live view'))
                    : null,
              ),
          ],
        );
      },
    );
  }

  static String _ago(DateTime t) {
    final s = DateTime.now().difference(t).inSeconds;
    if (s < 10) return 'just now';
    if (s < 60) return '${s}s ago';
    if (s < 3600) return '${s ~/ 60} min ago';
    return '${s ~/ 3600} h ago';
  }
}
