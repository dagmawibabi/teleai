import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../core/path_guard.dart';
import '../native/windows.dart' as win;
import 'mouse_path.dart';
import 'pc_tools.dart';
import 'tool.dart';

/// Elements from the last read_window, in screen pixels.
final _elements = <({int x, int y, int width, int height, String type, String name})>[];

final controlTools = <CompanionTool>[
  CompanionTool(
    name: 'list_windows',
    title: 'List windows',
    description: 'The open windows (what Alt+Tab shows), the one in front first: id, title, app, position, size, minimized or maximized.',
    access: Access.read,
    feature: Feature.system,
    handler: (a, ctx) async => {
      'windows': [
        for (final w in win.listWindows())
          {
            'window_id': w.id,
            'title': w.title,
            'app': w.app,
            'x': w.x,
            'y': w.y,
            'width': w.width,
            'height': w.height,
            if (w.minimized) 'minimized': true,
            if (w.maximized) 'maximized': true,
            if (w.focused) 'in_front': true,
          },
      ],
    },
  ),
  CompanionTool(
    name: 'window',
    title: 'Arrange a window',
    description: 'Brings a window to the front, minimizes, maximizes, restores, moves/resizes or closes it (close asks the app to close, '
        'like its X button, so it may ask to save).',
    access: Access.modify,
    feature: Feature.system,
    properties: {
      'window_id': prop('integer', 'From list_windows.'),
      'action': prop('string', 'What to do.', choices: ['focus', 'minimize', 'maximize', 'restore', 'move', 'close']),
      'x': prop('integer', 'For move: left edge in screen pixels.'),
      'y': prop('integer', 'For move: top edge.'),
      'width': prop('integer', 'For move: width.'),
      'height': prop('integer', 'For move: height.'),
    },
    required: ['window_id', 'action'],
    handler: (a, ctx) async {
      final id = integer(a, 'window_id', fallback: 0);
      if (win.window(id) == null) throw ToolRefused('That window is gone; use list_windows.');
      switch (str(a, 'action')) {
        case 'focus':
          win.focusWindow(id);
        case 'minimize':
          win.minimizeWindow(id);
        case 'maximize':
          win.maximizeWindow(id);
        case 'restore':
          win.restoreWindow(id);
        case 'close':
          win.closeWindow(id);
        case 'move':
          win.moveWindow(id, number(a, 'x').round(), number(a, 'y').round(), number(a, 'width').round(), number(a, 'height').round());
        default:
          throw ToolRefused('action is focus, minimize, maximize, restore, move or close.');
      }
      await Future<void>.delayed(const Duration(milliseconds: 300));
      final w = win.window(id);
      return {
        'done': true,
        if (w != null) 'window': {'title': w.title, 'in_front': w.focused, 'minimized': w.minimized, 'maximized': w.maximized},
        if (w == null) 'closed': true,
      };
    },
  ),
  CompanionTool(
    name: 'read_window',
    title: 'Read a window\'s controls',
    description: 'Lists the visible buttons, fields, links, menu items, tabs, list items and text of a window as numbered elements, '
        'with any field\'s current value, using Windows UI Automation. Then use click_element or type_into by number: '
        'faster and more exact than reading a screenshot. Some apps (games, some custom-drawn apps) expose little.',
    access: Access.read,
    feature: Feature.screen,
    properties: {
      'window_id': prop('integer', 'From list_windows. Default: the window in front.'),
      'max': prop('integer', 'At most this many elements, up to 400. Default 150.'),
    },
    handler: (a, ctx) async {
      final script = File(p.join(ctx.tempDir, 'read_window.ps1'));
      if (!await script.exists()) await script.writeAsString(_uiaScript);
      final r = await Process.run(
        'powershell.exe',
        [
          '-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-File', script.path,
          '-hwnd', '${integer(a, 'window_id', fallback: 0)}',
          '-max', '${integer(a, 'max', fallback: 150, min: 10, max: 400)}',
        ],
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
      ).timeout(const Duration(seconds: 20), onTimeout: () => throw ToolRefused('That window took too long to describe. Try a screenshot instead.'));
      Map j;
      try {
        j = jsonDecode('${r.stdout}'.trim()) as Map;
      } catch (_) {
        throw StateError('Could not read the window. ${'${r.stderr}'.trim()}');
      }
      if (j['error'] != null) throw ToolRefused('${j['error']}');
      _elements.clear();
      final out = <Map<String, dynamic>>[];
      for (final e in (j['elements'] as List? ?? const [])) {
        if (e is! Map) continue;
        final el = (
          x: (e['x'] as num).round(),
          y: (e['y'] as num).round(),
          width: (e['w'] as num).round(),
          height: (e['h'] as num).round(),
          type: '${e['type']}',
          name: _short('${e['name'] ?? ''}', 150),
        );
        _elements.add(el);
        out.add({
          'n': _elements.length,
          'type': el.type,
          if (el.name.isNotEmpty) 'name': el.name,
          if (e['value'] != null && '${e['value']}'.isNotEmpty) 'value': _short('${e['value']}', 200),
          if (e['enabled'] == false) 'disabled': true,
          if (e['focused'] == true) 'focused': true,
        });
      }
      return {
        'window': j['title'],
        'elements': out,
        if (out.isEmpty) 'note': 'This window exposes no controls; use a screenshot and the mouse tools.',
      };
    },
  ),
  CompanionTool(
    name: 'click_element',
    title: 'Click an element',
    description: 'Clicks element n from the last read_window, in the middle.',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'n': prop('integer', 'The element number.'),
      'button': prop('string', 'left (default), right or middle.', choices: ['left', 'right', 'middle']),
      'double': prop('boolean', 'Double-click.'),
    },
    required: ['n'],
    handler: (a, ctx) async {
      final e = _element(a);
      win.click(e.x + e.width ~/ 2, e.y + e.height ~/ 2, button: '${a['button'] ?? 'left'}', times: flag(a, 'double') ? 2 : 1);
      await Future<void>.delayed(const Duration(milliseconds: 350));
      return {'clicked': '${e.type} ${e.name}'.trim(), 'active_window': win.foregroundTitle()};
    },
  ),
  CompanionTool(
    name: 'type_into',
    title: 'Type into an element',
    description: 'Clicks field n from the last read_window and types text into it, replacing what is there unless append is true. '
        'Set enter to press Enter afterwards (to search or send).',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'n': prop('integer', 'The field number.'),
      'text': prop('string', 'What to type.'),
      'append': prop('boolean', 'Keep the current text and add to it.'),
      'enter': prop('boolean', 'Press Enter after typing.'),
    },
    required: ['n', 'text'],
    handler: (a, ctx) async {
      final e = _element(a);
      win.click(e.x + e.width ~/ 2, e.y + e.height ~/ 2);
      await Future<void>.delayed(const Duration(milliseconds: 150));
      if (!flag(a, 'append')) {
        win.pressKeys('ctrl+a');
        win.pressKeys('delete');
      } else {
        win.pressKeys('ctrl+end');
      }
      win.typeText('${a['text'] ?? ''}');
      if (flag(a, 'enter')) win.pressKeys('enter');
      await Future<void>.delayed(const Duration(milliseconds: 250));
      return {'typed_into': '${e.type} ${e.name}'.trim(), 'chars': '${a['text'] ?? ''}'.length};
    },
  ),
  CompanionTool(
    name: 'do_actions',
    title: 'Do several steps',
    description: 'Runs up to $_maxSteps mouse and keyboard steps in one go (one approval), then optionally takes a screenshot. Each step is an object '
        'with "action": click {x,y,button?,double?} · move {x,y} · path {points,duration_ms?,hold?} (continuous movement, like mouse_path) · '
        'drag {from_x,from_y,to_x,to_y,duration_ms?,button?} · press {button?,x?,y?} · release {button?} · scroll {x,y,amount} · '
        'type {text} · keys {keys} · wait {ms} · click_element {n} · type_into {n,text,enter?} · focus_window {window_id} · open {target}. '
        'A button left pressed is let go at the end. x and y are pixels in the last screenshot.',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'steps': {
        'type': 'array',
        'description': 'The steps, in order.',
        'items': {'type': 'object'},
      },
      'screenshot_after': prop('boolean', 'Take a screenshot at the end (needs See the screen).'),
    },
    required: ['steps'],
    handler: (a, ctx) async {
      final steps = a['steps'];
      if (steps is! List || steps.isEmpty) throw ToolRefused('Give steps as a list.');
      if (steps.length > _maxSteps) throw ToolRefused('At most $_maxSteps steps at a time.');
      final stopAt = DateTime.now().add(const Duration(seconds: 28));
      var done = 0;
      await oneAtATime(() async {
        final held = <String>{};
        try {
          for (final raw in steps) {
            if (DateTime.now().isAfter(stopAt)) break;
            if (raw is! Map) throw ToolRefused('Step ${done + 1} is not an object.');
            final s = Map<String, dynamic>.from(raw);
            try {
              await _step(s, ctx, held, stopAt);
            } on ToolRefused catch (e) {
              throw ToolRefused('Step ${done + 1} (${s['action']}): ${e.message} ${done == 0 ? '' : 'The first $done steps were done.'}');
            }
            done++;
            // Pointer steps follow each other closely, so movement stays continuous.
            await Future<void>.delayed(Duration(milliseconds: _pointerSteps.contains(s['action']) ? 16 : 60));
          }
        } finally {
          held.forEach(win.mouseUp);
        }
      });
      final result = <String, dynamic>{'steps_done': done, 'active_window': win.foregroundTitle()};
      if (done < steps.length) result['note'] = 'Stopped after $done steps to stay within the time limit.';
      if (flag(a, 'screenshot_after') && ctx.config.seeScreen) {
        await Future<void>.delayed(const Duration(milliseconds: 300));
        final shot = await pcTools.firstWhere((t) => t.name == 'screenshot').handler({}, ctx);
        result['screenshot'] = shot;
      }
      return result;
    },
  ),
  CompanionTool(
    name: 'system_status',
    title: 'System status',
    description: 'CPU and memory use, disks and free space, battery, uptime and the busiest apps.',
    access: Access.read,
    feature: Feature.system,
    handler: (a, ctx) async {
      final j = await _ps(_statusScript);
      return j;
    },
  ),
  CompanionTool(
    name: 'list_processes',
    title: 'List running apps',
    description: 'Running processes sorted by memory or CPU time: id, name, memory, CPU seconds and window title.',
    access: Access.read,
    feature: Feature.system,
    properties: {
      'sort': prop('string', 'memory (default) or cpu.', choices: ['memory', 'cpu']),
      'name': prop('string', 'Only processes whose name contains this.'),
      'limit': prop('integer', 'At most this many, up to 100. Default 25.'),
    },
    handler: (a, ctx) async {
      final sort = a['sort'] == 'cpu' ? 'CPU' : 'WorkingSet64';
      final limit = integer(a, 'limit', fallback: 25, min: 1, max: 100);
      final name = '${a['name'] ?? ''}'.replaceAll("'", "''");
      return _ps("Get-Process ${name.isEmpty ? '' : "| Where-Object { \$_.ProcessName -like '*$name*' } "}"
          "| Sort-Object $sort -Descending | Select-Object -First $limit "
          "@{n='pid';e={\$_.Id}}, @{n='name';e={\$_.ProcessName}}, @{n='memory_mb';e={[math]::Round(\$_.WorkingSet64/1MB)}}, "
          "@{n='cpu_seconds';e={[math]::Round(\$_.CPU,1)}}, @{n='window';e={\$_.MainWindowTitle}} | ConvertTo-Json -Compress",
          wrap: 'processes');
    },
  ),
  CompanionTool(
    name: 'kill_process',
    title: 'Force-close an app',
    description: 'Ends a process at once by id or name (unsaved work in it is lost). To close politely, use window with action close.',
    access: Access.destructive,
    feature: Feature.system,
    properties: {
      'pid': prop('integer', 'Process id from list_processes.'),
      'name': prop('string', 'Or a process name like notepad (every process with that name).'),
    },
    handler: (a, ctx) async {
      if (a['pid'] != null) {
        final pid = integer(a, 'pid', fallback: 0);
        if (pid == pid_) throw ToolRefused('That is the companion itself.');
        if (!Process.killPid(pid)) throw ToolRefused('Could not end process $pid (gone, or it needs admin rights).');
        return {'ended': pid};
      }
      final name = str(a, 'name').replaceAll(RegExp(r'\.exe$', caseSensitive: false), '');
      if (!RegExp(r'^[\w .\-]+$').hasMatch(name)) throw ToolRefused('That is not a process name.');
      if (name.toLowerCase() == 'triangle_companion') throw ToolRefused('That is the companion itself.');
      final r = await Process.run('taskkill.exe', ['/IM', '$name.exe', '/F']);
      if (r.exitCode != 0) throw ToolRefused('${'${r.stderr}'.trim().isEmpty ? '${r.stdout}' : r.stderr}'.trim());
      return {'ended': name, 'output': '${r.stdout}'.trim()};
    },
  ),
  CompanionTool(
    name: 'media_control',
    title: 'Volume and media',
    description: 'Turns the volume up or down, mutes, or controls whatever is playing (play/pause, next, previous).',
    access: Access.modify,
    feature: Feature.system,
    properties: {
      'action': prop('string', 'What to do.', choices: ['volume_up', 'volume_down', 'mute', 'play_pause', 'next', 'previous']),
      'times': prop('integer', 'For volume: how many steps (each about 2%), 1–50. Default 5.'),
    },
    required: ['action'],
    handler: (a, ctx) async {
      final key = switch (str(a, 'action')) {
        'volume_up' => 'volumeup',
        'volume_down' => 'volumedown',
        'mute' => 'mute',
        'play_pause' => 'playpause',
        'next' => 'nexttrack',
        'previous' => 'prevtrack',
        _ => throw ToolRefused('Unknown action.'),
      };
      final times = key.startsWith('volume') ? integer(a, 'times', fallback: 5, min: 1, max: 50) : 1;
      for (var i = 0; i < times; i++) {
        win.pressKeys(key);
      }
      return {'done': a['action'], 'times': times};
    },
  ),
  CompanionTool(
    name: 'lock_pc',
    title: 'Lock the PC',
    description: 'Locks Windows (like Win+L). Nothing closes; unlocking needs the user\'s PIN or password at the PC.',
    access: Access.modify,
    feature: Feature.system,
    handler: (a, ctx) async {
      win.lockPc();
      return {'locked': true};
    },
  ),
  CompanionTool(
    name: 'power',
    title: 'Sleep, restart or shut down',
    description: 'Puts the PC to sleep, or restarts, shuts down or signs out after 30 seconds (cancel with action cancel). '
        'The companion stops answering until the PC is back.',
    access: Access.destructive,
    feature: Feature.system,
    properties: {
      'action': prop('string', 'What to do.', choices: ['sleep', 'restart', 'shutdown', 'sign_out', 'cancel']),
    },
    required: ['action'],
    handler: (a, ctx) async {
      final action = str(a, 'action');
      switch (action) {
        case 'sleep':
          // After answering, so the phone hears back.
          Timer(const Duration(seconds: 2), () {
            Process.run('powershell.exe', [
              '-NoProfile', '-Command',
              'Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState("Suspend", \$false, \$false)',
            ]);
          });
          return {'sleeping_in_seconds': 2};
        case 'restart' || 'shutdown':
          final r = await Process.run('shutdown.exe', [action == 'restart' ? '/r' : '/s', '/t', '30', '/c', 'Triangle asked for this. Cancel with: shutdown /a']);
          if (r.exitCode != 0) throw ToolRefused('${r.stderr}'.trim());
          return {action: 'in 30 seconds', 'cancel': 'power with action cancel'};
        case 'sign_out':
          Timer(const Duration(seconds: 2), () => Process.run('shutdown.exe', ['/l']));
          return {'signing_out_in_seconds': 2};
        case 'cancel':
          final r = await Process.run('shutdown.exe', ['/a']);
          return {'cancelled': r.exitCode == 0, if (r.exitCode != 0) 'note': 'Nothing was scheduled.'};
        default:
          throw ToolRefused('action is sleep, restart, shutdown, sign_out or cancel.');
      }
    },
  ),
];

