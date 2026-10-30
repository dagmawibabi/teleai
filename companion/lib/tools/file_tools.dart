import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../core/path_guard.dart';
import 'tool.dart';

const _pathHelp = 'A full path (C:\\Users\\me\\Documents\\notes.txt) or one starting with a shared folder\'s name (Documents/notes.txt).';

final fileTools = <CompanionTool>[
  CompanionTool(
    name: 'list_folder',
    title: 'List a folder',
    description: 'Lists what is in a shared folder: name, type, size and when it changed. Without a path, lists the shared folders themselves.',
    access: Access.read,
    feature: Feature.files,
    properties: {
      'path': prop('string', 'The folder. $_pathHelp Leave out for the shared folders.'),
      'offset': prop('integer', 'Skip this many entries (for long folders).'),
      'limit': prop('integer', 'At most this many entries, up to 500. Default 200.'),
    },
    handler: (a, ctx) async {
      if (a['path'] == null || '${a['path']}'.trim().isEmpty) {
        return {
          'shared_folders': [
            for (final f in ctx.config.folders) {'name': f.name, 'path': f.path, 'changes_allowed': f.writable},
          ],
        };
      }
      final dir = Directory(ctx.guard.resolve(str(a, 'path')));
      if (!await dir.exists()) throw ToolRefused('No folder at ${dir.path}.');
      final offset = integer(a, 'offset', fallback: 0, min: 0), limit = integer(a, 'limit', fallback: 200, min: 1, max: 500);
      final all = <Map<String, dynamic>>[];
      await for (final e in dir.list(followLinks: false).handleError((_) {})) {
        all.add(await _entry(e));
      }
      all.sort((x, y) {
        final f = (x['type'] == 'folder' ? 0 : 1) - (y['type'] == 'folder' ? 0 : 1);
        return f != 0 ? f : '${x['name']}'.toLowerCase().compareTo('${y['name']}'.toLowerCase());
      });
      final page = all.skip(offset).take(limit).toList();
      return {
        'path': dir.path,
        'total': all.length,
        'entries': page,
        if (offset + page.length < all.length) 'next_offset': offset + page.length,
      };
    },
  ),
  CompanionTool(
    name: 'search_files',
    title: 'Search files',
    description: 'Finds files and folders by name (case-insensitive; * and ? wildcards work) inside the shared folders, '
        'optionally only those containing some text. Stops after 15 seconds or the limit.',
    access: Access.read,
    feature: Feature.files,
    properties: {
      'query': prop('string', 'Part of the name, or a pattern like *.pdf or report*2026*.'),
      'path': prop('string', 'Search only under this folder. Default: every shared folder.'),
      'containing': prop('string', 'Only text files (under 2 MB) that contain this text.'),
      'limit': prop('integer', 'At most this many results, up to 200. Default 50.'),
    },
    required: ['query'],
    handler: (a, ctx) async {
      final query = str(a, 'query').toLowerCase();
      final pattern = query.contains('*') || query.contains('?')
          ? RegExp('^${RegExp.escape(query).replaceAll(r'\*', '.*').replaceAll(r'\?', '.')}\$')
          : null;
      final containing = (a['containing'] as String?)?.toLowerCase();
      final limit = integer(a, 'limit', fallback: 50, min: 1, max: 200);
      final roots = a['path'] == null || '${a['path']}'.trim().isEmpty
          ? [for (final f in ctx.config.folders) ctx.guard.resolve(f.path)]
          : [ctx.guard.resolve(str(a, 'path'))];
      final found = <Map<String, dynamic>>[];
      final stopAt = DateTime.now().add(const Duration(seconds: 15));
      var timedOut = false;
      outer:
      for (final root in roots) {
        await for (final e in Directory(root).list(recursive: true, followLinks: false).handleError((_) {})) {
          if (DateTime.now().isAfter(stopAt)) {
            timedOut = true;
            break outer;
          }
          final name = p.basename(e.path).toLowerCase();
          if (pattern != null ? !pattern.hasMatch(name) : !name.contains(query)) continue;
          if (containing != null) {
            if (e is! File || !await _contains(e, containing)) continue;
          }
          found.add({...await _entry(e), 'path': e.path});
          if (found.length >= limit) break outer;
        }
      }
      final note = timedOut
          ? 'Stopped after 15 seconds; search a smaller folder for the rest.'
          : (found.length >= limit ? 'Stopped at the limit; narrow the search for more.' : null);
      return {'results': found, 'note': ?note};
    },
  ),
  CompanionTool(
    name: 'read_file',
    title: 'Read a file',
    description: 'Reads a text file (code, notes, CSV, logs, JSON…). Long files come in parts: pass next_offset back as offset. '
        'For pictures, PDFs and other binary files use share_file.',
    access: Access.read,
    feature: Feature.files,
    properties: {
      'path': prop('string', 'The file. $_pathHelp'),
      'offset': prop('integer', 'Start at this character. Default 0.'),
      'max_chars': prop('integer', 'At most this many characters, up to 100000. Default 40000.'),
    },
    required: ['path'],
    handler: (a, ctx) async {
      final file = File(ctx.guard.resolve(str(a, 'path')));
      if (!await file.exists()) throw ToolRefused('No file at ${file.path}.');
      final size = await file.length();
      if (size > 20 * 1024 * 1024) throw ToolRefused('${file.path} is ${_mb(size)}; use share_file to download it.');
      final bytes = await file.readAsBytes();
      if (_binary(bytes)) {
        return {'path': file.path, 'size': size, 'binary': true, 'note': 'Not a text file. Use share_file to get a download link.'};
      }
      final text = _decode(bytes);
      final offset = integer(a, 'offset', fallback: 0, min: 0, max: text.length);
      final max = integer(a, 'max_chars', fallback: 40000, min: 1, max: 100000);
      final end = offset + max > text.length ? text.length : offset + max;
      return {
        'path': file.path,
        'total_chars': text.length,
        'text': text.substring(offset, end),
        if (end < text.length) 'next_offset': end,
      };
    },
  ),
  CompanionTool(
    name: 'file_info',
    title: 'File details',
    description: 'Size, type and dates of a file or folder; for a folder, how many items it holds.',
    access: Access.read,
    feature: Feature.files,
    properties: {'path': prop('string', 'The file or folder. $_pathHelp')},
    required: ['path'],
    handler: (a, ctx) async {
      final path = ctx.guard.resolve(str(a, 'path'));
      final type = await FileSystemEntity.type(path, followLinks: false);
      if (type == FileSystemEntityType.notFound) throw ToolRefused('Nothing at $path.');
      final stat = await FileStat.stat(path);
      return {
        'path': path,
        'type': type == FileSystemEntityType.directory ? 'folder' : (type == FileSystemEntityType.link ? 'link' : 'file'),
        'size': stat.size,
        'size_text': _mb(stat.size),
        'modified': iso(stat.modified),
        'accessed': iso(stat.accessed),
        if (type == FileSystemEntityType.directory) 'items': await Directory(path).list().handleError((_) {}).length,
      };
    },
  ),
  CompanionTool(
    name: 'share_file',
    title: 'Get a download link',
    description: 'Makes a private download link for a file (any type or size), valid for a few minutes. '
        'Download it to the phone with your download tool, or look at a picture with your image tool.',
    access: Access.read,
    feature: Feature.files,
    properties: {
      'path': prop('string', 'The file. $_pathHelp'),
      'minutes': prop('integer', 'How long the link works, 1–60. Default 15.'),
    },
    required: ['path'],
    handler: (a, ctx) async {
      final file = File(ctx.guard.resolve(str(a, 'path')));
      if (!await file.exists()) throw ToolRefused('No file at ${file.path}.');
      final minutes = integer(a, 'minutes', fallback: 15, min: 1, max: 60);
      final size = await file.length();
      return {
        'url': ctx.link(file.path, Duration(minutes: minutes)),
        'name': p.basename(file.path),
        'size': size,
        'size_text': _mb(size),
        'expires_in_minutes': minutes,
      };
    },
  ),
  CompanionTool(
    name: 'write_file',
    title: 'Write a file',
    description: 'Writes text to a file in a folder shared with changes allowed. Mode create (default) refuses to replace a file; '
        'append adds to the end; overwrite replaces the whole file.',
    access: Access.modify,
    feature: Feature.files,
    properties: {
      'path': prop('string', 'The file. $_pathHelp'),
      'content': prop('string', 'The text to write.'),
      'mode': prop('string', 'create, append or overwrite.', choices: ['create', 'append', 'overwrite']),
    },
    required: ['path', 'content'],
    handler: (a, ctx) async {
      final file = File(ctx.guard.resolve(str(a, 'path'), write: true));
      final mode = '${a['mode'] ?? 'create'}';
      final exists = await file.exists();
      if (mode == 'create' && exists) throw ToolRefused('${file.path} already exists. Use mode append or overwrite.');
      await file.parent.create(recursive: true);
      await file.writeAsString('${a['content'] ?? ''}', mode: mode == 'append' ? FileMode.append : FileMode.write, flush: true);
      return {'path': file.path, 'size': await file.length(), 'action': exists ? (mode == 'append' ? 'appended' : 'replaced') : 'created'};
    },
  ),
  CompanionTool(
    name: 'make_folder',
    title: 'Make a folder',
    description: 'Creates a folder (and any missing parents) in a folder shared with changes allowed.',
    access: Access.modify,
    feature: Feature.files,
    properties: {'path': prop('string', 'The new folder. $_pathHelp')},
    required: ['path'],
    handler: (a, ctx) async {
      final dir = Directory(ctx.guard.resolve(str(a, 'path'), write: true));
      await dir.create(recursive: true);
      return {'path': dir.path, 'created': true};
    },
  ),
  CompanionTool(
    name: 'move',
    title: 'Move or rename',
    description: 'Moves or renames a file or folder. Both places must be in folders shared with changes allowed. Never replaces something already there.',
    access: Access.modify,
    feature: Feature.files,
    properties: {
      'from': prop('string', 'What to move. $_pathHelp'),
      'to': prop('string', 'The new path, including the name.'),
    },
    required: ['from', 'to'],
    handler: (a, ctx) async {
      final from = ctx.guard.resolve(str(a, 'from'), write: true);
      final to = ctx.guard.resolve(str(a, 'to'), write: true);
      if (await FileSystemEntity.type(from, followLinks: false) == FileSystemEntityType.notFound) throw ToolRefused('Nothing at $from.');
      if (await FileSystemEntity.type(to, followLinks: false) != FileSystemEntityType.notFound) throw ToolRefused('$to already exists.');
      await Directory(p.dirname(to)).create(recursive: true);
      final type = await FileSystemEntity.type(from, followLinks: false);
      if (type == FileSystemEntityType.directory) {
        await Directory(from).rename(to);
      } else {
        await File(from).rename(to);
      }
      return {'from': from, 'to': to, 'moved': true};
    },
  ),
  CompanionTool(
    name: 'copy',
    title: 'Copy',
    description: 'Copies a file, or a folder with everything in it, into a folder shared with changes allowed. Never replaces something already there.',
    access: Access.modify,
    feature: Feature.files,
    properties: {
      'from': prop('string', 'What to copy. $_pathHelp'),
      'to': prop('string', 'The new path, including the name.'),
    },
    required: ['from', 'to'],
    handler: (a, ctx) async {
      final from = ctx.guard.resolve(str(a, 'from'));
      final to = ctx.guard.resolve(str(a, 'to'), write: true);
      if (await FileSystemEntity.type(to, followLinks: false) != FileSystemEntityType.notFound) throw ToolRefused('$to already exists.');
      final type = await FileSystemEntity.type(from, followLinks: false);
      if (type == FileSystemEntityType.notFound) throw ToolRefused('Nothing at $from.');
      var files = 0;
      if (type == FileSystemEntityType.directory) {
        if (p.isWithin(from.toLowerCase(), to.toLowerCase())) throw ToolRefused('Can\'t copy a folder into itself.');
        await for (final e in Directory(from).list(recursive: true, followLinks: false)) {
          final target = p.join(to, p.relative(e.path, from: from));
          if (e is Directory) {
            await Directory(target).create(recursive: true);
          } else if (e is File) {
            await Directory(p.dirname(target)).create(recursive: true);
            await e.copy(target);
            files++;
          }
        }
        await Directory(to).create(recursive: true);
      } else {
        await Directory(p.dirname(to)).create(recursive: true);
        await File(from).copy(to);
        files = 1;
      }
      return {'from': from, 'to': to, 'files_copied': files};
    },
  ),
  CompanionTool(
    name: 'download_to_pc',
    title: 'Download to the PC',
    description: 'Downloads a web address (http or https) into a folder shared with changes allowed, for example a file '
        'the phone uploaded somewhere, or a link the user sent. Big downloads keep going after the answer; check with file_info.',
    access: Access.modify,
    feature: Feature.files,
    properties: {
      'url': prop('string', 'The http(s) address.'),
      'path': prop('string', 'Where to save it, including the file name. $_pathHelp'),
    },
    required: ['url', 'path'],
    handler: (a, ctx) async {
      final uri = Uri.tryParse(str(a, 'url'));
      if (uri == null || !(uri.scheme == 'http' || uri.scheme == 'https')) throw ToolRefused('Give an http or https address.');
      final file = File(ctx.guard.resolve(str(a, 'path'), write: true));
      if (await file.exists()) throw ToolRefused('${file.path} already exists.');
      await file.parent.create(recursive: true);
      var finished = false;
      Object? error;
      final watch = _download(uri, file).then((_) => finished = true, onError: (Object e) {
        error = e;
        finished = true;
      });
      await Future.any([watch, Future<void>.delayed(const Duration(seconds: 20))]);
      if (error != null) throw error!;
      if (!finished) {
        return {'path': file.path, 'status': 'still downloading', 'note': 'Check later with file_info.'};
      }
      return {'path': file.path, 'status': 'done', 'size': await file.length()};
    },
  ),
  CompanionTool(
    name: 'delete',
    title: 'Delete',
    description: 'Moves a file or folder to the Recycle Bin (it can be restored from there). Only in folders shared with changes allowed.',
    access: Access.destructive,
    feature: Feature.files,
    properties: {'path': prop('string', 'What to delete. $_pathHelp')},
    required: ['path'],
    handler: (a, ctx) async {
      final path = ctx.guard.resolve(str(a, 'path'), write: true);
      final isRoot = ctx.config.folders.any((f) => p.equals(f.path.toLowerCase(), path.toLowerCase()));
      if (isRoot) throw ToolRefused('A shared folder itself can\'t be deleted.');
      final type = await FileSystemEntity.type(path, followLinks: false);
      if (type == FileSystemEntityType.notFound) throw ToolRefused('Nothing at $path.');
      final method = type == FileSystemEntityType.directory ? 'DeleteDirectory' : 'DeleteFile';
      final r = await Process.run(
        'powershell.exe',
        [
          '-NoProfile',
          '-NonInteractive',
          '-Command',
          'Add-Type -AssemblyName Microsoft.VisualBasic; '
              "[Microsoft.VisualBasic.FileIO.FileSystem]::$method(\$env:TC_TARGET, 'OnlyErrorDialogs', 'SendToRecycleBin')",
        ],
        environment: {'TC_TARGET': path},
      );
      if (r.exitCode != 0 || await FileSystemEntity.type(path, followLinks: false) != FileSystemEntityType.notFound) {
        throw StateError('Could not move it to the Recycle Bin. ${'${r.stderr}'.trim()}');
      }
      return {'path': path, 'deleted': true, 'recycle_bin': true};
    },
  ),
];

