import 'package:flutter/material.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme.dart';
import 'formatted_text.dart';
import 'td_image.dart';

/// The picture a preview carries, as a file plus its blurred stand-in.
({td.File? file, td.Minithumbnail? mini, bool video})? _media(td.LinkPreviewType t) {
  ({td.File? file, td.Minithumbnail? mini, bool video}) fromPhoto(td.Photo? p, {bool video = false}) =>
      (file: TdFileImage.bestSize(p), mini: p?.minithumbnail, video: video);
  ({td.File? file, td.Minithumbnail? mini, bool video}) fromThumb(td.Thumbnail? th, td.Minithumbnail? mini, {bool video = false}) =>
      (file: th?.file, mini: mini, video: video);
  return switch (t) {
    td.LinkPreviewTypeArticle(:final photo?) => fromPhoto(photo),
    td.LinkPreviewTypePhoto(photo: final p) => fromPhoto(p),
    td.LinkPreviewTypeApp(photo: final p) || td.LinkPreviewTypeWebApp(photo: final p) => fromPhoto(p),
    td.LinkPreviewTypeEmbeddedVideoPlayer(:final thumbnail?) => fromPhoto(thumbnail, video: true),
    td.LinkPreviewTypeEmbeddedAnimationPlayer(:final thumbnail?) => fromPhoto(thumbnail, video: true),
    td.LinkPreviewTypeVideo(:final video) => fromThumb(video.thumbnail, video.minithumbnail, video: true),
    td.LinkPreviewTypeAnimation(:final animation) => fromThumb(animation.thumbnail, animation.minithumbnail, video: true),
    td.LinkPreviewTypeDocument(:final document) when document.thumbnail != null => fromThumb(
      document.thumbnail,
      document.minithumbnail,
    ),
    td.LinkPreviewTypeSticker(:final sticker) => fromThumb(sticker.thumbnail, null),
    td.LinkPreviewTypeChat(photo: final p?) || td.LinkPreviewTypeUser(photo: final p?) => (
      file: p.sizes.isEmpty ? null : p.sizes.last.photo,
      mini: p.minithumbnail,
      video: false,
    ),
    _ => null,
  };
}

String? _kindLabel(td.LinkPreviewType t) => switch (t) {
  td.LinkPreviewTypeChat(:final type) => switch (type) {
    td.InviteLinkChatTypeChannel() => 'Channel',
    _ => 'Group',
  },
  td.LinkPreviewTypeUser(:final isBot) => isBot ? 'Bot' : 'User',
  td.LinkPreviewTypeVideo() || td.LinkPreviewTypeEmbeddedVideoPlayer() || td.LinkPreviewTypeExternalVideo() => 'Video',
  td.LinkPreviewTypeAudio() || td.LinkPreviewTypeEmbeddedAudioPlayer() || td.LinkPreviewTypeExternalAudio() => 'Audio',
  td.LinkPreviewTypeDocument() => 'File',
  td.LinkPreviewTypeStory() => 'Story',
  td.LinkPreviewTypeStickerSet() => 'Sticker pack',
  td.LinkPreviewTypeMessage() => 'Message',
  td.LinkPreviewTypeVideoChat() => 'Video chat',
  td.LinkPreviewTypeWebApp() || td.LinkPreviewTypeApp() => 'App',
  _ => null,
};

/// A message's link preview, as Telegram draws it: a tinted bar with the
/// site, title and description, and the page's picture (large under the
/// text, or a small square beside it). Tapping opens the link.
class LinkPreviewCard extends StatelessWidget {
  const LinkPreviewCard({super.key, required this.preview, this.tint});
  final td.LinkPreview preview;
  final Color? tint;

  Color get accent => tint ?? AppColors.accent;

  @override
  Widget build(BuildContext context) {
    final p = preview;
    final media = _media(p.type);
    final large = media != null && (p.showLargeMedia || (p.hasLargeMedia && p.title.isEmpty));
    final label = _kindLabel(p.type);
    final site = p.siteName.isNotEmpty ? p.siteName : (label ?? p.displayUrl);
    final desc = p.description.text;

    Widget picture({required double height, double? width}) => ClipRRect(
      borderRadius: BorderRadius.circular(Radii.s),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            TdFileImage(file: media!.file, minithumbnail: media.mini, priority: 3),
            if (media.video)
              const Center(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );

    final texts = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          site,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: accent, fontWeight: FontWeight.w600, fontSize: 13.5),
        ),
        if (p.title.isNotEmpty)
          Text(
            p.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.text),
          ),
        if (desc.isNotEmpty)
          Text.rich(
            formattedSpan(p.description, link: accent),
            maxLines: large ? 4 : 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13.5, height: 1.3, color: AppColors.text2),
          ),
        if (p.author.isNotEmpty)
          Text(p.author, maxLines: 1, style: const TextStyle(fontSize: 12, color: AppColors.text3)),
        if (p.instantViewVersion > 0)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt_rounded, size: 14, color: accent),
                Text('Instant View', style: TextStyle(fontSize: 12, color: accent, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: Space.s),
      child: Material(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Radii.s + 2),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => launchUrl(Uri.parse(p.url), mode: LaunchMode.externalApplication),
          child: Container(
            decoration: BoxDecoration(border: Border(left: BorderSide(color: accent, width: 3))),
            padding: const EdgeInsets.fromLTRB(Space.s + 2, Space.s, Space.s, Space.s),
            child: large
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (p.showMediaAboveDescription) ...[picture(height: 170), const SizedBox(height: Space.s)],
                      texts,
                      if (!p.showMediaAboveDescription) ...[const SizedBox(height: Space.s), picture(height: 170)],
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: texts),
                      if (media != null) ...[const SizedBox(width: Space.s), picture(height: 56, width: 56)],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
