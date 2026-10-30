import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;

class _Share {
  _Share(this.path, this.expires, {required this.temporary});
  final String path;
  final DateTime expires;

  /// A file the companion made (a screenshot), deleted when the link ends.
  final bool temporary;
}

/// Short-lived download links (`/files/<id>/<name>`), so big files and
/// screenshots don't travel inside tool answers. Each id is 128 random bits.
class ShareLinks {
  final _links = <String, _Share>{};
  final _random = Random.secure();

  /// A link id for [path], valid for [ttl].
  String create(String path, Duration ttl, {bool temporary = false}) {
    sweep();
    final id = List.generate(16, (_) => _random.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
    _links[id] = _Share(path, DateTime.now().add(ttl), temporary: temporary);
    return id;
  }

  /// The file for [id], or null when it's unknown or expired.
  File? open(String id) {
    sweep();
    final s = _links[id];
    return s == null ? null : File(s.path);
  }

  /// The URL path for a link.
  static String urlPath(String id, String filePath) => '/files/$id/${Uri.encodeComponent(p.basename(filePath))}';

  void sweep() {
    final now = DateTime.now();
    _links.removeWhere((_, s) {
      if (s.expires.isAfter(now)) return false;
      if (s.temporary) {
        try {
          File(s.path).deleteSync();
        } catch (_) {}
      }
      return true;
    });
  }

  void dispose() {
    for (final s in _links.values) {
      if (s.temporary) {
        try {
          File(s.path).deleteSync();
        } catch (_) {}
      }
    }
    _links.clear();
  }
}
