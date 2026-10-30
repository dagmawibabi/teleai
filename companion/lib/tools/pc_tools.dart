import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../core/mcp_server.dart';
import '../core/path_guard.dart';
import '../native/capture.dart';
import '../native/windows.dart' as win;
import 'mouse_path.dart';
import 'tool.dart';

const _coords = 'x and y are pixels in the last screenshot (take one first).';

final pcTools = <CompanionTool>[
  CompanionTool(
    name: 'pc_info',
    title: 'About this PC',
    description: 'The PC\'s name, user, Windows version, screen size, shared folders and which abilities the user switched on. Start here.',
    access: Access.read,
    feature: Feature.info,
    handler: (a, ctx) async {
      final screen = win.virtualScreen();
      final c = ctx.config;
      return {
        'computer': Platform.localHostname,
        'user': Platform.environment['USERNAME'] ?? '',
        'windows': Platform.operatingSystemVersion,
        'time': DateTime.now().toIso8601String(),
        'screen': {'width': screen.width, 'height': screen.height},
        'monitors': [
          for (final (i, m) in listMonitors().indexed) {'monitor': i, 'width': m.width, 'height': m.height, 'primary': m.primary},
        ],
        'shared_folders': [for (final f in c.folders) {'name': f.name, 'path': f.path, 'changes_allowed': f.writable}],
        'abilities': {
          'files': c.folders.isNotEmpty,
          'see_screen': c.seeScreen,
          'control_mouse_and_keyboard': c.controlInput,
          'clipboard': c.clipboard,
          'run_commands': c.runCommands,
          'apps_and_system': c.system,
        },
        'tips': 'Use read_window to get a window\'s buttons and fields as numbered elements and click_element to use them: '
            'faster and more exact than guessing from screenshots. Chain several steps in one do_actions call, '
            'and use mouse_path for continuous movement instead of many mouse_move calls.',
        'changes_need_approval_on_pc': c.askOnPc,
        'companion_version': McpServer.version,
      };
    },
  ),
  CompanionTool(
    name: 'screenshot',
    title: 'Take a screenshot',
    description: 'Captures the PC screen (one monitor, one window, all monitors, or a region to zoom in) and returns a link to the picture. '
        'Look at it with your image tool. Mouse tools take x and y in this picture\'s pixels.',
    access: Access.read,
    feature: Feature.screen,
    properties: {
      'region': {
        'type': 'object',
        'description': 'Only this part, in pixels of the previous screenshot, to see details.',
        'properties': {
          'x': prop('integer', 'Left edge.'),
          'y': prop('integer', 'Top edge.'),
          'width': prop('integer', 'Width.'),
          'height': prop('integer', 'Height.'),
        },
        'required': ['x', 'y', 'width', 'height'],
      },
      'monitor': prop('integer', 'Only this monitor (0 is the main one; see pc_info). Default: all monitors.'),
      'window_id': prop('integer', 'Only this window (from list_windows).'),
      'max_width': prop('integer', 'Shrink the picture to at most this wide, 400–2560. Default 1600.'),
    },
    handler: (a, ctx) async {
      final screen = win.virtualScreen();
      var (x, y, w, h) = (screen.x, screen.y, screen.width, screen.height);
      if (a['monitor'] != null) {
        final all = listMonitors();
        final i = integer(a, 'monitor', fallback: 0);
        if (i < 0 || i >= all.length) throw ToolRefused('There are ${all.length} monitors (0 to ${all.length - 1}).');
        (x, y, w, h) = (all[i].x, all[i].y, all[i].width, all[i].height);
      } else if (a['window_id'] != null) {
        final wi = win.window(integer(a, 'window_id', fallback: 0));
        if (wi == null) throw ToolRefused('That window is gone; use list_windows.');
        if (wi.minimized) throw ToolRefused('That window is minimized; focus it first.');
        (x, y, w, h) = (wi.x, wi.y, wi.width, wi.height);
        x = x.clamp(screen.x, screen.x + screen.width - 1);
        y = y.clamp(screen.y, screen.y + screen.height - 1);
        w = w.clamp(1, screen.x + screen.width - x);
        h = h.clamp(1, screen.y + screen.height - y);
      }
      if (a['region'] is Map) {
        final r = Map<String, dynamic>.from(a['region'] as Map);
        final from = ctx.screen.taken ? ctx.screen.toScreen(number(r, 'x'), number(r, 'y')) : (x: screen.x + number(r, 'x').round(), y: screen.y + number(r, 'y').round());
        final scale = ctx.screen.taken ? ctx.screen.scale : 1.0;
        x = from.x;
        y = from.y;
        w = (number(r, 'width') / scale).round();
        h = (number(r, 'height') / scale).round();
        // Keep it on the desktop.
        x = x.clamp(screen.x, screen.x + screen.width - 1);
        y = y.clamp(screen.y, screen.y + screen.height - 1);
        w = w.clamp(1, screen.x + screen.width - x);
        h = h.clamp(1, screen.y + screen.height - y);
      }
      final source = (x: x, y: y, width: w, height: h);
      final size = fit(source, integer(a, 'max_width', fallback: 1600, min: 400, max: 2560));
      final jpg = captureJpeg(source, outWidth: size.width, outHeight: size.height, quality: 75);
      final scale = jpg.width / w;
      ctx.screen
        ..originX = x
        ..originY = y
        ..scale = scale
        ..taken = true;
      final file = File(p.join(ctx.tempDir, 'screenshot-${DateTime.now().millisecondsSinceEpoch}.jpg'));
      await file.writeAsBytes(jpg.jpeg);
      return {
        'image_url': ctx.link(file.path, const Duration(minutes: 10), temporary: true),
        'width': jpg.width,
        'height': jpg.height,
        'active_window': win.foregroundTitle(),
        'note': 'Open image_url with your image tool to see it. Mouse tools use this picture\'s pixels.',
      };
    },
  ),
  CompanionTool(
    name: 'mouse_click',
    title: 'Click',
    description: 'Clicks at a point. $_coords',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'x': prop('number', 'Across, in screenshot pixels.'),
      'y': prop('number', 'Down, in screenshot pixels.'),
      'button': prop('string', 'left (default), right or middle.', choices: ['left', 'right', 'middle']),
      'double': prop('boolean', 'Double-click.'),
    },
    required: ['x', 'y'],
    handler: (a, ctx) async {
      final at = _point(a, ctx);
      win.click(at.x, at.y, button: '${a['button'] ?? 'left'}', times: flag(a, 'double') ? 2 : 1);
      await _settle();
      return {'clicked': true, 'screen_x': at.x, 'screen_y': at.y, 'active_window': win.foregroundTitle()};
    },
  ),
  CompanionTool(
    name: 'mouse_move',
    title: 'Move the mouse',
    description: 'Moves the pointer straight to one point, for menus that open on hover. For a smooth or multi-point movement use mouse_path. $_coords',
    access: Access.modify,
    feature: Feature.input,
    properties: {'x': prop('number', 'Across.'), 'y': prop('number', 'Down.')},
    required: ['x', 'y'],
    handler: (a, ctx) async {
      final at = _point(a, ctx);
      win.moveMouse(at.x, at.y);
      return {'moved': true};
    },
  ),
  CompanionTool(
    name: 'mouse_path',
    title: 'Move along a path',
    description: 'Moves the mouse continuously through many points in one call, with no steps in between: tracing a shape, drawing, '
        'hovering along a menu, moving a slider. Without hold it starts from where the pointer is. With hold it goes to the first point, '
        'presses that button, moves through the rest and lets go. $_coords',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'points': {
        'type': 'array',
        'description': 'Up to $maxPathPoints points in order.',
        'items': {
          'type': 'object',
          'properties': {'x': prop('number', 'Across.'), 'y': prop('number', 'Down.')},
          'required': ['x', 'y'],
        },
      },
      'duration_ms': prop('integer', 'How long the whole movement takes, 0–$maxPathMs. Default 400.'),
      'hold': prop('string', 'A button to keep pressed during the movement.', choices: ['left', 'right', 'middle']),
    },
    required: ['points'],
    handler: (a, ctx) async {
      _needsScreenshot(ctx);
      final points = pathPoints(a['points'], ctx);
      final hold = a['hold'] as String?;
      if (hold != null && points.length < 2) throw ToolRefused('Dragging needs at least 2 points.');
      await oneAtATime(() => glide(points, durationMs: integer(a, 'duration_ms', fallback: 400, min: 0, max: maxPathMs), hold: hold));
      await _settle();
      return {'moved': true, 'points': points.length, 'active_window': win.foregroundTitle()};
    },
  ),
  CompanionTool(
    name: 'mouse_drag',
    title: 'Drag',
    description: 'Presses a button at one point, drags to another and lets go. For a curved drag use mouse_path with hold. $_coords',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'from_x': prop('number', 'Start, across.'),
      'from_y': prop('number', 'Start, down.'),
      'to_x': prop('number', 'End, across.'),
      'to_y': prop('number', 'End, down.'),
      'duration_ms': prop('integer', 'How long the drag takes, 0–$maxPathMs. Default 300.'),
      'button': prop('string', 'left (default), right or middle.', choices: ['left', 'right', 'middle']),
    },
    required: ['from_x', 'from_y', 'to_x', 'to_y'],
    handler: (a, ctx) async {
      _needsScreenshot(ctx);
      final from = ctx.screen.toScreen(number(a, 'from_x'), number(a, 'from_y'));
      final to = ctx.screen.toScreen(number(a, 'to_x'), number(a, 'to_y'));
      await oneAtATime(() => glide([from, to], durationMs: integer(a, 'duration_ms', fallback: 300, min: 0, max: maxPathMs), hold: '${a['button'] ?? 'left'}'));
      await _settle();
      return {'dragged': true};
    },
  ),
  CompanionTool(
    name: 'scroll',
    title: 'Scroll',
    description: 'Scrolls the window under a point. Positive amount scrolls up (or right), negative down (or left); one unit is one wheel notch. $_coords',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'x': prop('number', 'Across.'),
      'y': prop('number', 'Down.'),
      'amount': prop('integer', 'Wheel notches, -50 to 50. Use -5 to scroll down a page or so.'),
      'horizontal': prop('boolean', 'Scroll sideways.'),
    },
    required: ['x', 'y', 'amount'],
    handler: (a, ctx) async {
      final at = _point(a, ctx);
      win.scroll(at.x, at.y, integer(a, 'amount', fallback: -3, min: -50, max: 50), horizontal: flag(a, 'horizontal'));
      await _settle();
      return {'scrolled': true};
    },
  ),
  CompanionTool(
    name: 'type_text',
    title: 'Type text',
    description: 'Types text into whatever has focus, as if typed on the keyboard (any language, emoji too). New lines press Enter. Click the field first.',
    access: Access.modify,
    feature: Feature.input,
    properties: {'text': prop('string', 'The text, up to 5000 characters.')},
    required: ['text'],
    handler: (a, ctx) async {
      final text = '${a['text'] ?? ''}';
      if (text.length > 5000) throw ToolRefused('Type at most 5000 characters at a time.');
      win.typeText(text);
      return {'typed_chars': text.length};
    },
  ),
  CompanionTool(
    name: 'press_keys',
    title: 'Press keys',
    description: 'Presses a key or shortcut, held together: enter, esc, tab, ctrl+c, ctrl+shift+t, alt+tab, alt+f4, win+d, win+r, f5, '
        'up/down/left/right, pageup, home, delete, volumeup, playpause… Separate several presses with spaces: "ctrl+a ctrl+c".',
    access: Access.modify,
    feature: Feature.input,
    properties: {'keys': prop('string', 'For example ctrl+s, or "win+r" then use type_text.')},
    required: ['keys'],
    handler: (a, ctx) async {
      final combos = str(a, 'keys').trim().split(RegExp(r'\s+'));
      if (combos.length > 20) throw ToolRefused('At most 20 presses at a time.');
      for (final c in combos) {
        try {
          win.pressKeys(c);
        } on ArgumentError catch (e) {
          throw ToolRefused('${e.message}');
        }
        await Future<void>.delayed(const Duration(milliseconds: 60));
      }
      await _settle();
      return {'pressed': combos, 'active_window': win.foregroundTitle()};
    },
  ),
  CompanionTool(
    name: 'open',
    title: 'Open an app, file or link',
    description: 'Opens something the way double-clicking would: an app (notepad, calc, chrome, ms-settings:, explorer), '
        'a file or folder path, or a web address in the default browser.',
    access: Access.modify,
    feature: Feature.input,
    properties: {
      'target': prop('string', 'App name, path or URL.'),
      'arguments': prop('string', 'Optional command-line arguments for an app.'),
    },
    required: ['target'],
    handler: (a, ctx) async {
      final target = str(a, 'target');
      win.shellOpen(target, args: '${a['arguments'] ?? ''}');
      await Future<void>.delayed(const Duration(milliseconds: 800));
      return {'opened': target, 'active_window': win.foregroundTitle()};
    },
  ),
  CompanionTool(
    name: 'read_clipboard',
    title: 'Read the clipboard',
    description: 'The text currently copied on the PC.',
    access: Access.read,
    feature: Feature.clipboard,
    handler: (a, ctx) async {
      final text = win.readClipboard();
      return {'text': text.length > 100000 ? text.substring(0, 100000) : text, 'chars': text.length};
    },
  ),
  CompanionTool(
    name: 'write_clipboard',
    title: 'Copy to the clipboard',
    description: 'Puts text on the PC\'s clipboard, ready to paste.',
    access: Access.modify,
    feature: Feature.clipboard,
    properties: {'text': prop('string', 'The text.')},
    required: ['text'],
    handler: (a, ctx) async {
      win.writeClipboard('${a['text'] ?? ''}');
      return {'copied': true};
    },
  ),
  CompanionTool(
    name: 'run_command',
    title: 'Run a PowerShell command',
    description: 'Runs a PowerShell command on the PC as the user and returns its output. Waits up to wait_seconds; '
        'a command still running then keeps going and returns a job_id for command_status. Can change anything the user can: be careful.',
    access: Access.destructive,
    feature: Feature.commands,
    properties: {
      'command': prop('string', 'PowerShell, e.g. Get-Process | Sort CPU -desc | Select -First 5'),
      'folder': prop('string', 'Working folder. Default: the user\'s home folder.'),
      'wait_seconds': prop('integer', 'How long to wait for it, 1–15. Default 10.'),
    },
    required: ['command'],
    handler: (a, ctx) async {
      final folder = a['folder'] == null ? (Platform.environment['USERPROFILE'] ?? Directory.current.path) : str(a, 'folder');
      if (!Directory(folder).existsSync()) throw ToolRefused('No folder at $folder.');
      final job = await _Job.start(str(a, 'command'), folder);
      await job.wait(Duration(seconds: integer(a, 'wait_seconds', fallback: 10, min: 1, max: 15)));
      return job.report();
    },
  ),
  CompanionTool(
    name: 'command_status',
    title: 'Check a command',
    description: 'Output so far of a command run_command left running, and whether it finished.',
    access: Access.read,
    feature: Feature.commands,
    properties: {
      'job_id': prop('string', 'From run_command.'),
      'stop': prop('boolean', 'Stop it.'),
    },
    required: ['job_id'],
    handler: (a, ctx) async {
      final job = _Job.jobs[str(a, 'job_id')];
      if (job == null) throw ToolRefused('No command with that job_id (jobs are kept for an hour).');
      if (flag(a, 'stop')) job.process.kill();
      await job.wait(const Duration(seconds: 3));
      return job.report();
    },
  ),
];

