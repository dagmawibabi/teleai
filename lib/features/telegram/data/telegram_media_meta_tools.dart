part of 'telegram_tools.dart';

// Music, movies and TV: metadata from free, keyless sources. Apple's iTunes
// Search API for songs, albums and artists (artwork, 30-second previews);
// MusicBrainz and Wikipedia for artist facts and summaries; Wikidata for
// films (iTunes stopped returning them), with posters and summaries from
// Wikipedia; TVmaze for shows, seasons, episodes and cast.

final _mediaMetaTools = <TelegramTool>[
  TelegramTool(
    name: 'music_search',
    label: 'Searching music',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description:
        'Finds songs, albums or artists (Apple Music catalogue, no account): title, artist, album, year, genre, '
        'length, artwork, a 30-second preview, and YouTube Music / Spotify links (the user is on Android: share those, '
        'not Apple Music links). type: song (default), album or artist. The user sees cards they can tap and play.',
    parameters: _obj({
      'query': {'type': 'string'},
      'type': {
        'type': 'string',
        'enum': ['song', 'album', 'artist'],
      },
      'limit': {'type': 'integer', 'description': '1-25, default 10.'},
      'country': {'type': 'string', 'description': 'Two-letter store country, default us.'},
    }, ['query']),
  ),
  TelegramTool(
    name: 'music_album',
    label: 'Opening an album',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description: 'An album\'s tracks (with previews), release date, genre, label and artwork. album_id from music_search.',
    parameters: _obj({
      'album_id': {'type': 'integer'},
      'country': {'type': 'string'},
    }, ['album_id']),
  ),
  TelegramTool(
    name: 'music_artist',
    label: 'Looking up an artist',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description:
        'An artist: a short biography (Wikipedia), where they\'re from, active years, genres (MusicBrainz) and their '
        'albums, newest first. Give artist_id from music_search, or name.',
    parameters: _obj({
      'artist_id': {'type': 'integer'},
      'name': {'type': 'string'},
      'country': {'type': 'string'},
    }),
  ),
  TelegramTool(
    name: 'movie_search',
    label: 'Searching movies',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description:
        'Finds films: title, year, director, genres, length and poster (Wikidata and Wikipedia, no account). For TV '
        'series use tv_search.',
    parameters: _obj({
      'query': {'type': 'string'},
      'limit': {'type': 'integer', 'description': '1-12, default 8.'},
    }, ['query']),
  ),
  TelegramTool(
    name: 'movie_details',
    label: 'Looking up a movie',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description:
        'One film in full: Wikipedia summary, director, writers, main cast, release date, genres, runtime, country, '
        'language, age rating, budget and box office when known, poster, trailer and IMDb link. movie_id (like '
        '"Q25188") from movie_search.',
    parameters: _obj({
      'movie_id': {'type': 'string'},
    }, ['movie_id']),
  ),
  TelegramTool(
    name: 'tv_search',
    label: 'Searching TV shows',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description: 'Finds TV series (TVmaze): network, years, status, genres, rating, poster and summary.',
    parameters: _obj({
      'query': {'type': 'string'},
    }, ['query']),
  ),
  TelegramTool(
    name: 'tv_show',
    label: 'Looking up a TV show',
    category: ToolCategory.discover,
    cost: ToolCost.web,
    description:
        'A TV series in full: summary, seasons (episode counts and dates), main cast, the next episode if it is still '
        'airing, and with season set, that season\'s episodes. show_id from tv_search.',
    parameters: _obj({
      'show_id': {'type': 'integer'},
      'season': {'type': 'integer'},
    }, ['show_id']),
  ),
];

extension _MediaMetaTools on TelegramToolRunner {
  Future<ToolOutput>? _runMediaMeta(String name, Map<String, dynamic> args) => switch (name) {
    'music_search' => _musicSearch(args),
    'music_album' => _musicAlbum(args),
    'music_artist' => _musicArtist(args),
    'movie_search' => _movieSearch(args),
    'movie_details' => _movieDetails(args),
    'tv_search' => _tvSearch(args),
    'tv_show' => _tvShow(args),
    _ => null,
  };

  // ---- shared ------------------------------------------------------------------

