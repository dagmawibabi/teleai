part of 'telegram_tools.dart';

// The second browser engine (screenshots, inspecting pages, awaiting
// scripts), the code sandbox, and public GitHub repositories (no sign-in:
// GitHub allows 60 API requests an hour that way; file contents come from
// raw.githubusercontent.com, which doesn't count).

final _devTools = <TelegramTool>[
  TelegramTool(
    name: 'web_screenshot',
    label: 'Taking a screenshot',
    category: ToolCategory.web,
    cost: ToolCost.web,
    description:
        'Takes a screenshot (PNG) of a web page with the second browser engine: the phone-sized screen, or the whole '
        'page with full_page. Without url it shoots the page open in the main browser (browser_open). The picture is '
        'shown to the user, you can look at it with view_image, and it can be sent to a chat with send_message. Use '
        'when the user wants to see a page, or when a page is easier to understand by looking.',
    parameters: _obj({
      'url': {
        'type': 'string',
        'description': 'Page to shoot; the main browser\'s page when missing.',
      },
      'full_page': {
        'type': 'boolean',
        'description': 'The whole scrolling page instead of one screen.',
      },
    }),
  ),
  TelegramTool(
    name: 'web_inspect',
    label: 'Inspecting a page',
    category: ToolCategory.web,
    cost: ToolCost.web,
    description:
        'Opens a page in the second browser engine and returns what a developer would check: console messages and '
        'errors, the network requests it made (APIs it calls), its cookie names, and the HTML after its scripts ran. '
        'Without url it inspects the main browser\'s page. Good for finding the API behind a web app or why a page fails.',
    parameters: _obj({
      'url': {'type': 'string'},
      'html_chars': {
        'type': 'integer',
        'description': 'How much of the HTML to return. Default 6000.',
      },
    }),
  ),
  TelegramTool(
    name: 'web_run_async_js',
    label: 'Running a page script',
    category: ToolCategory.web,
    cost: ToolCost.web,
    requiresApproval: true,
    description:
        'Runs JavaScript in a page in the second browser engine as an async function body: it may await (fetch the '
        'site\'s own API with its cookies, wait for elements), and its return value comes back as JSON. Without url, '
        'uses the main browser\'s page. The user approves it first.',
    parameters: _obj(
      {
        'url': {'type': 'string'},
        'script': {
          'type': 'string',
          'description': 'An async function body; use return for the result.',
        },
      },
      ['script'],
    ),
  ),
  TelegramTool(
    name: 'run_code',
    label: 'Running code',
    category: ToolCategory.developer,
    cost: ToolCost.device,
    description:
        'Runs code in a sandbox on the phone, cut off from the app and Telegram: Python (Pyodide: the standard library '
        'plus numpy, pandas, matplotlib, pillow and other packages it loads from imports; first use downloads Python) '
        'or JavaScript. Use it to calculate, analyse data, convert files, make charts, images, CSV/JSON/text files. '
        'Pass files (names from this conversation) to give the code input files: in Python they are in the working '
        'directory, in JavaScript files["name"] is a Uint8Array. To produce files, Python writes them into the out/ '
        'folder (e.g. plt.savefig("out/chart.png")); JavaScript sets outFiles["name"] = string or Uint8Array. Produced '
        'files are shown to the user and can be sent with send_message. Printed output comes back, and the value of the '
        'last expression (Python) or of return (JavaScript runs as an async function body).',
    parameters: _obj(
      {
        'language': {
          'type': 'string',
          'enum': ['python', 'javascript'],
        },
        'code': {'type': 'string'},
        'files': {
          'type': 'array',
          'items': {'type': 'string'},
          'description': 'Input files from this conversation.',
        },
      },
      ['language', 'code'],
    ),
  ),
  TelegramTool(
    name: 'github_repo',
    label: 'Looking at a GitHub repo',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description:
        'A public GitHub repository at a glance: description, stars, forks, open issues, languages, topics, licence, '
        'default branch, latest activity and the start of its README. repo is "owner/name" or any github.com URL.',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'readme_chars': {
          'type': 'integer',
          'description':
              'How much README to include. Default 3000; 0 for none.',
        },
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_list',
    label: 'Browsing a GitHub repo',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description: 'Lists the files and folders at a path of a public repo (the root when path is missing), on a branch, tag or commit (ref).',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'path': {'type': 'string'},
        'ref': {'type': 'string'},
        'recursive': {
          'type': 'boolean',
          'description': 'The whole tree under path (up to 400 entries).',
        },
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_read',
    label: 'Reading a file on GitHub',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description:
        'Reads a file from a public repo: repo + path (+ ref), or a github.com/…/blob/… URL in repo. Long files read '
        'in parts with offset; find returns only the lines around a word.',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'path': {'type': 'string'},
        'ref': {'type': 'string'},
        'offset': {'type': 'integer'},
        'max_chars': {
          'type': 'integer',
          'description': 'Default 12000, at most 40000.',
        },
        'find': {'type': 'string'},
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_search',
    label: 'Searching GitHub',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description:
        'Searches public GitHub: repositories (e.g. "flutter telegram client stars:>50"), issues and pull requests '
        '(e.g. "repo:owner/name crash is:open"), or users. Uses GitHub\'s search syntax.',
    parameters: _obj(
      {
        'query': {'type': 'string'},
        'type': {
          'type': 'string',
          'enum': ['repositories', 'issues', 'users'],
        },
        'sort': {
          'type': 'string',
          'description': 'e.g. stars, updated, comments.',
        },
        'limit': {'type': 'integer', 'description': 'Default 10, at most 30.'},
      },
      ['query'],
    ),
  ),
  TelegramTool(
    name: 'github_issues',
    label: 'Reading GitHub issues',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description:
        'Issues or pull requests of a public repo (open, closed or all), or one of them in full with its comments '
        '(number).',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'kind': {
          'type': 'string',
          'enum': ['issues', 'pulls'],
        },
        'state': {
          'type': 'string',
          'enum': ['open', 'closed', 'all'],
        },
        'number': {
          'type': 'integer',
          'description': 'Read this one with its comments.',
        },
        'limit': {'type': 'integer'},
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_commits',
    label: 'Reading GitHub commits',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description: 'Recent commits of a public repo, optionally only those touching path, on a branch (ref); or one commit in full (sha) with its changed files.',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'path': {'type': 'string'},
        'ref': {'type': 'string'},
        'sha': {'type': 'string'},
        'limit': {'type': 'integer'},
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_releases',
    label: 'Reading GitHub releases',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description: 'Releases of a public repo, newest first, with their notes and downloadable assets (APKs, binaries) and download counts.',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'limit': {'type': 'integer'},
      },
      ['repo'],
    ),
  ),
  TelegramTool(
    name: 'github_download',
    label: 'Downloading from GitHub',
    category: ToolCategory.developer,
    cost: ToolCost.web,
    description:
        'Downloads from a public repo onto the phone: the whole repo as a .zip (at ref), one file (path), or a release '
        'asset (asset_url from github_releases). It becomes a file of this conversation, ready for send_message or run_code.',
    parameters: _obj(
      {
        'repo': {'type': 'string'},
        'what': {
          'type': 'string',
          'enum': ['zip', 'file', 'asset'],
        },
        'path': {'type': 'string'},
        'ref': {'type': 'string'},
        'asset_url': {'type': 'string'},
      },
      ['repo', 'what'],
    ),
  ),
];

