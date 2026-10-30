import 'dart:io';

import 'package:path/path.dart' as p;

import 'config.dart';

/// A tool was refused; the message goes back to the assistant as is.
class ToolRefused implements Exception {
  ToolRefused(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Resolves paths the phone sends and refuses anything outside the shared
/// folders. Paths may be absolute (`C:\Users\me\Documents\a.txt`) or start
/// with a shared folder's name (`Documents/a.txt`).
class PathGuard {
  PathGuard(this.folders);

  final List<SharedFolder> folders;

  static final _ctx = p.Context(style: p.Style.windows);

  /// The real, absolute path for [raw], checked against the shared folders.
  /// [write] also requires the folder to allow changes.
  String resolve(String raw, {bool write = false}) {
    if (folders.isEmpty) throw ToolRefused('No folders are shared. Add one in the companion on the PC.');
    final input = raw.trim().replaceAll('/', r'\');
    if (input.isEmpty) throw ToolRefused('Give a path.');
    if (input.startsWith(r'\\')) throw ToolRefused('Network and device paths are not allowed.');

    String abs;
    if (_ctx.isAbsolute(input) && RegExp(r'^[A-Za-z]:\\').hasMatch(input)) {
      abs = input;
    } else {
      // "Documents\sub\file" → under the shared folder named Documents.
      final parts = _ctx.split(input);
      final named = folders.where((f) => f.name.toLowerCase() == parts.first.toLowerCase()).toList();
      if (named.isEmpty) {
        throw ToolRefused('Use a full path or start with a shared folder name: ${folders.map((f) => f.name).join(', ')}.');
      }
      abs = _ctx.joinAll([named.first.path, ...parts.skip(1)]);
    }
    abs = _ctx.normalize(abs);

    // Alternate data streams (file.txt:secret) and other colons after the drive.
    if (abs.substring(2).contains(':')) throw ToolRefused('That path is not allowed.');

    final real = _real(abs);
    final folder = _folderFor(real);
    if (folder == null) {
      throw ToolRefused('$raw is outside the shared folders (${folders.map((f) => f.path).join('; ')}).');
    }
    if (write && !folder.writable) {
      throw ToolRefused('${folder.path} is shared read-only. Allow changes for it in the companion on the PC.');
    }
    return real;
  }

  /// The shared folder holding [path], or null.
  SharedFolder? _folderFor(String path) {
    final lower = path.toLowerCase();
    for (final f in folders) {
      final root = _ctx.normalize(_real(f.path)).toLowerCase();
      if (lower == root || _ctx.isWithin(root, lower)) return f;
    }
    return null;
  }

  /// [path] with links and junctions followed, for the part that exists, so a
  /// link inside a shared folder can't point outside it.
  static String _real(String path) {
    var existing = path;
    final rest = <String>[];
    while (true) {
      final type = FileSystemEntity.typeSync(existing, followLinks: false);
      if (type != FileSystemEntityType.notFound) break;
      final parent = _ctx.dirname(existing);
      if (parent == existing) return path;
      rest.insert(0, _ctx.basename(existing));
      existing = parent;
    }
    String resolved;
    try {
      resolved = Directory(existing).resolveSymbolicLinksSync();
    } catch (_) {
      try {
        resolved = File(existing).resolveSymbolicLinksSync();
      } catch (_) {
        resolved = existing;
      }
    }
    return _ctx.normalize(_ctx.joinAll([resolved, ...rest]));
  }
}
