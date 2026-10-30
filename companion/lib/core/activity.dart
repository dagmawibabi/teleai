import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

enum Outcome { ok, refused, denied, failed }

/// One call the phone made.
@immutable
class ActivityEntry {
  const ActivityEntry({
    required this.at,
    required this.tool,
    required this.summary,
    required this.outcome,
    this.detail = '',
    this.who = '',
  });

  final DateTime at;
  final String tool;

  /// The call's arguments, shortened.
  final String summary;
  final Outcome outcome;

  /// The error or refusal, when there is one.
  final String detail;

  /// The Tailscale login that made the call, when Tailscale says.
  final String who;

  Map<String, dynamic> toJson() => {
        'at': at.toIso8601String(),
        'tool': tool,
        'summary': summary,
        'outcome': outcome.name,
        if (detail.isNotEmpty) 'detail': detail,
        if (who.isNotEmpty) 'who': who,
      };
}

/// Every call, newest first, kept in memory for the window and appended to
/// `activity.log` (one JSON object per line).
class ActivityLog extends ValueNotifier<List<ActivityEntry>> {
  ActivityLog(String dir)
      : _file = File(p.join(dir, 'activity.log')),
        super(const []);

  final File _file;
  static const _keep = 300;

  String get path => _file.path;

  void add(ActivityEntry e) {
    value = [e, ...value.take(_keep - 1)];
    try {
      _file.writeAsStringSync('${jsonEncode(e.toJson())}\n', mode: FileMode.append, flush: false);
    } catch (_) {
      // The window still shows it.
    }
  }

  /// [args] as one short line for the log.
  static String summarize(Map<String, dynamic> args) {
    final parts = <String>[];
    args.forEach((k, v) {
      var s = v is String ? v : jsonEncode(v);
      s = s.replaceAll(RegExp(r'\s+'), ' ');
      if (s.length > 80) s = '${s.substring(0, 77)}…';
      parts.add('$k: $s');
    });
    return parts.join(' · ');
  }
}