/// "owner/name", or a github.com URL with an optional branch and path.
({String owner, String name, String? ref, String? path}) _parseRepo(
  String input,
) {
  var s = input
      .trim()
      .replaceFirst(RegExp(r'^https?://'), '')
      .replaceFirst(RegExp(r'^(www\.)?github\.com/'), '');
  s = s.replaceFirst(RegExp(r'\.git$'), '').replaceAll(RegExp(r'/+$'), '');
  final parts = s.split('/');
  if (parts.length < 2 || parts[0].isEmpty || parts[1].isEmpty) {
    throw ArgumentError('Give the repo as "owner/name" or a github.com link.');
  }
  String? ref, path;
  if (parts.length >= 4 &&
      (parts[2] == 'blob' || parts[2] == 'tree' || parts[2] == 'raw')) {
    ref = parts[3];
    if (parts.length > 4) path = parts.sublist(4).join('/');
  }
  return (owner: parts[0], name: parts[1], ref: ref, path: path);
}

extension _DevTools on TelegramToolRunner {
  Future<ToolOutput>? _runDev(String name, Map<String, dynamic> args) =>
      switch (name) {
        'web_screenshot' => _shoot(args),
        'web_inspect' => _inspect(args),
        'web_run_async_js' => _asyncJs(args),
        'run_code' => _runCode(args),
        'github_repo' => _ghRepo(args),
        'github_list' => _ghList(args),
        'github_read' => _ghRead(args),
        'github_search' => _ghSearch(args),
        'github_issues' => _ghIssues(args),
        'github_commits' => _ghCommits(args),
        'github_releases' => _ghReleases(args),
        'github_download' => _ghDownload(args),
        _ => null,
      };

