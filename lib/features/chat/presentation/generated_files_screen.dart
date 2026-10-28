import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/theme.dart';
import '../../media/audio_center.dart';
import '../../media/audio_player_ui.dart';
import '../../telegram/presentation/chat_actions.dart' show confirmAction;

/// Where a file came from.
enum FileSource {
  generated('Made by AI', Icons.auto_awesome_outlined),
  sandbox('Code sandbox', Icons.terminal_rounded),
  downloads('Downloads', Icons.download_rounded),
  telegram('Telegram', Icons.send_rounded),
  exports('Exports', Icons.ios_share_rounded),
  screenshots('Screenshots', Icons.screenshot_monitor_rounded);

  const FileSource(this.label, this.icon);
  final String label;
  final IconData icon;

  /// Telegram's own cache is TDLib's; the app doesn't delete from it.
  bool get deletable => this != telegram;
}

enum _Kind {
  all('All', Icons.apps_rounded),
  images('Images', Icons.image_outlined),
  videos('Videos', Icons.movie_outlined),
  audio('Audio', Icons.graphic_eq_rounded),
  documents('Documents', Icons.description_outlined);

  const _Kind(this.label, this.icon);
  final String label;
  final IconData icon;
}

const _imageExt = {'png', 'jpg', 'jpeg', 'webp', 'gif', 'heic', 'bmp'};
const _videoExt = {'mp4', 'mov', 'm4v', 'webm', 'mkv', '3gp'};
const _audioExt = {'mp3', 'm4a', 'wav', 'ogg', 'oga', 'opus', 'flac', 'aac'};

/// One file the app holds.
class _Entry {
  _Entry(this.file, this.source, this.modified, this.bytes, this.meta);
  final File file;
  final FileSource source;
  final DateTime modified;
  final int bytes;

  /// A generated file's sidecar: its prompt, model, voice…
  final Map<String, dynamic> meta;

  String get name => file.path.split(RegExp(r'[\\/]')).last;
  String get ext => name.contains('.')
      ? name.substring(name.lastIndexOf('.') + 1).toLowerCase()
      : '';
  _Kind get kind => _imageExt.contains(ext)
      ? _Kind.images
      : _videoExt.contains(ext)
      ? _Kind.videos
      : _audioExt.contains(ext)
      ? _Kind.audio
      : _Kind.documents;

  String get title => (meta['prompt'] ?? meta['text'] ?? name).toString();
}

/// Every file the app made or saved: images and audio the assistant
/// generated, the code sandbox's output, web, GitHub and book downloads,
/// screenshots, canvas exports, and media downloaded from Telegram chats.
class GeneratedFilesScreen extends ConsumerStatefulWidget {
  const GeneratedFilesScreen({super.key});

  @override
  ConsumerState<GeneratedFilesScreen> createState() =>
      _GeneratedFilesScreenState();
}

