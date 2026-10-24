part of 'telegram_tools.dart';

// Apps through Composio: Gmail, Outlook, Google Calendar, Drive, Docs and
// Sheets, Slack, Notion, GitHub, Linear and Todoist with their own tools
// (generated into telegram_app_catalog.dart), and any other Composio app
// through connect_app, find_app_tools and run_app_tool.
//
// Composio holds the OAuth tokens; the phone sends the user's project key
// and their user id. App tools are offered to the model only for apps the
// user connected (see appToolReady).

final _appTools = <TelegramTool>[
  ..._appCatalogTools,
  TelegramTool(
    name: 'connect_app',
    label: 'Connecting an app',
    category: ToolCategory.apps,
    cost: ToolCost.apps,
    description:
        'Checks whether the user connected an app (gmail, outlook, googlecalendar, googledrive, googledocs, '
        'googlesheets, slack, notion, github, linear, todoist, or any other Composio toolkit slug such as '
        'hubspot, jira, asana, dropbox, airtable, zoom). Call it before using an app they have not connected. If it '
        'returns needs_connection, a Connect button is shown in the chat: tell them to tap it and sign in, then ask '
        'again. Never paste the link. Never invent their mail, events, files or messages.',
    parameters: _obj({
      'app': {'type': 'string', 'description': 'Composio toolkit slug, e.g. gmail, slack, notion.'},
    }, ['app']),
  ),
  TelegramTool(
    name: 'list_connected_apps',
    label: 'Checking connected apps',
    category: ToolCategory.apps,
    cost: ToolCost.apps,
    description: 'Lists the apps the user connected through Composio, and the apps TeleAI has built-in tools for.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'find_app_tools',
    label: 'Finding the right app action',
    category: ToolCategory.apps,
    cost: ToolCost.apps,
    description:
        'Searches Composio\'s catalog of app actions (thousands, across 500+ apps) for one the built-in tools '
        'don\'t cover. Returns tool slugs with their parameters, for run_app_tool. Give the app slug and/or what '
        'you want to do.',
    parameters: _obj({
      'app': {'type': 'string', 'description': 'Toolkit slug, e.g. hubspot, jira, gmail.'},
      'query': {'type': 'string', 'description': 'What the action should do, e.g. "create a deal".'},
      'limit': {'type': 'integer', 'description': '1-25, default 10.'},
    }),
  ),
  TelegramTool(
    name: 'run_app_tool',
    label: 'Running an app action',
    category: ToolCategory.apps,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description:
        'Runs any Composio action by slug (from find_app_tools) on an app the user connected, with arguments as a '
        'JSON object written as text. Prefer the built-in app tools when one fits. Every call waits for the user\'s '
        'approval, because it can do anything the app allows.',
    parameters: _obj({
      'tool_slug': {'type': 'string', 'description': 'e.g. HUBSPOT_CREATE_DEAL.'},
      'arguments_json': {'type': 'string', 'description': 'The arguments, as a JSON object in a string, e.g. {"name":"…"}.'},
    }, ['tool_slug']),
  ),
];

const _appGenericTools = {'connect_app', 'list_connected_apps', 'find_app_tools', 'run_app_tool'};

bool isAppTool(String name) => appToolSlugs.containsKey(name) || _appGenericTools.contains(name);

/// The toolkit a generated app tool belongs to.
String? appToolkitOf(String name) => appToolSlugs[name]?.$1;

/// Whether the model is offered [t]: app tools need a Composio key, and the
/// generated ones also need their app connected.
bool appToolReady(TelegramTool t, AppSettings s, Set<String> connected) {
  if (!isAppTool(t.name)) return true;
  if (!s.hasComposioKey) return false;
  final toolkit = appToolkitOf(t.name);
  return toolkit == null || connected.contains(toolkit);
}

/// The tool's declared type for each argument, so arguments a model wrote
/// as JSON text (some providers can't describe nested objects) are opened.
Map<String, dynamic> _openJsonArgs(TelegramTool tool, Map<String, dynamic> args) {
  final props = (tool.parameters['properties'] as Map?) ?? const {};
  bool looksJson(Object? v) => v is String && (v.trim().startsWith('{') || v.trim().startsWith('['));
  dynamic open(String key, dynamic value) {
    final type = (props[key] as Map?)?['type'];
    if ((type == 'object' || type == 'array') && looksJson(value)) return _tryJson(value as String) ?? value;
    if (type == 'array' && value is List) return [for (final x in value) looksJson(x) ? (_tryJson(x as String) ?? x) : x];
    return value;
  }

  return {for (final e in args.entries) e.key: open(e.key, e.value)};
}