  String? _describeDev(
    String name,
    Map<String, dynamic> args,
  ) => switch (name) {
    'web_run_async_js' =>
      'Run this script on ${args['url'] ?? _browser.host ?? 'the open page'}:\n${args['script']}',
    _ => null,
  };

  /// Where the second engine should be: [args]' url, or the main browser's page.
  Future<void> _engineAt(Map<String, dynamic> args) async {
    final given = '${args['url'] ?? ''}'.trim();
    final url = given.isNotEmpty
        ? '${WebFetcher.normalize(given)}'
        : await _browser.controller?.currentUrl();
    if (url == null || url.isEmpty || url == 'about:blank') {
      throw ArgumentError(
        'Give a url, or open a page with browser_open first.',
      );
    }
    if (url != await _engine.url) await _engine.open(url);
  }

  Future<ToolOutput> _guard(Future<ToolOutput> Function() run) async {
    try {
      return await run();
    } on UnsupportedError catch (e) {
      return ToolOutput({'error': '${e.message}'});
    } on StateError catch (e) {
      return ToolOutput({'error': e.message});
    } on TimeoutException {
      return const ToolOutput({'error': 'It took too long and was stopped.'});
    }
  }

  Future<ToolOutput> _shoot(Map<String, dynamic> args) => _guard(() async {
    await _engineAt(args);
    final file = await _engine.screenshot(fullPage: args['full_page'] == true);
    return ToolOutput({
      'created': true,
      'image_path': file.path,
      'name': file.path.split(RegExp(r'[\\/]')).last,
      'url': await _engine.url,
      'note': 'The screenshot is shown to the user. Look at it with view_image; send it with send_message.',
    });
  });

  Future<ToolOutput> _inspect(Map<String, dynamic> args) => _guard(() async {
    await _engineAt(args);
    return ToolOutput(
      await _engine.inspect(
        htmlChars: TelegramToolRunner._int(
          args,
          'html_chars',
          fallback: 6000,
          max: 40000,
        ),
      ),
    );
  });

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _asyncJs(Map<String, dynamic> args) => _guard(() async {
    await _engineAt(args);
    final v = await _engine.runAsync('${args['script'] ?? ''}');
    final text = jsonEncode(v);
    return ToolOutput({
      'url': await _engine.url,
      'result': text.length > 20000 ? '${text.substring(0, 20000)}…' : v,
    });
  });

  Future<ToolOutput> _runCode(Map<String, dynamic> args) => _guard(() async {
    final code = '${args['code'] ?? ''}';
    if (code.trim().isEmpty) throw ArgumentError('code is empty');
    final inputs = <String, List<int>>{};
    for (final f in (args['files'] as List? ?? const [])) {
      final file = File('$f');
      if (!file.existsSync())
        throw ArgumentError('No file "$f" in this conversation.');
      // Inside the sandbox files go by their plain names.
      var n = file.path.split(RegExp(r'[\\/]')).last;
      n = n.replaceFirst(RegExp(r'^[0-9a-f]{8}_'), '');
      inputs[n] = await file.readAsBytes();
    }
    final r = await _sandbox.run(
      language: '${args['language'] ?? 'python'}',
      code: code,
      inputs: inputs,
    );
    final images = r.files
        .where(
          (f) => RegExp(
            r'\.(png|jpe?g|gif|webp)$',
            caseSensitive: false,
          ).hasMatch(f.path),
        )
        .toList();
    return ToolOutput({
      if (r.error == null) 'done': true,
      if (r.output.isNotEmpty)
        'output': TelegramToolRunner._clip(r.output, 12000),
      if (r.result != null) 'result': r.result,
      if (r.error != null) 'error': TelegramToolRunner._clip(r.error!, 4000),
      if (r.files.isNotEmpty)
        'created_files': [for (final f in r.files) f.path],
      // The first picture is shown in the chat like a generated image.
      if (images.isNotEmpty) 'image_path': images.first.path,
      if (r.files.isNotEmpty)
        'note':
            'Files made: ${r.files.map((f) => f.path.split(RegExp(r'[\\/]')).last).join(', ')}. Send them with send_message.',
    });
  });