/// This process, so kill_process can't end the companion.
final int pid_ = pid;

({int x, int y, int width, int height, String type, String name}) _element(Map<String, dynamic> a) {
  if (_elements.isEmpty) throw ToolRefused('Use read_window first.');
  final n = integer(a, 'n', fallback: 0);
  if (n < 1 || n > _elements.length) throw ToolRefused('Element numbers go from 1 to ${_elements.length}; read_window again if the window changed.');
  return _elements[n - 1];
}

const _maxSteps = 200;
const _pointerSteps = {'move', 'path', 'press', 'release'};

Future<void> _step(Map<String, dynamic> s, ToolContext ctx, Set<String> held, DateTime stopAt) async {
  ({int x, int y}) at(String xk, String yk) {
    if (!ctx.screen.taken) throw ToolRefused('Take a screenshot first: x and y are pixels in it.');
    return ctx.screen.toScreen(number(s, xk), number(s, yk));
  }

  switch ('${s['action']}') {
    case 'click':
      final p = at('x', 'y');
      win.click(p.x, p.y, button: '${s['button'] ?? 'left'}', times: flag(s, 'double') ? 2 : 1);
      await Future<void>.delayed(const Duration(milliseconds: 150));
    case 'move':
      final p = at('x', 'y');
      win.moveMouse(p.x, p.y);
    case 'path':
      final hold = s['hold'] as String?;
      final ms = integer(s, 'duration_ms', fallback: 400, min: 0, max: maxPathMs);
      await glide(pathPoints(s['points'], ctx), durationMs: ms, hold: hold, stopAt: stopAt);
    case 'drag':
      final f = at('from_x', 'from_y'), t = at('to_x', 'to_y');
      final ms = integer(s, 'duration_ms', fallback: 300, min: 0, max: maxPathMs);
      await glide([f, t], durationMs: ms, hold: '${s['button'] ?? 'left'}', stopAt: stopAt);
    case 'press':
      if (s['x'] != null) {
        final p = at('x', 'y');
        win.moveMouse(p.x, p.y);
      }
      final button = '${s['button'] ?? 'left'}';
      win.mouseDown(button);
      held.add(button);
    case 'release':
      final button = '${s['button'] ?? 'left'}';
      win.mouseUp(button);
      held.remove(button);
    case 'scroll':
      final p = at('x', 'y');
      win.scroll(p.x, p.y, integer(s, 'amount', fallback: -3, min: -50, max: 50));
    case 'type':
      final text = '${s['text'] ?? ''}';
      if (text.length > 5000) throw ToolRefused('Type at most 5000 characters at a time.');
      win.typeText(text);
    case 'keys':
      for (final k in str(s, 'keys').trim().split(RegExp(r'\s+'))) {
        try {
          win.pressKeys(k);
        } on ArgumentError catch (e) {
          throw ToolRefused('${e.message}');
        }
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
    case 'wait':
      await Future<void>.delayed(Duration(milliseconds: integer(s, 'ms', fallback: 500, min: 0, max: 5000)));
    case 'click_element':
      final e = _element(s);
      win.click(e.x + e.width ~/ 2, e.y + e.height ~/ 2);
      await Future<void>.delayed(const Duration(milliseconds: 150));
    case 'type_into':
      final e = _element(s);
      win.click(e.x + e.width ~/ 2, e.y + e.height ~/ 2);
      await Future<void>.delayed(const Duration(milliseconds: 120));
      win.pressKeys('ctrl+a');
      win.typeText('${s['text'] ?? ''}');
      if (flag(s, 'enter')) win.pressKeys('enter');
    case 'focus_window':
      if (!ctx.config.system) throw ToolRefused('"Apps & system" is off on the PC.');
      win.focusWindow(integer(s, 'window_id', fallback: 0));
      await Future<void>.delayed(const Duration(milliseconds: 250));
    case 'open':
      win.shellOpen(str(s, 'target'));
      await Future<void>.delayed(const Duration(milliseconds: 800));
    default:
      throw ToolRefused('Unknown action "${s['action']}".');
  }
}

String _short(String s, int max) => s.length <= max ? s : '${s.substring(0, max - 1)}…';

/// Runs a PowerShell snippet that prints JSON. [wrap] names a list answer.
Future<Map<String, dynamic>> _ps(String script, {String? wrap}) async {
  final r = await Process.run(
    'powershell.exe',
    ['-NoProfile', '-NonInteractive', '-Command', '[Console]::OutputEncoding=[Text.Encoding]::UTF8; $script'],
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  ).timeout(const Duration(seconds: 25));
  final out = '${r.stdout}'.trim();
  if (out.isEmpty) {
    if (wrap != null && r.exitCode == 0) return {wrap: <Object>[]};
    throw StateError('${r.stderr}'.trim());
  }
  final j = jsonDecode(out);
  if (wrap != null) return {wrap: j is List ? j : [j]};
  return Map<String, dynamic>.from(j as Map);
}

const _statusScript = r'''
$os = Get-CimInstance Win32_OperatingSystem
$cpu = (Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
$bat = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue | Select-Object -First 1
$top = Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 @{n='name';e={$_.ProcessName}}, @{n='cpu_seconds';e={[math]::Round($_.CPU,1)}}, @{n='memory_mb';e={[math]::Round($_.WorkingSet64/1MB)}}
[ordered]@{
  cpu_percent = [math]::Round($cpu)
  memory = [ordered]@{ total_gb = [math]::Round($os.TotalVisibleMemorySize/1MB,1); free_gb = [math]::Round($os.FreePhysicalMemory/1MB,1) }
  disks = @(Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object { [ordered]@{ drive = $_.DeviceID; total_gb = [math]::Round($_.Size/1GB); free_gb = [math]::Round($_.FreeSpace/1GB,1) } })
  battery = if ($bat) { [ordered]@{ percent = $bat.EstimatedChargeRemaining; charging = ($bat.BatteryStatus -eq 2) } } else { $null }
  uptime_hours = [math]::Round(((Get-Date) - $os.LastBootUpTime).TotalHours,1)
  busiest = @($top)
} | ConvertTo-Json -Depth 4 -Compress
''';

/// Lists a window's controls with UI Automation, as JSON. Per-monitor DPI
/// aware so the rectangles are real screen pixels.
const _uiaScript = r'''
param([long]$hwnd = 0, [int]$max = 150)
[Console]::OutputEncoding = [Text.Encoding]::UTF8
Add-Type @"
using System; using System.Runtime.InteropServices;
public static class TcNative {
  [DllImport("user32.dll")] public static extern bool SetProcessDpiAwarenessContext(IntPtr v);
  [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
}
"@
[TcNative]::SetProcessDpiAwarenessContext([IntPtr](-4)) | Out-Null
Add-Type -AssemblyName UIAutomationClient, UIAutomationTypes
try {
  if ($hwnd -eq 0) { $hwnd = [TcNative]::GetForegroundWindow().ToInt64() }
  $root = [System.Windows.Automation.AutomationElement]::FromHandle([IntPtr]$hwnd)
} catch { @{ error = 'That window is gone; use list_windows.' } | ConvertTo-Json -Compress; exit }
$keep = @('Button','Edit','Hyperlink','MenuItem','ListItem','TabItem','TreeItem','CheckBox','RadioButton','ComboBox','Text','Document','DataItem','SplitButton','MenuBarItem')
$cond = New-Object System.Windows.Automation.PropertyCondition([System.Windows.Automation.AutomationElement]::IsOffscreenProperty, $false)
$all = $root.FindAll([System.Windows.Automation.TreeScope]::Descendants, $cond)
$out = New-Object System.Collections.ArrayList
foreach ($e in $all) {
  if ($out.Count -ge $max) { break }
  try {
    $c = $e.Current
    $t = $c.ControlType.ProgrammaticName -replace '^ControlType\.', ''
    if ($keep -notcontains $t) { continue }
    $r = $c.BoundingRectangle
    if ($r.IsEmpty -or $r.Width -lt 2 -or $r.Height -lt 2) { continue }
    $name = $c.Name
    if (($t -eq 'Text' -or $t -eq 'ListItem' -or $t -eq 'DataItem') -and [string]::IsNullOrWhiteSpace($name)) { continue }
    $val = $null
    if ($t -eq 'Edit' -or $t -eq 'ComboBox' -or $t -eq 'Document') {
      try { $val = $e.GetCurrentPattern([System.Windows.Automation.ValuePattern]::Pattern).Current.Value } catch {}
      if ($val -and $val.Length -gt 300) { $val = $val.Substring(0, 300) }
    }
    [void]$out.Add([ordered]@{ type = $t; name = $name; value = $val; x = [int]$r.X; y = [int]$r.Y; w = [int]$r.Width; h = [int]$r.Height; enabled = $c.IsEnabled; focused = $c.HasKeyboardFocus })
  } catch {}
}
[ordered]@{ title = $root.Current.Name; elements = $out } | ConvertTo-Json -Depth 4 -Compress
''';
