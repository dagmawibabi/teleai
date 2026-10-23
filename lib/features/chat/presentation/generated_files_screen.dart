import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/theme.dart';
import 'widgets/tool_result_view.dart';

/// Local output from the assistant's image and audio generation tools.
class GeneratedFilesScreen extends StatefulWidget {
  const GeneratedFilesScreen({super.key});

  @override
  State<GeneratedFilesScreen> createState() => _GeneratedFilesScreenState();
}

class _GeneratedFilesScreenState extends State<GeneratedFilesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);
  List<_GeneratedFile> _images = const [];
  List<_GeneratedFile> _audio = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final root = await getApplicationSupportDirectory();
    final dir = Directory('${root.path}/generated');
    if (!await dir.exists()) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    final files = <File>[];
    await for (final entity in dir.list()) {
      if (entity is File) files.add(entity);
    }
    files.sort(
      (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
    );
    const imageTypes = {'.png', '.jpg', '.jpeg', '.webp'};
    const audioTypes = {'.mp3', '.m4a', '.wav', '.ogg'};
    String extensionOf(File file) {
      final name = file.path.toLowerCase();
      return name.substring(name.lastIndexOf('.'));
    }

    final rawImages = files
        .where((file) => imageTypes.contains(extensionOf(file)))
        .toList();
    final rawAudio = files
        .where((file) => audioTypes.contains(extensionOf(file)))
        .toList();
    final images = await Future.wait(rawImages.map(_GeneratedFile.load));
    final audio = await Future.wait(rawAudio.map(_GeneratedFile.load));
    if (mounted) {
      setState(() {
        _images = images;
        _audio = audio;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Files'),
      actions: [
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
        tabs: [
          Tab(text: 'Images ${_images.isEmpty ? '' : _images.length}'),
          Tab(text: 'Audio ${_audio.isEmpty ? '' : _audio.length}'),
        ],
      ),
    ),
    body: _loading
        ? const Center(
            child: SizedBox.square(
              dimension: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        : TabBarView(
            controller: _tabs,
            children: [
              _ImageFiles(files: _images),
              _AudioFiles(files: _audio),
            ],
          ),
  );
}

class _ImageFiles extends StatelessWidget {
  const _ImageFiles({required this.files});
  final List<_GeneratedFile> files;

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const _FilesEmpty(
        icon: Icons.image_outlined,
        text: 'Images you generate will appear here.',
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(Space.m),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: Space.m,
        crossAxisSpacing: Space.m,
        childAspectRatio: .74,
      ),
      itemCount: files.length,
      itemBuilder: (_, index) {
        final asset = files[index];
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.surface2,
            borderRadius: BorderRadius.circular(Radii.m),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    GeneratedImage(
                      path: asset.file.path,
                      maxHeight: double.infinity,
                    ),
                    Positioned(
                      right: Space.s,
                      bottom: Space.s,
                      child: _DatePill(date: asset.modified),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Space.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.prompt ?? 'Generated image',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.titleSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      asset.technicalLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.labelSmall,
                    ),
                    if (asset.model != null)
                      Text(
                        asset.model!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.labelSmall?.copyWith(
                          color: AppColors.activeAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AudioFiles extends StatelessWidget {
  const _AudioFiles({required this.files});
  final List<_GeneratedFile> files;

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const _FilesEmpty(
        icon: Icons.graphic_eq_rounded,
        text: 'Audio you generate will appear here.',
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(Space.m),
      itemCount: files.length,
      separatorBuilder: (_, _) => const SizedBox(height: Space.s),
      itemBuilder: (_, index) {
        final asset = files[index];
        return GeneratedAudio(
          path: asset.file.path,
          text: asset.text ?? 'Generated audio',
          details: [
            asset.technicalLabel,
            if (asset.voice != null && asset.voice!.isNotEmpty)
              'Voice: ${asset.voice}',
            if (asset.model != null) asset.model!,
          ].join(' · '),
        );
      },
    );
  }
}

class _GeneratedFile {
  const _GeneratedFile({
    required this.file,
    required this.modified,
    required this.bytes,
    required this.metadata,
    this.width,
    this.height,
  });
  final File file;
  final DateTime modified;
  final int bytes;
  final Map<String, dynamic> metadata;
  final int? width;
  final int? height;

  String? get prompt => metadata['prompt'] as String?;
  String? get text => metadata['text'] as String?;
  String? get model => metadata['model'] as String?;
  String? get voice => metadata['voice'] as String?;
  String get extension {
    final path = file.path;
    return path.substring(path.lastIndexOf('.') + 1).toUpperCase();
  }

  String get technicalLabel => [
    if (width != null && height != null) '$width × $height',
    extension,
    _formatBytes(bytes),
    _relativeTime(modified),
  ].join(' · ');

  static Future<_GeneratedFile> load(File file) async {
    final stat = await file.stat();
    final metadata = <String, dynamic>{};
    try {
      final dot = file.path.lastIndexOf('.');
      final sidecar = File('${file.path.substring(0, dot)}.meta.json');
      if (await sidecar.exists()) {
        final decoded = jsonDecode(await sidecar.readAsString());
        if (decoded is Map) metadata.addAll(Map<String, dynamic>.from(decoded));
      }
    } catch (_) {}

    int? width;
    int? height;
    if (const {
      '.png',
      '.jpg',
      '.jpeg',
      '.webp',
    }.any((extension) => file.path.toLowerCase().endsWith(extension))) {
      try {
        final codec = await ui.instantiateImageCodec(await file.readAsBytes());
        final frame = await codec.getNextFrame();
        width = frame.image.width;
        height = frame.image.height;
        frame.image.dispose();
        codec.dispose();
      } catch (_) {}
    }
    return _GeneratedFile(
      file: file,
      modified: stat.modified,
      bytes: stat.size,
      metadata: metadata,
      width: width,
      height: height,
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
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
}