  static String? _shorten(Object? s, [int max = 600]) {
    if (s == null) return null;
    final t = '$s'.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (t.isEmpty) return null;
    return t.length > max ? '${t.substring(0, max)}…' : t;
  }

  static const _ua = {'user-agent': 'TeleAI/1.0 ( https://github.com/dagmawibabi/teleai )'};

  String _country(Map<String, dynamic> args) {
    final c = '${args['country'] ?? ''}'.trim().toLowerCase();
    return RegExp(r'^[a-z]{2}$').hasMatch(c) ? c : 'us';
  }

  /// iTunes artwork comes at 100 px; the same URL serves any size.
  static String? _art(Object? url, [int px = 600]) =>
      url is String && url.isNotEmpty ? url.replaceFirst(RegExp(r'/\d+x\d+bb\.'), '/${px}x${px}bb.') : null;

  static String _length(Object? ms) {
    if (ms is! num || ms <= 0) return '';
    final s = ms ~/ 1000;
    return s >= 3600 ? '${s ~/ 3600}h ${(s % 3600) ~/ 60}m' : '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  static String? _year(Object? date) => date is String && date.length >= 4 ? date.substring(0, 4) : null;

  Future<List<Map>> _itunes(String path, Map<String, String> query) async {
    final j = await _json(Uri.https('itunes.apple.com', path, query)) as Map;
    return (j['results'] as List? ?? const []).whereType<Map>().toList();
  }

  /// A Wikipedia article's lead, trying [titles] in turn; skips
  /// disambiguation pages.
  Future<Map<String, dynamic>?> _wikiSummary(List<String> titles) async {
    for (final t in titles) {
      try {
        final j = await _json(
          Uri.parse('https://en.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(t.replaceAll(' ', '_'))}'),
          headers: _ua,
        ) as Map;
        if (j['type'] == 'disambiguation' || j['extract'] == null) continue;
        return {
          'summary': _shorten(j['extract'], 1200),
          if ((j['thumbnail'] as Map?)?['source'] != null) 'image': (j['thumbnail'] as Map)['source'],
          if (((j['content_urls'] as Map?)?['desktop'] as Map?)?['page'] != null)
            'wikipedia': ((j['content_urls'] as Map)['desktop'] as Map)['page'],
        };
      } catch (_) {
        // Not found: try the next title.
      }
    }
    return null;
  }

  Map<String, dynamic> _song(Map t) => {
    'song_id': t['trackId'],
    'title': t['trackName'],
    'artist': t['artistName'],
    if (t['artistId'] != null) 'artist_id': t['artistId'],
    if (t['collectionName'] != null) 'album': t['collectionName'],
    if (t['collectionId'] != null) 'album_id': t['collectionId'],
    if (_year(t['releaseDate']) != null) 'year': _year(t['releaseDate']),
    if (t['primaryGenreName'] != null) 'genre': t['primaryGenreName'],
    if (_length(t['trackTimeMillis']).isNotEmpty) 'length': _length(t['trackTimeMillis']),
    if (t['trackNumber'] != null) 'track': t['trackNumber'],
    if (t['trackExplicitness'] == 'explicit') 'explicit': true,
    'artwork': ?_art(t['artworkUrl100']),
    if (t['previewUrl'] != null) 'preview': t['previewUrl'],
    ..._listenLinks('${t['trackName']} ${t['artistName']}'),
    if (t['trackViewUrl'] != null) 'url': t['trackViewUrl'],
  };

  /// Where to listen, for any phone: YouTube Music and Spotify searches.
  static Map<String, String> _listenLinks(String query) => {
    'youtube_music': 'https://music.youtube.com/search?q=${Uri.encodeComponent(query)}',
    'spotify': 'https://open.spotify.com/search/${Uri.encodeComponent(query)}',
  };

  Map<String, dynamic> _album(Map a) => {
    'album_id': a['collectionId'],
    'title': a['collectionName'],
    'artist': a['artistName'],
    if (a['artistId'] != null) 'artist_id': a['artistId'],
    if (_year(a['releaseDate']) != null) 'year': _year(a['releaseDate']),
    if (a['releaseDate'] != null) 'released': '${a['releaseDate']}'.substring(0, 10),
    if (a['primaryGenreName'] != null) 'genre': a['primaryGenreName'],
    if (a['trackCount'] != null) 'tracks': a['trackCount'],
    if (a['collectionExplicitness'] == 'explicit') 'explicit': true,
    if (a['copyright'] != null) 'label': a['copyright'],
    'artwork': ?_art(a['artworkUrl100']),
    ..._listenLinks('${a['collectionName']} ${a['artistName']}'),
    if (a['collectionViewUrl'] != null) 'url': a['collectionViewUrl'],
  };

  // ---- music -------------------------------------------------------------------

  Future<ToolOutput> _musicSearch(Map<String, dynamic> args) async {
    final q = '${args['query'] ?? ''}'.trim();
    if (q.isEmpty) throw ArgumentError('query is required');
    final type = '${args['type'] ?? 'song'}';
    final limit = TelegramToolRunner._int(args, 'limit', fallback: 10, min: 1, max: 25);
    final entity = switch (type) {
      'album' => 'album',
      'artist' => 'musicArtist',
      _ => 'song',
    };
    final rows = await _itunes('/search', {'term': q, 'media': 'music', 'entity': entity, 'limit': '$limit', 'country': _country(args)});
    final out = switch (type) {
      'album' => [for (final r in rows) _album(r)],
      'artist' => [
        for (final r in rows)
          {
            'artist_id': r['artistId'],
            'name': r['artistName'],
            if (r['primaryGenreName'] != null) 'genre': r['primaryGenreName'],
            if (r['artistLinkUrl'] != null) 'url': r['artistLinkUrl'],
          },
      ],
      _ => [for (final r in rows) _song(r)],
    };
    return ToolOutput({
      'query': q,
      'type': type,
      'results': out,
      if (out.isEmpty) 'note': 'Nothing found; try another spelling or fewer words.',
      'source': 'Apple Music catalogue (iTunes Search API)',
    });
  }

  Future<ToolOutput> _musicAlbum(Map<String, dynamic> args) async {
    final id = TelegramToolRunner._intOrNull(args, 'album_id') ?? (throw ArgumentError('album_id is required'));
    final rows = await _itunes('/lookup', {'id': '$id', 'entity': 'song', 'country': _country(args)});
    final album = rows.where((r) => r['wrapperType'] == 'collection').firstOrNull;
    if (album == null) throw ArgumentError('No album with that id.');
    final tracks = [for (final r in rows) if (r['wrapperType'] == 'track') _song(r)];
    return ToolOutput({...(_album(album)), 'track_list': tracks});
  }

  Future<ToolOutput> _musicArtist(Map<String, dynamic> args) async {
    var id = TelegramToolRunner._intOrNull(args, 'artist_id');
    final country = _country(args);
    String? name = '${args['name'] ?? ''}'.trim();
    if (id == null) {
      if (name.isEmpty) throw ArgumentError('Give artist_id or name.');
      final found = await _itunes('/search', {'term': name, 'media': 'music', 'entity': 'musicArtist', 'limit': '1', 'country': country});
      if (found.isEmpty) throw ArgumentError('No artist called "$name" found.');
      id = (found.first['artistId'] as num).toInt();
    }
    final rows = await _itunes('/lookup', {'id': '$id', 'entity': 'album', 'limit': '50', 'country': country});
    final artist = rows.where((r) => r['wrapperType'] == 'artist').firstOrNull;
    if (artist == null) throw ArgumentError('No artist with that id.');
    name = '${artist['artistName']}';
    final albums = [for (final r in rows) if (r['wrapperType'] == 'collection') _album(r)]
      ..sort((a, b) => '${b['released'] ?? ''}'.compareTo('${a['released'] ?? ''}'));

    // Facts from MusicBrainz: country, years, kind, genres.
    Map<String, dynamic> facts = {};
    try {
      final mb = await _json(
        Uri.https('musicbrainz.org', '/ws/2/artist', {'query': 'artist:"$name"', 'fmt': 'json', 'limit': '1'}),
        headers: _ua,
      ) as Map;
      final a = (mb['artists'] as List? ?? const []).whereType<Map>().firstOrNull;
      if (a != null && (a['score'] as num? ?? 0) >= 90) {
        final span = a['life-span'] as Map? ?? const {};
        facts = {
          if (a['type'] != null) 'kind': a['type'],
          if ((a['area'] as Map?)?['name'] != null) 'from': (a['area'] as Map)['name'],
          if ((a['begin-area'] as Map?)?['name'] != null) 'origin': (a['begin-area'] as Map)['name'],
          if (span['begin'] != null) 'active_since': span['begin'],
          if (span['ended'] == true && span['end'] != null) 'until': span['end'],
          if (a['disambiguation'] != null) 'known_as': a['disambiguation'],
          'tags': [
            for (final t in ((a['tags'] as List? ?? const []).whereType<Map>().toList()
              ..sort((x, y) => ((y['count'] as num?) ?? 0).compareTo((x['count'] as num?) ?? 0))).take(6))
              t['name'],
          ],
        };
      }
    } catch (_) {
      // MusicBrainz is busy or doesn't know them: the rest still stands.
    }
    final wiki = await _wikiSummary(['$name (band)', '$name (musician)', '$name (singer)', '$name (rapper)', name]);
    return ToolOutput({
      'artist_id': id,
      'name': name,
      if (artist['primaryGenreName'] != null) 'genre': artist['primaryGenreName'],
      ...facts,
      ...?wiki,
      'artwork': ?albums.firstOrNull?['artwork'],
      'albums': albums.take(25).toList(),
      if (artist['artistLinkUrl'] != null) 'url': artist['artistLinkUrl'],
    });
  }

  // ---- movies ------------------------------------------------------------------

  /// Runs a Wikidata SPARQL query; the rows, values as plain strings.
  Future<List<Map<String, String>>> _wikidata(String sparql) async {
    final j = await _json(
      Uri.https('query.wikidata.org', '/sparql', {'query': sparql, 'format': 'json'}),
      headers: {..._ua, 'accept': 'application/sparql-results+json'},
    ) as Map;
    return [
      for (final b in ((j['results'] as Map?)?['bindings'] as List? ?? const []).whereType<Map>())
        {for (final e in b.entries) '${e.key}': '${(e.value as Map)['value']}'},
    ];
  }

  static String _qid(String uri) => uri.split('/').last;

  static String _quote(String s) => s.replaceAll('\\', ' ').replaceAll('"', ' ');

  /// Film and its kinds: feature, TV, animated, short, documentary.
  static const _filmTypes = 'wd:Q11424 wd:Q24869 wd:Q506240 wd:Q202866 wd:Q24862 wd:Q93204 wd:Q229390';

  /// The poster: a film article's lead image on English Wikipedia.
  Future<String?> _wikiImage(String? article) async {
    if (article == null) return null;
    try {
      final title = Uri.decodeComponent(article.split('/wiki/').last);
      final j = await _json(
        Uri.parse('https://en.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(title)}'),
        headers: _ua,
      ) as Map;
      return ((j['originalimage'] ?? j['thumbnail']) as Map?)?['source'] as String?;
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> _film(Map<String, String> r) {
    final genres = (r['genres'] ?? '').split(', ').where((g) => g.isNotEmpty).map((g) => g.replaceAll(' film', '')).toList();
    final minutes = double.tryParse(r['duration'] ?? '')?.round();
    return {
      'movie_id': _qid(r['item']!),
      'title': r['itemLabel'],
      if (r['itemDescription'] != null) 'about': r['itemDescription'],
      if (_year(r['released']) != null) 'year': _year(r['released']),
      if (r['released'] != null) 'released': r['released']!.substring(0, 10),
      if ((r['directors'] ?? '').isNotEmpty) 'director': r['directors'],
      if (genres.isNotEmpty) 'genre': genres.take(3).join(', '),
      if (minutes != null && minutes > 0) 'runtime': minutes >= 60 ? '${minutes ~/ 60}h ${minutes % 60}m' : '$minutes min',
      if (r['imdbId'] != null) 'imdb': 'https://www.imdb.com/title/${r['imdbId']}/',
      if (r['wiki'] != null) 'wikipedia': r['wiki'],
    };
  }

  Future<ToolOutput> _movieSearch(Map<String, dynamic> args) async {
    final q = '${args['query'] ?? ''}'.trim();
    if (q.isEmpty) throw ArgumentError('query is required');
    final limit = TelegramToolRunner._int(args, 'limit', fallback: 8, min: 1, max: 12);
    final rows = await _wikidata('''
SELECT ?item ?itemLabel ?itemDescription ?num (MIN(?date) AS ?released) (SAMPLE(?dur) AS ?duration)
  (GROUP_CONCAT(DISTINCT ?dirLabel; separator=", ") AS ?directors)
  (GROUP_CONCAT(DISTINCT ?genreLabel; separator=", ") AS ?genres)
  (SAMPLE(?imdb) AS ?imdbId) (SAMPLE(?article) AS ?wiki) WHERE {
  SERVICE wikibase:mwapi {
    bd:serviceParam wikibase:api "EntitySearch"; wikibase:endpoint "www.wikidata.org";
      mwapi:search "${_quote(q)}"; mwapi:language "en"; mwapi:limit "30".
    ?item wikibase:apiOutputItem mwapi:item. ?num wikibase:apiOrdinal true.
  }
  ?item wdt:P31 ?type. VALUES ?type { $_filmTypes }
  OPTIONAL { ?item wdt:P577 ?date. }
  OPTIONAL { ?item wdt:P2047 ?dur. }
  OPTIONAL { ?item wdt:P57 ?dir. ?dir rdfs:label ?dirLabel. FILTER(LANG(?dirLabel) = "en") }
  OPTIONAL { ?item wdt:P136 ?genre. ?genre rdfs:label ?genreLabel. FILTER(LANG(?genreLabel) = "en") }
  OPTIONAL { ?item wdt:P345 ?imdb. }
  OPTIONAL { ?article schema:about ?item; schema:isPartOf <https://en.wikipedia.org/>. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
} GROUP BY ?item ?itemLabel ?itemDescription ?num ORDER BY ?num LIMIT 30''');
    // Films with an English Wikipedia article first (the well-known ones),
    // otherwise in the search's own order.
    rows.sort((x, y) {
      final wx = x['wiki'] != null, wy = y['wiki'] != null;
      if (wx != wy) return wx ? -1 : 1;
      return (int.tryParse(x['num'] ?? '') ?? 99).compareTo(int.tryParse(y['num'] ?? '') ?? 99);
    });
    final films = [for (final r in rows.take(limit)) _film(r)];
    final posters = await Future.wait([for (final f in films) _wikiImage(f['wikipedia'] as String?)]);
    for (final (i, p) in posters.indexed) {
      if (p != null) films[i]['poster'] = p;
    }
    return ToolOutput({
      'query': q,
      'results': films,
      if (films.isEmpty) 'note': 'No films found. For a TV series, try tv_search.',
      'source': 'Wikidata and Wikipedia',
    });
  }

  Future<ToolOutput> _movieDetails(Map<String, dynamic> args) async {
    final id = '${args['movie_id'] ?? ''}'.trim().toUpperCase();
    if (!RegExp(r'^Q\d+$').hasMatch(id)) throw ArgumentError('movie_id is a Wikidata id like Q25188, from movie_search.');
    final rows = await _wikidata('''
SELECT ?item ?itemLabel ?itemDescription (MIN(?date) AS ?released) (SAMPLE(?dur) AS ?duration)
  (GROUP_CONCAT(DISTINCT ?dirLabel; separator=", ") AS ?directors)
  (GROUP_CONCAT(DISTINCT ?writerLabel; separator=", ") AS ?writers)
  (GROUP_CONCAT(DISTINCT ?genreLabel; separator=", ") AS ?genres)
  (GROUP_CONCAT(DISTINCT ?countryLabel; separator=", ") AS ?countries)
  (GROUP_CONCAT(DISTINCT ?langLabel; separator=", ") AS ?languages)
  (SAMPLE(?ratingLabel) AS ?rated) (SAMPLE(?budget) AS ?budgetAmount) (SAMPLE(?box) AS ?boxOffice)
  (SAMPLE(?yt) AS ?trailer) (SAMPLE(?imdb) AS ?imdbId) (SAMPLE(?article) AS ?wiki) WHERE {
  BIND(wd:$id AS ?item)
  OPTIONAL { ?item wdt:P577 ?date. }
  OPTIONAL { ?item wdt:P2047 ?dur. }
  OPTIONAL { ?item wdt:P57 ?dir. ?dir rdfs:label ?dirLabel. FILTER(LANG(?dirLabel) = "en") }
  OPTIONAL { ?item wdt:P58 ?writer. ?writer rdfs:label ?writerLabel. FILTER(LANG(?writerLabel) = "en") }
  OPTIONAL { ?item wdt:P136 ?genre. ?genre rdfs:label ?genreLabel. FILTER(LANG(?genreLabel) = "en") }
  OPTIONAL { ?item wdt:P495 ?country. ?country rdfs:label ?countryLabel. FILTER(LANG(?countryLabel) = "en") }
  OPTIONAL { ?item wdt:P364 ?lang. ?lang rdfs:label ?langLabel. FILTER(LANG(?langLabel) = "en") }
  OPTIONAL { ?item wdt:P1657 ?rating. ?rating rdfs:label ?ratingLabel. FILTER(LANG(?ratingLabel) = "en") }
  OPTIONAL { ?item wdt:P2130 ?budget. }
  OPTIONAL { ?item wdt:P2142 ?box. }
  OPTIONAL { ?item wdt:P1651 ?yt. }
  OPTIONAL { ?item wdt:P345 ?imdb. }
  OPTIONAL { ?article schema:about ?item; schema:isPartOf <https://en.wikipedia.org/>. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
} GROUP BY ?item ?itemLabel ?itemDescription''');
    if (rows.isEmpty || rows.first['itemLabel'] == null) throw ArgumentError('No film with that id.');
    final r = rows.first;
    final cast = await _wikidata('''
SELECT ?actorLabel WHERE {
  wd:$id p:P161 ?st. ?st ps:P161 ?actor. OPTIONAL { ?st pq:P1545 ?order. }
  OPTIONAL { ?actor wikibase:sitelinks ?links. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
} ORDER BY (!BOUND(?order)) xsd:integer(?order) DESC(?links) LIMIT 12''');
    final film = _film(r);
    final title = '${film['title']}';
    final wiki = await _wikiSummary([
      if (r['wiki'] != null) Uri.decodeComponent(r['wiki']!.split('/wiki/').last),
      if (film['year'] != null) '$title (${film['year']} film)',
      '$title (film)',
    ]);
    String money(String? v) {
      final n = double.tryParse(v ?? '');
      return n == null ? '' : NumberFormat.compactCurrency(symbol: r'$').format(n);
    }

    return ToolOutput({
      ...film,
      if ((r['writers'] ?? '').isNotEmpty) 'writers': r['writers'],
      'cast': [for (final c in cast) if (c['actorLabel'] != null) c['actorLabel']],
      if ((r['countries'] ?? '').isNotEmpty) 'country': r['countries'],
      if ((r['languages'] ?? '').isNotEmpty) 'language': r['languages'],
      if (r['rated'] != null) 'rated': r['rated'],
      if (money(r['budgetAmount']).isNotEmpty) 'budget': money(r['budgetAmount']),
      if (money(r['boxOffice']).isNotEmpty) 'box_office': money(r['boxOffice']),
      if (r['trailer'] != null) 'trailer': 'https://www.youtube.com/watch?v=${r['trailer']}',
      if (wiki?['summary'] != null) 'synopsis': wiki!['summary'],
      if (wiki?['image'] != null) 'poster': await _wikiImage(r['wiki']) ?? wiki!['image'],
      'source': 'Wikidata and Wikipedia',
    });
  }

  // ---- TV ----------------------------------------------------------------------

  static String? _plain(Object? html) => html is String ? _shorten(html.replaceAll(RegExp(r'<[^>]+>'), ''), 900) : null;

  Map<String, dynamic> _show(Map s) => {
    'show_id': s['id'],
    'title': s['name'],
    if ((s['genres'] as List?)?.isNotEmpty == true) 'genres': s['genres'],
    if (s['status'] != null) 'status': s['status'],
    if (s['premiered'] != null) 'premiered': s['premiered'],
    if (s['ended'] != null) 'ended': s['ended'],
    if ((s['network'] as Map?)?['name'] != null)
      'network': (s['network'] as Map)['name']
    else if ((s['webChannel'] as Map?)?['name'] != null)
      'network': (s['webChannel'] as Map)['name'],
    if ((s['rating'] as Map?)?['average'] != null) 'rating': '${(s['rating'] as Map)['average']}/10',
    if (s['language'] != null) 'language': s['language'],
    if ((s['runtime'] ?? s['averageRuntime']) != null) 'episode_length': '${s['runtime'] ?? s['averageRuntime']} min',
    if ((s['image'] as Map?)?['original'] != null || (s['image'] as Map?)?['medium'] != null)
      'poster': (s['image'] as Map)['original'] ?? (s['image'] as Map)['medium'],
    'summary': ?_plain(s['summary']),
    if (s['officialSite'] != null) 'official_site': s['officialSite'],
    if (s['url'] != null) 'url': s['url'],
  };

  Future<ToolOutput> _tvSearch(Map<String, dynamic> args) async {
    final q = '${args['query'] ?? ''}'.trim();
    if (q.isEmpty) throw ArgumentError('query is required');
    final rows = await _json(Uri.https('api.tvmaze.com', '/search/shows', {'q': q})) as List;
    final out = [
      for (final r in rows.whereType<Map>().take(10))
        if (r['show'] is Map) {..._show(r['show'] as Map), if (_plain((r['show'] as Map)['summary']) case final s?) 'summary': _shorten(s, 240)},
    ];
    return ToolOutput({'query': q, 'results': out, if (out.isEmpty) 'note': 'No shows found.', 'source': 'TVmaze'});
  }

  Future<ToolOutput> _tvShow(Map<String, dynamic> args) async {
    final id = TelegramToolRunner._intOrNull(args, 'show_id') ?? (throw ArgumentError('show_id is required'));
    final s = await _json(Uri.parse('https://api.tvmaze.com/shows/$id?embed[]=cast&embed[]=seasons&embed[]=nextepisode')) as Map;
    final embedded = s['_embedded'] as Map? ?? const {};
    final seasons = [
      for (final x in (embedded['seasons'] as List? ?? const []).whereType<Map>())
        {
          'season': x['number'],
          if (x['episodeOrder'] != null) 'episodes': x['episodeOrder'],
          if (x['premiereDate'] != null) 'from': x['premiereDate'],
          if (x['endDate'] != null) 'to': x['endDate'],
          if ((x['image'] as Map?)?['medium'] != null) 'poster': (x['image'] as Map)['medium'],
        },
    ];
    final cast = [
      for (final c in (embedded['cast'] as List? ?? const []).whereType<Map>().take(12))
        {
          'actor': (c['person'] as Map?)?['name'],
          'as': (c['character'] as Map?)?['name'],
          if (((c['person'] as Map?)?['image'] as Map?)?['medium'] != null) 'photo': ((c['person'] as Map)['image'] as Map)['medium'],
        },
    ];
    final next = embedded['nextepisode'] as Map?;
    final season = TelegramToolRunner._intOrNull(args, 'season');
    List<Map<String, dynamic>>? episodes;
    if (season != null) {
      final sid = (embedded['seasons'] as List? ?? const []).whereType<Map>().where((x) => x['number'] == season).firstOrNull?['id'];
      if (sid != null) {
        final eps = await _json(Uri.parse('https://api.tvmaze.com/seasons/$sid/episodes')) as List;
        episodes = [
          for (final e in eps.whereType<Map>())
            {
              'episode': e['number'],
              'title': e['name'],
              if (e['airdate'] != null) 'aired': e['airdate'],
              if ((e['rating'] as Map?)?['average'] != null) 'rating': (e['rating'] as Map)['average'],
              'summary': ?_shorten(_plain(e['summary']), 220),
            },
        ];
      }
    }
    return ToolOutput({
      ..._show(s),
      'seasons': seasons,
      'cast': cast,
      if (next != null)
        'next_episode': {'season': next['season'], 'episode': next['number'], 'title': next['name'], 'airs': next['airdate']},
      if (season != null) 'season_episodes': episodes ?? 'No season $season.',
    });
  }
}