dynamic _tryJson(String v) {
  try {
    return jsonDecode(v);
  } catch (_) {
    return null;
  }
}

/// Moves each email's HTML into a file on the phone for the reader, and
/// out of what the model reads.
Future<Map<String, dynamic>> _keepMailHtml(Map<String, dynamic> out) async {
  final emails = out['emails'];
  if (emails is! List) return out;
  Directory? dir;
  for (final e in emails) {
    if (e is! Map || e['_html'] is! String) continue;
    final html = e.remove('_html') as String;
    try {
      dir ??= await Directory('${(await getApplicationSupportDirectory()).path}/mail').create(recursive: true);
      final name = '${e['id'] ?? html.hashCode}'.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
      final f = await File('${dir.path}/$name.html').writeAsString(html);
      e['html_path'] = f.path;
    } catch (_) {}
  }
  return out;
}

extension _AppToolRuns on TelegramToolRunner {
  Future<ToolOutput>? _runApps(String name, Map<String, dynamic> args) {
    if (!isAppTool(name)) return null;
    return _appCall(name, args);
  }

  Future<ToolOutput> _appCall(String name, Map<String, dynamic> args) async {
    final client = await _composio?.call();
    if (client == null) {
      return const ToolOutput({
        'error': 'No Composio key. The user can add one in Settings → AI & models, then connect apps under Settings → Apps & web.',
      });
    }
    try {
      switch (name) {
        case 'connect_app':
          final app = '${args['app'] ?? ''}'.trim().toLowerCase();
          if (app.isEmpty) return const ToolOutput({'error': 'app is required, e.g. gmail.'});
          final accounts = await client.connections();
          if (accounts.any((a) => a.toolkit == app && a.active)) {
            return ToolOutput({'connected': true, 'app': app, 'label': appLabel(app)});
          }
          final url = await client.connectLink(app);
          return ToolOutput({
            'needs_connection': true,
            'app': app,
            'label': appLabel(app),
            'connect_url': url,
            'note': 'A Connect button is shown to the user. Ask them to tap it, sign in, and tell you when done. Do not paste the link.',
          });
        case 'list_connected_apps':
          final accounts = await client.connections();
          return ToolOutput({
            'connected': [
              for (final a in accounts.where((a) => a.active)) {'app': a.toolkit, 'label': appLabel(a.toolkit), 'alias': ?a.alias},
            ],
            'pending': [for (final a in accounts.where((a) => !a.active)) {'app': a.toolkit, 'status': a.status}],
            'built_in': [for (final t in appToolkits) t.slug],
          });
        case 'find_app_tools':
          final found = await client.findTools(
            toolkit: '${args['app'] ?? ''}'.trim(),
            query: '${args['query'] ?? ''}'.trim(),
            limit: TelegramToolRunner._int(args, 'limit', fallback: 10, max: 25),
          );
          return ToolOutput({
            'tools': [
              for (final t in found)
                {
                  'slug': t.slug,
                  'app': t.toolkit,
                  'name': t.name,
                  'description': TelegramToolRunner._clip(t.description, 400),
                  'parameters': {
                    for (final e in ((t.parameters['properties'] as Map?) ?? const {}).entries)
                      '${e.key}': [
                        '${(e.value as Map?)?['type'] ?? 'any'}',
                        if (((t.parameters['required'] as List?) ?? const []).contains(e.key)) 'required',
                        TelegramToolRunner._clip('${(e.value as Map?)?['description'] ?? ''}', 160),
                      ].where((x) => x.isNotEmpty).join(' · '),
                  },
                },
            ],
          });
        case 'run_app_tool':
          final slug = '${args['tool_slug'] ?? ''}'.trim().toUpperCase();
          if (slug.isEmpty) return const ToolOutput({'error': 'tool_slug is required.'});
          final raw = '${args['arguments_json'] ?? ''}'.trim();
          final parsed = raw.isEmpty ? <String, dynamic>{} : _tryJson(raw);
          if (parsed is! Map) return const ToolOutput({'error': 'arguments_json must be a JSON object.'});
          final toolkit = slug.split('_').first.toLowerCase();
          final data = await client.execute(slug, Map<String, dynamic>.from(parsed));
          return ToolOutput(await _keepMailHtml(AppResults.summarize(toolkit, slug, data)));
      }
      final (toolkit, slug) = appToolSlugs[name]!;
      final tool = toolNamed(name)!;
      final data = await client.execute(slug, _openJsonArgs(tool, args));
      return ToolOutput(await _keepMailHtml(AppResults.summarize(toolkit, slug, data)));
    } on ComposioException catch (e) {
      final toolkit = appToolkitOf(name);
      final notConnected = RegExp(r'no (active )?connected account|not connected|connection.*not found', caseSensitive: false).hasMatch(e.message);
      return ToolOutput({
        'error': notConnected && toolkit != null
            ? '${appLabel(toolkit)} is not connected. Call connect_app with app $toolkit.'
            : '${appLabel(toolkit ?? 'app')}: ${e.message}',
      });
    } finally {
      client.close();
    }
  }