class _GeneratedFilesScreenState extends ConsumerState<GeneratedFilesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: _Kind.values.length,
    vsync: this,
  );
  List<_Entry> _all = const [];
  bool _loading = true;
  final Set<FileSource> _sources = {...FileSource.values};

  /// Every tab as tiles, rather than pictures as tiles and the rest as a list.
  bool _gridView = false;
  static const _gridKey = 'files_grid_view';

  @override
  void initState() {
    super.initState();
    _load();
    SharedPreferences.getInstance().then((p) {
      if (mounted && p.getBool(_gridKey) == true) setState(() => _gridView = true);
    }).ignore();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final root = (await getApplicationSupportDirectory()).path;
    // Only what the app and the assistant made or saved. Media opened while
    // reading Telegram stays in Telegram's own cache and isn't listed; files
    // the assistant downloads from messages are copied into generated.
    final roots = <(String, FileSource, bool)>[
      ('$root/generated', FileSource.generated, false),
      ('$root/sandbox', FileSource.sandbox, true),
      ('$root/downloads', FileSource.downloads, true),
      ('$root/exports', FileSource.exports, false),
      ('$root/screenshots', FileSource.screenshots, false),
    ];
    final out = <_Entry>[];
    for (final (path, source, deep) in roots) {
      final dir = Directory(path);
      if (!await dir.exists()) continue;
      try {
        await for (final e in dir.list(recursive: deep, followLinks: false)) {
          if (e is! File) continue;
          final n = e.path.toLowerCase();
          // Sidecars, the sandbox's own scaffolding, and partial downloads.
          if (n.endsWith('.meta.json') ||
              n.endsWith('.tmp') ||
              n.endsWith('.part'))
            continue;
          if (source == FileSource.sandbox &&
              (n.endsWith('.html') && n.contains('runner')))
            continue;
          final stat = await e.stat();
          if (stat.size == 0) continue;
          var meta = const <String, dynamic>{};
          if (source == FileSource.generated) {
            final dot = e.path.lastIndexOf('.');
            final side = File(
              '${e.path.substring(0, dot < 0 ? e.path.length : dot)}.meta.json',
            );
            if (await side.exists()) {
              try {
                final j = jsonDecode(await side.readAsString());
                if (j is Map) meta = Map<String, dynamic>.from(j);
              } catch (_) {}
            }
          }
          out.add(_Entry(e, source, stat.modified, stat.size, meta));
        }
      } catch (e) {
        debugPrint('[Files] $path: $e');
      }
    }
    out.sort((a, b) => b.modified.compareTo(a.modified));
    if (mounted) {
      setState(() {
        _all = out;
        _loading = false;
      });
    }
  }

  List<_Entry> _of(_Kind kind) => _all
      .where(
        (e) =>
            _sources.contains(e.source) &&
            (kind == _Kind.all || e.kind == kind),
      )
      .toList();

  Future<void> _actions(_Entry e) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(e.name, maxLines: 2, overflow: TextOverflow.ellipsis),
              subtitle: Text(
                '${e.source.label} · ${_formatBytes(e.bytes)} · ${_relativeTime(e.modified)}',
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: lead(const Icon(Icons.open_in_new_rounded)),
              title: const Text('Open'),
              onTap: () => Navigator.pop(c, 'open'),
            ),
            ListTile(
              leading: lead(const Icon(Icons.copy_rounded)),
              title: const Text('Copy path'),
              onTap: () => Navigator.pop(c, 'copy'),
            ),
            if (e.source.deletable)
              ListTile(
                leading: lead(Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.danger,
                )),
                title: Text(
                  'Delete',
                  style: TextStyle(color: AppColors.danger),
                ),
                onTap: () => Navigator.pop(c, 'delete'),
              ),
          ],
        ),
      ),
    );
    if (!mounted) return;
    switch (choice) {
      case 'open':
        _open(e);
        break;
      case 'copy':
        await Clipboard.setData(ClipboardData(text: e.file.path));
        if (mounted) showSnack(context, 'Path copied');
        break;
      case 'delete':
        if (!await confirmAction(
          context,
          title: 'Delete ${e.name}?',
          message: 'It is removed from this phone.',
          action: 'Delete',
        )) {
          return;
        }
        try {
          await e.file.delete();
          final dot = e.file.path.lastIndexOf('.');
          if (dot > 0) {
            final side = File('${e.file.path.substring(0, dot)}.meta.json');
            if (await side.exists()) await side.delete();
          }
        } catch (err) {
          if (mounted)
            showSnack(
              context,
              'Couldn\'t delete: $err',
              icon: Icons.error_outline_rounded,
            );
        }
        await _load();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _of(_Kind.all).fold<int>(0, (n, e) => n + e.bytes);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
        actions: [
          IconButton(
            tooltip: _gridView ? 'Show as a list' : 'Show as a grid',
            icon: Icon(_gridView ? Icons.view_list_rounded : Icons.grid_view_rounded),
            onPressed: () {
              setState(() => _gridView = !_gridView);
              SharedPreferences.getInstance().then((p) => p.setBool(_gridKey, _gridView)).ignore();
            },
          ),
          IconButton(
            tooltip: 'Refresh',
            onPressed: _loading
                ? null
                : () {
                    setState(() => _loading = true);
                    _load();
                  },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: [
            for (final k in _Kind.values)
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(k.icon, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      '${k.label}${_loading || _of(k).isEmpty ? '' : ' ${_of(k).length}'}',
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(
                Space.m,
                Space.s,
                Space.m,
                Space.xs,
              ),
              children: [
                // Only kinds there are files of: without Telegram, no Telegram chip.
                for (final s in FileSource.values)
                  if (_all.any((e) => e.source == s))
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        // FilterChip's default avatar colour is black on some
                        // Material states, which disappears against this dark UI.
                        avatar: Icon(s.icon, size: 15, color: AppColors.text2),
                        label: Text(
                          '${s.label} ${_all.where((e) => e.source == s).length}',
                        ),
                        selected: _sources.contains(s),
                        showCheckmark: false,
                        onSelected: (on) => setState(
                          () => on ? _sources.add(s) : _sources.remove(s),
                        ),
                      ),
                    ),
              ],
            ),
          ),
          if (!_loading)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Space.l,
                Space.xs,
                Space.l,
                Space.xs,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_of(_Kind.all).length} files · ${_formatBytes(total)}',
                  style: context.text.labelSmall,
                ),
              ),
            ),
          Expanded(
            child: _loading
                ? const Center(
                    child: SizedBox.square(
                      dimension: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : TabBarView(
                    controller: _tabs,
                    children: [
                      for (final k in _Kind.values)
                        k == _Kind.images || _gridView
                            ? _Grid(
                                entries: _of(k),
                                onTap: _open,
                                onLongPress: _actions,
                              )
                            : _List(
                                entries: _of(k),
                                kind: k,
                                onTap: _open,
                                onLongPress: _actions,
                              ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  void _open(_Entry e) {
    if (e.kind == _Kind.images) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(e.name, overflow: TextOverflow.ellipsis),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () => _actions(e),
                ),
              ],
            ),
            body: Center(
              child: InteractiveViewer(maxScale: 6, child: Image.file(e.file)),
            ),
          ),
        ),
      );
      return;
    }
    if (e.kind == _Kind.audio) {
      unawaited(
        ref
            .read(audioCenterProvider)
            .play(
              Track.localFile(
                path: e.file.path,
                title: e.name,
                subtitle: e.source.label,
                voice: e.meta['voice'] == true,
              ),
            ),
      );
      showAudioPlayer(context);
      return;
    }
    OpenFilex.open(e.file.path);
  }
}