  // ---- GitHub ----------------------------------------------------------------

  Future<Object?> _gh(
    String path, {
    Map<String, String> query = const {},
  }) async {
    final r = await _web.request(
      'GET',
      Uri.https('api.github.com', path, query.isEmpty ? null : query),
      headers: {
        'accept': 'application/vnd.github+json',
        'x-github-api-version': '2022-11-28',
      },
    );
    if (r.statusCode == 404)
      throw ArgumentError('Not found on GitHub (or it is private): $path');
    if (r.statusCode == 403 || r.statusCode == 429) {
      final reset = int.tryParse(r.headers['x-ratelimit-reset'] ?? '');
      throw ArgumentError(
        'GitHub\'s limit for requests without sign-in (60 an hour) was reached'
        '${reset == null ? '' : '; it resets at ${TelegramToolRunner._iso(reset).substring(11)}'}. Raw file reads (github_read) still work.',
      );
    }
    if (r.statusCode >= 400)
      throw ArgumentError(
        'GitHub said ${r.statusCode}: ${TelegramToolRunner._clip(WebFetcher.decodeBody(r), 300)}',
      );
    return jsonDecode(WebFetcher.decodeBody(r));
  }

  static String? _short(Object? s, [int max = 400]) {
    if (s == null) return null;
    final t = '$s'.trim();
    if (t.isEmpty) return null;
    return t.length > max ? '${t.substring(0, max)}…' : t;
  }

  Future<String> _defaultBranch(String owner, String name) async =>
      '${((await _gh('/repos/$owner/$name')) as Map)['default_branch'] ?? 'main'}';

  Future<ToolOutput> _ghRepo(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final j = await _gh('/repos/${r.owner}/${r.name}') as Map;
    final out = <String, dynamic>{
      'repo': j['full_name'],
      'url': j['html_url'],
      'owner_avatar': ?(j['owner'] as Map?)?['avatar_url'],
      'description': ?j['description'],
      'stars': j['stargazers_count'],
      'forks': j['forks_count'],
      'open_issues': j['open_issues_count'],
      'watchers': j['subscribers_count'],
      'language': ?j['language'],
      if ((j['topics'] as List?)?.isNotEmpty ?? false) 'topics': j['topics'],
      if (j['license'] is Map) 'license': (j['license'] as Map)['spdx_id'],
      'default_branch': j['default_branch'],
      if ('${j['homepage'] ?? ''}'.isNotEmpty) 'homepage': j['homepage'],
      'created': '${j['created_at']}'.substring(0, 10),
      'last_push': '${j['pushed_at']}'.substring(0, 10),
      if (j['archived'] == true) 'archived': true,
      if (j['fork'] == true && j['parent'] is Map)
        'forked_from': (j['parent'] as Map)['full_name'],
    };
    try {
      final langs = await _gh('/repos/${r.owner}/${r.name}/languages') as Map;
      final total = langs.values.fold<num>(0, (a, b) => a + (b as num));
      if (total > 0) {
        out['languages'] = {
          for (final e in langs.entries.take(8))
            e.key: '${((e.value as num) / total * 100).toStringAsFixed(1)}%',
        };
      }
    } catch (_) {}
    final readmeChars = TelegramToolRunner._int(
      args,
      'readme_chars',
      fallback: 3000,
      min: 0,
      max: 30000,
    );
    if (readmeChars > 0) {
      for (final file in const [
        'README.md',
        'readme.md',
        'README.rst',
        'README',
        'Readme.md',
      ]) {
        final res = await _web.request(
          'GET',
          Uri.parse(
            'https://raw.githubusercontent.com/${r.owner}/${r.name}/${j['default_branch']}/$file',
          ),
        );
        if (res.statusCode == 200) {
          out['readme'] = TelegramToolRunner._clip(
            WebFetcher.decodeBody(res),
            readmeChars,
          );
          out['readme_path'] = file;
          break;
        }
      }
    }
    return ToolOutput(out);
  }

