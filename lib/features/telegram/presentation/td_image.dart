import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../data/file_loader.dart';

/// A Telegram file shown as an image, downloaded on first sight. Until it
/// arrives, [minithumbnail] (when given) is shown blurred, or [placeholder].
class TdFileImage extends ConsumerStatefulWidget {
  const TdFileImage({
    super.key,
    required this.file,
    this.minithumbnail,
    this.fit = BoxFit.cover,
    this.priority = 4,
    this.placeholder,
  });
  final td.File? file;
  final td.Minithumbnail? minithumbnail;
  final BoxFit fit;
  final int priority;
  final Widget? placeholder;

  /// The largest size of [photo] that is at most [maxWidth] wide.
  static td.File? bestSize(td.Photo? photo, {int maxWidth = 1280}) {
    if (photo == null || photo.sizes.isEmpty) return null;
    final sizes = [...photo.sizes]..sort((a, b) => a.width.compareTo(b.width));
    return (sizes.lastWhere((s) => s.width <= maxWidth, orElse: () => sizes.first)).photo;
  }

  @override
  ConsumerState<TdFileImage> createState() => _TdFileImageState();
}

class _TdFileImageState extends ConsumerState<TdFileImage> {
  String? _path;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(TdFileImage old) {
    super.didUpdateWidget(old);
    if (old.file?.id != widget.file?.id) {
      _path = null;
      _load();
    }
  }

  void _load() {
    final f = widget.file;
    if (f == null) return;
    final loader = ref.read(fileLoaderProvider);
    _path = loader.cachedPath(f);
    if (_path == null) {
      loader.download(f, priority: widget.priority).then((p) {
        if (mounted && p != null && widget.file?.id == f.id) setState(() => _path = p);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_path != null) {
      return Image.file(
        File(_path!),
        fit: widget.fit,
        gaplessPlayback: true,
        width: double.infinity,
        height: double.infinity,
      );
    }
    final mini = widget.minithumbnail;
    if (mini != null) {
      return Image.memory(
        base64Decode(mini.data),
        fit: widget.fit,
        width: double.infinity,
        height: double.infinity,
        gaplessPlayback: true,
      );
    }
    return widget.placeholder ?? const ColoredBox(color: AppColors.surface2);
  }
}