({int x, int y}) _point(Map<String, dynamic> a, ToolContext ctx) {
  _needsScreenshot(ctx);
  return ctx.screen.toScreen(number(a, 'x'), number(a, 'y'));
}

void _needsScreenshot(ToolContext ctx) {
  if (!ctx.screen.taken) {
    throw ToolRefused(ctx.config.seeScreen
        ? 'Take a screenshot first: x and y are pixels in it.'
        : 'Mouse tools need a screenshot to aim, and "See the screen" is off on the PC.');
  }
}

/// A moment for the PC to react before the next screenshot.
Future<void> _settle() => Future<void>.delayed(const Duration(milliseconds: 350));

/// A PowerShell command and its output.
class _Job {
  _Job(this.id, this.process);

  static final jobs = <String, _Job>{};
  static var _next = 0;
  static const _cap = 30000;

  final String id;
  final Process process;
  final _out = StringBuffer(), _err = StringBuffer();
  int? exitCode;
  final _started = DateTime.now();

  static Future<_Job> start(String command, String folder) async {
    jobs.removeWhere((_, j) => j.exitCode != null && DateTime.now().difference(j._started) > const Duration(hours: 1));
    final process = await Process.start(
      'powershell.exe',
      ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-Command', '[Console]::OutputEncoding=[Text.Encoding]::UTF8; $command'],
      workingDirectory: folder,
    );
    final job = _Job('job${++_next}', process);
    jobs[job.id] = job;
    process.stdout.transform(const Utf8Decoder(allowMalformed: true)).listen((s) => _append(job._out, s));
    process.stderr.transform(const Utf8Decoder(allowMalformed: true)).listen((s) => _append(job._err, s));
    unawaited(process.exitCode.then((c) => job.exitCode = c));
    await process.stdin.close();
    return job;
  }

  static void _append(StringBuffer b, String s) {
    if (b.length < _cap) b.write(s.length + b.length > _cap ? s.substring(0, _cap - b.length) : s);
  }

  Future<void> wait(Duration d) => process.exitCode.then((_) {}).timeout(d, onTimeout: () {});

  Map<String, dynamic> report() => {
        'job_id': id,
        'finished': exitCode != null,
        'exit_code': ?exitCode,
        'output': _out.toString(),
        if (_err.isNotEmpty) 'errors': _err.toString(),
        if (_out.length >= _cap) 'note': 'Output was cut at $_cap characters.',
        if (exitCode == null) 'still_running': 'Check again with command_status.',
      };
}