  Future<ToolOutput> _ghList(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final ref = '${args['ref'] ?? r.ref ?? ''}'.trim();
    final path = '${args['path'] ?? r.path ?? ''}'.trim().replaceAll(
      RegExp(r'^/+|/+$'),
      '',
    );
    if (args['recursive'] == true) {
      final branch = ref.isEmpty ? await _defaultBranch(r.owner, r.name) : ref;
      final tree = await _gh(
        '/repos/${r.owner}/${r.name}/git/trees/$branch',
        query: {'recursive': '1'},
      ) as Map;
      final entries = [
        for (final e in (tree['tree'] as List? ?? const []))
          if (path.isEmpty || '${e['path']}'.startsWith('$path/')) e,
      ];
      return ToolOutput({
        'repo': '${r.owner}/${r.name}',
        'ref': branch,
        'count': entries.length,
        'entries': [
          for (final e in entries.take(400))
            '${e['type'] == 'tree' ? '📁 ' : ''}${e['path']}${e['size'] != null ? ' (${e['size']} B)' : ''}',
        ],
        if (entries.length > 400 || tree['truncated'] == true)
          'note': 'Only the first 400 shown; narrow with path.',
      });
    }
    final j = await _gh(
      '/repos/${r.owner}/${r.name}/contents/$path',
      query: {if (ref.isNotEmpty) 'ref': ref},
    );
    if (j is Map) {
      return ToolOutput({
        'repo': '${r.owner}/${r.name}',
        'path': j['path'],
        'type': j['type'],
        'size': j['size'],
        'note': 'That is a file; read it with github_read.',
      });
    }
    final list = (j as List).cast<Map>()
      ..sort(
        (a, b) => a['type'] == b['type']
            ? '${a['name']}'.compareTo('${b['name']}')
            : (a['type'] == 'dir' ? -1 : 1),
      );
    return ToolOutput({
      'repo': '${r.owner}/${r.name}',
      'path': path.isEmpty ? '/' : path,
      'count': list.length,
      'entries': [
        for (final e in list)
          {
            'name': e['name'],
            'type': e['type'],
            if (e['type'] == 'file') 'size': e['size'],
          },
      ],
    });
  }

  Future<ToolOutput> _ghRead(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final path = '${args['path'] ?? r.path ?? ''}'.trim().replaceAll(
      RegExp(r'^/+'),
      '',
    );
    if (path.isEmpty)
      throw ArgumentError('Which file? Give path (github_list shows them).');
    var ref = '${args['ref'] ?? r.ref ?? ''}'.trim();
    if (ref.isEmpty) ref = 'HEAD';
    final res = await _web.request(
      'GET',
      Uri.parse(
        'https://raw.githubusercontent.com/${r.owner}/${r.name}/$ref/$path',
      ),
    );
    if (res.statusCode == 404)
      throw ArgumentError('No file $path at $ref in ${r.owner}/${r.name}.');
    if (res.statusCode >= 400)
      throw ArgumentError('GitHub said ${res.statusCode}.');
    final bytes = res.bodyBytes;
    if (bytes.take(2000).contains(0)) {
      return ToolOutput({
        'path': path,
        'size': bytes.length,
        'binary': true,
        'note': 'A binary file: download it with github_download (what: file) to send or use it.',
      });
    }
    final text = WebFetcher.decodeBody(res);
    final find = '${args['find'] ?? ''}'.trim();
    if (find.isNotEmpty) {
      final lines = text.split('\n');
      final hits = <String>[];
      for (var i = 0; i < lines.length && hits.length < 30; i++) {
        if (lines[i].toLowerCase().contains(find.toLowerCase())) {
          final from = (i - 2).clamp(0, lines.length),
              to = (i + 3).clamp(0, lines.length);
          hits.add(
            [for (var k = from; k < to; k++) '${k + 1}: ${lines[k]}']
                .join('\n'),
          );
        }
      }
      return ToolOutput({'path': path, 'lines': lines.length, 'matches': hits});
    }
    final offset = TelegramToolRunner._int(args, 'offset', fallback: 0, min: 0);
    final max = TelegramToolRunner._int(
      args,
      'max_chars',
      fallback: 12000,
      max: 40000,
    );
    final end = (offset + max).clamp(0, text.length);
    return ToolOutput({
      'repo': '${r.owner}/${r.name}',
      'path': path,
      'ref': ref,
      'length': text.length,
      'text': offset >= text.length ? '' : text.substring(offset, end),
      if (end < text.length) 'more_text': 'Continues; pass offset=$end.',
    });
  }