Future<Map<String, dynamic>> _entry(FileSystemEntity e) async {
  FileStat? stat;
  try {
    stat = await e.stat();
  } catch (_) {}
  return {
    'name': p.basename(e.path),
    'type': typeOf(e),
    if (e is File && stat != null) 'size': stat.size,
    if (stat != null) 'modified': iso(stat.modified),
  };
}

Future<bool> _contains(File f, String text) async {
  try {
    if (await f.length() > 2 * 1024 * 1024) return false;
    final bytes = await f.readAsBytes();
    if (_binary(bytes)) return false;
    return _decode(bytes).toLowerCase().contains(text);
  } catch (_) {
    return false;
  }
}

bool _binary(List<int> bytes) {
  if (bytes.length >= 2 && ((bytes[0] == 0xFF && bytes[1] == 0xFE) || (bytes[0] == 0xFE && bytes[1] == 0xFF))) return false;
  final n = bytes.length < 8000 ? bytes.length : 8000;
  for (var i = 0; i < n; i++) {
    if (bytes[i] == 0) return true;
  }
  return false;
}

String _decode(List<int> bytes) {
  if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xFE) {
    // UTF-16 LE, as Notepad and PowerShell often write.
    final units = <int>[for (var i = 2; i + 1 < bytes.length; i += 2) bytes[i] | (bytes[i + 1] << 8)];
    return String.fromCharCodes(units);
  }
  final start = bytes.length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF ? 3 : 0;
  return utf8.decode(bytes.sublist(start), allowMalformed: true);
}

String _mb(int bytes) => bytes < 1024
    ? '$bytes B'
    : bytes < 1024 * 1024
        ? '${(bytes / 1024).toStringAsFixed(1)} KB'
        : bytes < 1024 * 1024 * 1024
            ? '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB'
            : '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';

Future<void> _download(Uri uri, File file) async {
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 15);
  final part = File('${file.path}.part');
  try {
    final req = await client.getUrl(uri);
    final res = await req.close();
    if (res.statusCode >= 400) throw StateError('The server answered ${res.statusCode}.');
    await res.pipe(part.openWrite());
    await part.rename(file.path);
  } catch (_) {
    try {
      await part.delete();
    } catch (_) {}
    rethrow;
  } finally {
    client.close();
  }
}