class _Grid extends StatelessWidget {
  const _Grid({
    required this.entries,
    required this.onTap,
    required this.onLongPress,
  });
  final List<_Entry> entries;
  final void Function(_Entry) onTap;
  final void Function(_Entry) onLongPress;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty)
      return const _FilesEmpty(
        icon: Icons.image_outlined,
        text: 'No images yet.',
      );
    return GridView.builder(
      padding: const EdgeInsets.all(Space.m),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        mainAxisSpacing: Space.s,
        crossAxisSpacing: Space.s,
      ),
      itemCount: entries.length,
      itemBuilder: (_, i) {
        final e = entries[i];
        return GestureDetector(
          onTap: () => onTap(e),
          onLongPress: () => onLongPress(e),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Radii.m),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (e.kind == _Kind.images)
                  Image.file(
                    e.file,
                    fit: BoxFit.cover,
                    cacheWidth: 360,
                    errorBuilder: (_, _, _) => Container(
                      color: AppColors.surface2,
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: AppColors.text3,
                      ),
                    ),
                  )
                else
                  // Not a picture: its kind and name on a tile.
                  Container(
                    color: AppColors.surface2,
                    padding: const EdgeInsets.fromLTRB(Space.m, Space.m, Space.m, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(e.kind.icon, color: AppColors.text2, size: 28),
                        const Spacer(),
                        Text(
                          e.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodySmall?.copyWith(color: AppColors.text),
                        ),
                      ],
                    ),
                  ),
                Positioned(
                  left: 6,
                  bottom: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.55),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(e.source.icon, size: 12, color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 6,
                  bottom: 6,
                  child: _DatePill(date: e.modified),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    required this.entries,
    required this.kind,
    required this.onTap,
    required this.onLongPress,
  });
  final List<_Entry> entries;
  final _Kind kind;
  final void Function(_Entry) onTap;
  final void Function(_Entry) onLongPress;

  IconData _icon(_Entry e) => switch (e.kind) {
    _Kind.images => Icons.image_outlined,
    _Kind.videos => Icons.movie_outlined,
    _Kind.audio => Icons.music_note_rounded,
    _ => switch (e.ext) {
      'pdf' => Icons.picture_as_pdf_outlined,
      'zip' || 'rar' || '7z' || 'tar' || 'gz' => Icons.folder_zip_outlined,
      'html' || 'htm' => Icons.language_rounded,
      'md' || 'txt' => Icons.notes_rounded,
      'json' || 'csv' || 'xml' => Icons.data_object_rounded,
      'py' || 'js' || 'dart' || 'ts' => Icons.code_rounded,
      'epub' || 'mobi' => Icons.menu_book_outlined,
      _ => Icons.insert_drive_file_outlined,
    },
  };

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return _FilesEmpty(icon: kind.icon, text: 'Nothing here yet.');
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(Space.m, Space.xs, Space.m, Space.xl),
      itemCount: entries.length,
      separatorBuilder: (_, _) => const SizedBox(height: 6),
      itemBuilder: (_, i) {
        final e = entries[i];
        return Material(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(Radii.m),
          child: InkWell(
            borderRadius: BorderRadius.circular(Radii.m),
            onTap: () => onTap(e),
            onLongPress: () => onLongPress(e),
            child: Padding(
              padding: const EdgeInsets.all(Space.m),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.surface3,
                      borderRadius: BorderRadius.circular(Radii.s),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: e.kind == _Kind.images
                        ? Image.file(e.file, fit: BoxFit.cover, cacheWidth: 120)
                        : Icon(_icon(e), color: AppColors.accent, size: 22),
                  ),
                  const SizedBox(width: Space.m),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleSmall,
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(
                              e.source.icon,
                              size: 12,
                              color: AppColors.text3,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                '${e.source.label} · ${e.ext.toUpperCase()} · ${_formatBytes(e.bytes)} · ${_relativeTime(e.modified)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.text.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 20,
                      color: AppColors.text3,
                    ),
                    onPressed: () => onLongPress(e),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DatePill extends StatelessWidget {
  const _DatePill({required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: .60),
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      _relativeTime(date),
      style: const TextStyle(fontSize: 10.5, color: Colors.white),
    ),
  );
}

class _FilesEmpty extends StatelessWidget {
  const _FilesEmpty({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Space.xxl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: AppColors.text3),
          const SizedBox(height: Space.m),
          Text(
            text,
            style: context.text.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Space.xs),
          Text(
            'Generated images and audio, code output, downloads, exports and media saved from chats appear here.',
            style: context.text.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

String _relativeTime(DateTime date) {
  final elapsed = DateTime.now().difference(date);
  if (elapsed.inMinutes < 1) return 'just now';
  if (elapsed.inHours < 1) return '${elapsed.inMinutes}m ago';
  if (elapsed.inDays < 1) return '${elapsed.inHours}h ago';
  if (elapsed.inDays < 7) return '${elapsed.inDays}d ago';
  return '${date.day}/${date.month}/${date.year}';
}

String _formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
  if (bytes < 1024 * 1024 * 1024)
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
}