  Future<ToolOutput> _ghSearch(Map<String, dynamic> args) async {
    final q = '${args['query'] ?? ''}'.trim();
    if (q.isEmpty) throw ArgumentError('query is required');
    final type = '${args['type'] ?? 'repositories'}';
    final j = await _gh(
      '/search/$type',
      query: {
        'q': q,
        'per_page':
            '${TelegramToolRunner._int(args, 'limit', fallback: 10, max: 30)}',
        if (args['sort'] != null) 'sort': '${args['sort']}',
      },
    ) as Map;
    final items = (j['items'] as List? ?? const []).cast<Map>();
    return ToolOutput({
      'query': q,
      'total': j['total_count'],
      'results': [
        for (final i in items)
          switch (type) {
            'issues' => {
              'title': i['title'],
              'url': i['html_url'],
              'state': i['state'],
              'kind': i['pull_request'] != null ? 'pull request' : 'issue',
              'comments': i['comments'],
              'updated': '${i['updated_at']}'.substring(0, 10),
            },
            'users' => {
              'login': i['login'],
              'url': i['html_url'],
              'type': i['type'],
            },
            _ => {
              'repo': i['full_name'],
              'owner_avatar': ?(i['owner'] as Map?)?['avatar_url'],
              'forks': ?i['forks_count'],
              'description': ?_short(i['description'], 200),
              'stars': i['stargazers_count'],
              'language': ?i['language'],
              'updated': '${i['pushed_at']}'.substring(0, 10),
            },
          },
      ],
    });
  }

  Future<ToolOutput> _ghIssues(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final number = TelegramToolRunner._intOrNull(args, 'number');
    if (number != null) {
      final i = await _gh('/repos/${r.owner}/${r.name}/issues/$number') as Map;
      final comments = (await _gh(
        '/repos/${r.owner}/${r.name}/issues/$number/comments',
        query: {'per_page': '30'},
      ) as List).cast<Map>();
      return ToolOutput({
        'title': i['title'],
        'url': i['html_url'],
        'kind': i['pull_request'] != null ? 'pull request' : 'issue',
        'state': i['state'],
        'by': (i['user'] as Map?)?['login'],
        'opened': '${i['created_at']}'.substring(0, 10),
        'labels': [
          for (final l in (i['labels'] as List? ?? const []))
            (l as Map)['name'],
        ],
        'body': _short(i['body'], 6000),
        'comments': [
          for (final c in comments)
            {
              'by': (c['user'] as Map?)?['login'],
              'date': '${c['created_at']}'.substring(0, 10),
              'text': _short(c['body'], 1500),
            },
        ],
      });
    }
    final pulls = args['kind'] == 'pulls';
    final list = (await _gh(
      '/repos/${r.owner}/${r.name}/${pulls ? 'pulls' : 'issues'}',
      query: {
        'state': '${args['state'] ?? 'open'}',
        'per_page':
            '${TelegramToolRunner._int(args, 'limit', fallback: 20, max: 50)}',
      },
    ) as List).cast<Map>();
    return ToolOutput({
      'repo': '${r.owner}/${r.name}',
      'count': list.length,
      pulls ? 'pull_requests' : 'issues': [
        for (final i in list)
          if (pulls || i['pull_request'] == null)
            {
              'number': i['number'],
              'title': i['title'],
              'state': i['state'],
              'by': (i['user'] as Map?)?['login'],
              'updated': '${i['updated_at']}'.substring(0, 10),
              if (i['comments'] != null) 'comments': i['comments'],
            },
      ],
    });
  }

