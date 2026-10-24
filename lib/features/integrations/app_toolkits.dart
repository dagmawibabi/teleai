import 'package:flutter/material.dart';

/// An app the assistant can use through Composio once the user connects it.
class AppToolkit {
  const AppToolkit({
    required this.slug,
    required this.label,
    required this.description,
    required this.icon,
    required this.color,
    this.openUrl,
  });

  /// Composio's toolkit slug.
  final String slug;
  final String label;
  final String description;
  final IconData icon;
  final Color color;

  /// Where the app itself lives, for "Open" buttons.
  final String? openUrl;

  String get logo => 'https://logos.composio.dev/api/$slug';
}

/// Apps with their own tools and cards. Any other Composio toolkit can still
/// be connected and used through connect_app, find_app_tools and run_app_tool.
const appToolkits = <AppToolkit>[
  AppToolkit(
    slug: 'gmail',
    label: 'Gmail',
    description: 'Read, search, send, reply, label and tidy your email.',
    icon: Icons.mail_outline_rounded,
    color: Color(0xFFEA4335),
    openUrl: 'https://mail.google.com',
  ),
  AppToolkit(
    slug: 'outlook',
    label: 'Outlook',
    description: 'Outlook mail and calendar.',
    icon: Icons.alternate_email_rounded,
    color: Color(0xFF0A64D8),
    openUrl: 'https://outlook.live.com',
  ),
  AppToolkit(
    slug: 'googlecalendar',
    label: 'Google Calendar',
    description: 'See your schedule, find free time, add and change events.',
    icon: Icons.event_outlined,
    color: Color(0xFF4285F4),
    openUrl: 'https://calendar.google.com',
  ),
  AppToolkit(
    slug: 'googledrive',
    label: 'Google Drive',
    description: 'Find, read, create and share files.',
    icon: Icons.add_to_drive_outlined,
    color: Color(0xFF1FA463),
    openUrl: 'https://drive.google.com',
  ),
  AppToolkit(
    slug: 'googledocs',
    label: 'Google Docs',
    description: 'Search, read and write documents.',
    icon: Icons.description_outlined,
    color: Color(0xFF4285F4),
    openUrl: 'https://docs.google.com',
  ),
  AppToolkit(
    slug: 'googlesheets',
    label: 'Google Sheets',
    description: 'Read spreadsheets and add or update rows.',
    icon: Icons.table_chart_outlined,
    color: Color(0xFF0F9D58),
    openUrl: 'https://sheets.google.com',
  ),
  AppToolkit(
    slug: 'slack',
    label: 'Slack',
    description: 'Read channels and threads, search, send and react.',
    icon: Icons.tag_rounded,
    color: Color(0xFFE01E5A),
    openUrl: 'https://app.slack.com',
  ),
  AppToolkit(
    slug: 'notion',
    label: 'Notion',
    description: 'Search and read pages and databases, add pages and rows.',
    icon: Icons.sticky_note_2_outlined,
    color: Color(0xFFE6E6E6),
    openUrl: 'https://www.notion.so',
  ),
  AppToolkit(
    slug: 'github',
    label: 'GitHub',
    description: 'Your notifications, issues and pull requests, as you.',
    icon: Icons.code_rounded,
    color: Color(0xFFB0B7C3),
    openUrl: 'https://github.com/notifications',
  ),
  AppToolkit(
    slug: 'linear',
    label: 'Linear',
    description: 'Your issues, teams and projects.',
    icon: Icons.linear_scale_rounded,
    color: Color(0xFF5E6AD2),
    openUrl: 'https://linear.app',
  ),
  AppToolkit(
    slug: 'todoist',
    label: 'Todoist',
    description: 'Your tasks: see what is due, add, complete.',
    icon: Icons.task_alt_rounded,
    color: Color(0xFFE44332),
    openUrl: 'https://app.todoist.com',
  ),
];

AppToolkit? appToolkit(String slug) {
  final s = slug.toLowerCase();
  for (final t in appToolkits) {
    if (t.slug == s) return t;
  }
  return null;
}

/// A readable name for any toolkit slug, known or not.
String appLabel(String slug) {
  final known = appToolkit(slug);
  if (known != null) return known.label;
  if (slug.isEmpty) return 'App';
  return slug[0].toUpperCase() + slug.substring(1);
}

/// The icon for an app tool (by its toolkit prefix), or null for others.
IconData? appToolIcon(String toolName) {
  switch (toolName) {
    case 'connect_app':
      return Icons.link_rounded;
    case 'list_connected_apps':
      return Icons.apps_rounded;
    case 'find_app_tools':
      return Icons.manage_search_rounded;
    case 'run_app_tool':
      return Icons.play_circle_outline_rounded;
  }
  for (final t in appToolkits) {
    if (toolName.startsWith('${t.slug}_')) return t.icon;
  }
  return null;
}