  /// What an app action would do, for the approval card.
  String? _describeApps(String name, Map<String, dynamic> args) {
    if (!isAppTool(name)) return null;
    String v(String k) => '${args[k] ?? ''}'.trim();
    String list(String k) => switch (args[k]) {
      final List l => l.join(', '),
      final Object o => '$o',
      null => '',
    };
    String quote(String s, [int max = 600]) => s.isEmpty ? '' : '“${s.length > max ? '${s.substring(0, max)}…' : s}”';
    final lines = switch (name) {
      'gmail_send_email' || 'gmail_create_email_draft' => [
        name == 'gmail_send_email' ? 'Send an email' : 'Save a draft',
        'To: ${[v('recipient_email'), list('extra_recipients')].where((x) => x.isNotEmpty).join(', ')}',
        if (list('cc').isNotEmpty) 'Cc: ${list('cc')}',
        if (list('bcc').isNotEmpty) 'Bcc: ${list('bcc')}',
        if (v('subject').isNotEmpty) 'Subject: ${v('subject')}',
        quote(v('body')),
      ],
      'gmail_reply_to_thread' => ['Reply to an email thread', if (v('recipient_email').isNotEmpty) 'To: ${v('recipient_email')}', quote(v('message_body'))],
      'gmail_forward_message' => ['Forward an email to ${list('recipients')}', quote(v('additional_text'))],
      'outlook_send_email' => ['Send an Outlook email', 'To: ${v('to')}', 'Subject: ${v('subject')}', quote(v('body'))],
      'outlook_reply_email' => ['Reply in Outlook', quote(v('comment'))],
      'outlook_create_draft' => ['Save an Outlook draft to ${list('to_recipients')}', 'Subject: ${v('subject')}', quote(v('body'))],
      'slack_send_message' => ['Send to Slack ${v('channel')}${v('thread_ts').isEmpty ? '' : ' (in a thread)'}', quote(v('markdown_text').isEmpty ? v('fallback_text') : v('markdown_text'))],
      'slack_schedule_message' => ['Schedule a Slack message in ${v('channel')} for ${v('post_at')}', quote(v('markdown_text').isEmpty ? v('text') : v('markdown_text'))],
      'slack_updates_a_slack_message' => ['Edit a Slack message in ${v('channel')}', quote(v('markdown_text').isEmpty ? v('fallback_text') : v('markdown_text'))],
      'googlecalendar_create_event' => [
        'Add “${v('summary')}” to your calendar',
        'Starts ${v('start_datetime').isEmpty ? v('start_date') : v('start_datetime')}${v('timezone').isEmpty ? '' : ' (${v('timezone')})'}',
        if (list('attendees').isNotEmpty) 'Invites ${list('attendees')}',
        if (v('location').isNotEmpty) 'At ${v('location')}',
      ],
      'googlecalendar_quick_add' => ['Add to your calendar: ${quote(v('text'))}'],
      'notion_create_notion_page' => ['Create the Notion page “${v('title')}”', quote(v('markdown'), 400)],
      'github_create_an_issue' => ['Open an issue in ${v('owner')}/${v('repo')}: “${v('title')}”', quote(v('body'), 400)],
      'github_create_an_issue_comment' => ['Comment on ${v('owner')}/${v('repo')}#${v('issue_number')}', quote(v('body'), 400)],
      'github_merge_a_pull_request' => ['Merge ${v('owner')}/${v('repo')} pull request #${v('pull_number')}'],
      'linear_create_linear_issue' => ['Create the Linear issue “${v('title')}”', quote(v('description'), 400)],
      'todoist_create_task' => ['Add the task “${v('content')}”${v('due_string').isEmpty ? '' : ', due ${v('due_string')}'}'],
      'run_app_tool' => ['Run ${v('tool_slug')} on ${appLabel(v('tool_slug').split('_').first.toLowerCase())}', quote(v('arguments_json'), 800)],
      _ => [
        '${appLabel(appToolkitOf(name) ?? '')} · ${toolNamed(name)?.label ?? name}',
        for (final e in args.entries.take(8))
          if ('${e.value}'.isNotEmpty) '${e.key}: ${'${e.value}'.length > 140 ? '${'${e.value}'.substring(0, 140)}…' : e.value}',
      ],
    };
    return lines.where((l) => l.trim().isNotEmpty).join('\n');
  }
}