  Future<ToolOutput> _ghCommits(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final sha = '${args['sha'] ?? ''}'.trim();
    if (sha.isNotEmpty) {
      final c = await _gh('/repos/${r.owner}/${r.name}/commits/$sha') as Map;
      return ToolOutput({
        'sha': c['sha'],
        'message': (c['commit'] as Map)['message'],
        'author': ((c['commit'] as Map)['author'] as Map?)?['name'],
        'date': '${((c['commit'] as Map)['author'] as Map?)?['date']}'
            .substring(0, 10),
        'stats': c['stats'],
        'files': [
          for (final f in (c['files'] as List? ?? const []).take(60))
            {
              'file': f['filename'],
              'status': f['status'],
              'changes': f['changes'],
              if (f['patch'] != null) 'patch': _short(f['patch'], 1500),
            },
        ],
      });
    }
    final list = (await _gh(
      '/repos/${r.owner}/${r.name}/commits',
      query: {
        if (args['path'] != null) 'path': '${args['path']}',
        if ((args['ref'] ?? r.ref) != null) 'sha': '${args['ref'] ?? r.ref}',
        'per_page':
            '${TelegramToolRunner._int(args, 'limit', fallback: 15, max: 50)}',
      },
    ) as List).cast<Map>();
    return ToolOutput({
      'repo': '${r.owner}/${r.name}',
      'commits': [
        for (final c in list)
          {
            'sha': '${c['sha']}'.substring(0, 7),
            'message': '${(c['commit'] as Map)['message']}'.split('\n').first,
            'author': ((c['commit'] as Map)['author'] as Map?)?['name'],
            'date': '${((c['commit'] as Map)['author'] as Map?)?['date']}'
                .substring(0, 10),
          },
      ],
    });
  }

  Future<ToolOutput> _ghReleases(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final list = (await _gh(
      '/repos/${r.owner}/${r.name}/releases',
      query: {
        'per_page':
            '${TelegramToolRunner._int(args, 'limit', fallback: 5, max: 30)}',
      },
    ) as List).cast<Map>();
    return ToolOutput({
      'repo': '${r.owner}/${r.name}',
      'count': list.length,
      'releases': [
        for (final x in list)
          {
            'tag': x['tag_name'],
            'name': x['name'],
            'date': '${x['published_at']}'.substring(0, 10),
            if (x['prerelease'] == true) 'prerelease': true,
            'notes': ?_short(x['body'], 1500),
            'assets': [
              for (final a in (x['assets'] as List? ?? const []))
                {
                  'name': a['name'],
                  'size_mb': ((a['size'] as num) / 1048576).toStringAsFixed(1),
                  'downloads': a['download_count'],
                  'asset_url': a['browser_download_url'],
                },
            ],
          },
      ],
    });
  }

  Future<ToolOutput> _ghDownload(Map<String, dynamic> args) async {
    final r = _parseRepo('${args['repo'] ?? ''}');
    final what = '${args['what'] ?? 'zip'}';
    final ref = '${args['ref'] ?? r.ref ?? ''}'.trim();
    final Uri url;
    String? name;
    switch (what) {
      case 'asset':
        final u = '${args['asset_url'] ?? ''}';
        if (!u.startsWith('https://github.com/') &&
            !u.startsWith('https://objects.githubusercontent.com/')) {
          throw ArgumentError(
            'asset_url must be a GitHub release download link from github_releases.',
          );
        }
        url = Uri.parse(u);
      case 'file':
        final path = '${args['path'] ?? r.path ?? ''}'.trim().replaceAll(
          RegExp(r'^/+'),
          '',
        );
        if (path.isEmpty) throw ArgumentError('Which file? Give path.');
        url = Uri.parse(
          'https://raw.githubusercontent.com/${r.owner}/${r.name}/${ref.isEmpty ? 'HEAD' : ref}/$path',
        );
      default:
        final branch = ref.isEmpty
            ? await _defaultBranch(r.owner, r.name)
            : ref;
        url = Uri.parse(
          'https://codeload.github.com/${r.owner}/${r.name}/zip/$branch',
        );
        name = '${r.name}-$branch.zip';
    }
    final file = await _web.download(url, name: name);
    final size = await file.length();
    return ToolOutput({
      'created': true,
      'file_path': file.path,
      'name': file.path.split(RegExp(r'[\\/]')).last,
      'size_kb': (size / 1024).ceil(),
      'note': 'Saved on the phone; send it with send_message or use it in run_code.',
    });
  }
}
