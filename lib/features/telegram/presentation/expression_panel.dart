import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../../../core/widgets/glass.dart';
import '../data/file_loader.dart';
import '../data/telegram_tools.dart';

/// A sticker as a picture: the sticker itself when it is a still WebP, else
/// its thumbnail, else the emoji it stands for.
class StickerImage extends ConsumerStatefulWidget {
  const StickerImage({super.key, required this.sticker, this.size = 72});
  final td.Sticker sticker;
  final double size;

  @override
  ConsumerState<StickerImage> createState() => _StickerImageState();
}

class _StickerImageState extends ConsumerState<StickerImage> {
  String? _path;

  td.File? get _file {
    final s = widget.sticker;
    if (s.format is td.StickerFormatWebp) return s.sticker;
    final t = s.thumbnail;
    if (t != null && (t.format is td.ThumbnailFormatWebp || t.format is td.ThumbnailFormatPng || t.format is td.ThumbnailFormatJpeg)) {
      return t.file;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    final f = _file;
    if (f == null) return;
    final loader = ref.read(fileLoaderProvider);
    _path = loader.cachedPath(f);
    if (_path == null) {
      loader.download(f, priority: 6).then((p) {
        if (mounted && p != null) setState(() => _path = p);
      });
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: widget.size,
    child: _path != null
        ? Image.file(File(_path!), fit: BoxFit.contain, gaplessPlayback: true)
        : Center(child: Text(widget.sticker.emoji, style: TextStyle(fontSize: widget.size * 0.5))),
  );
}

/// A GIF's still preview.
class GifThumb extends ConsumerStatefulWidget {
  const GifThumb({super.key, required this.animation});
  final td.Animation animation;

  @override
  ConsumerState<GifThumb> createState() => _GifThumbState();
}

class _GifThumbState extends ConsumerState<GifThumb> {
  String? _path;

  @override
  void initState() {
    super.initState();
    final t = widget.animation.thumbnail;
    if (t == null || !(t.format is td.ThumbnailFormatJpeg || t.format is td.ThumbnailFormatPng || t.format is td.ThumbnailFormatWebp)) return;
    final loader = ref.read(fileLoaderProvider);
    _path = loader.cachedPath(t.file);
    if (_path == null) {
      loader.download(t.file, priority: 4).then((p) {
        if (mounted && p != null) setState(() => _path = p);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mini = widget.animation.minithumbnail;
    return Stack(
      fit: StackFit.expand,
      children: [
        if (_path != null)
          Image.file(File(_path!), fit: BoxFit.cover, gaplessPlayback: true)
        else if (mini != null)
          Image.memory(base64Decode(mini.data), fit: BoxFit.cover)
        else
          Container(color: AppColors.surface3),
        Positioned(
          left: 6,
          bottom: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
            child: const Text('GIF', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

enum _Pane { emoji, gifs, stickers }

const _quickMoods = ['❤️', '👍', '👎', '🎉', '😂', '😢', '😮', '😡', '🙏', '🔥', '👋', '🤔'];

const _emojiCategories = <(IconData, List<String>)>[
  (Icons.emoji_emotions_outlined, ['😀', '😃', '😄', '😁', '😆', '😅', '🤣', '😂', '🙂', '🙃', '😉', '😊', '😇', '🥰', '😍', '🤩', '😘', '😗', '😚', '😋', '😛', '😜', '🤪', '😝', '🤑', '🤗', '🤭', '🤫', '🤔', '🤐', '🤨', '😐', '😑', '😶', '😏', '😒', '🙄', '😬', '😌', '😔', '😪', '🤤', '😴', '😷', '🤒', '🤕', '🤢', '🤮', '🥵', '🥶', '🥴', '😵', '🤯', '🤠', '🥳', '😎', '🤓', '🧐', '😕', '😟', '🙁', '😮', '😯', '😲', '😳', '🥺', '😦', '😧', '😨', '😰', '😥', '😢', '😭', '😱', '😖', '😣', '😞', '😓', '😩', '😫', '🥱', '😤', '😡', '😠', '🤬', '😈', '💀', '💩', '🤡', '👻', '👽', '🤖']),
  (Icons.back_hand_outlined, ['👋', '🤚', '🖐', '✋', '🖖', '👌', '🤌', '🤏', '✌️', '🤞', '🤟', '🤘', '🤙', '👈', '👉', '👆', '👇', '☝️', '👍', '👎', '✊', '👊', '🤛', '🤜', '👏', '🙌', '👐', '🤲', '🤝', '🙏', '✍️', '💪', '🫶', '👀', '🧠', '🫡']),
  (Icons.favorite_outline_rounded, ['❤️', '🧡', '💛', '💚', '💙', '💜', '🖤', '🤍', '🤎', '💔', '❣️', '💕', '💞', '💓', '💗', '💖', '💘', '💝', '💟', '✨', '💫', '⭐', '🌟', '🔥', '💯', '✅', '❌', '⚠️', '❓', '❗', '💤', '💬', '🗯', '💭']),
  (Icons.pets_outlined, ['🐶', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻', '🐼', '🐨', '🐯', '🦁', '🐮', '🐷', '🐸', '🐵', '🐔', '🐧', '🐦', '🦄', '🐝', '🦋', '🐢', '🐍', '🐙', '🐬', '🐳', '🌸', '🌹', '🌻', '🌲', '🌵', '🍀', '🌈', '☀️', '🌙', '⛅', '❄️', '🌊']),
  (Icons.restaurant_outlined, ['🍎', '🍊', '🍋', '🍌', '🍉', '🍇', '🍓', '🍒', '🥭', '🍍', '🥑', '🍅', '🌶', '🥕', '🌽', '🍞', '🧀', '🍳', '🍔', '🍟', '🍕', '🌭', '🌮', '🍣', '🍜', '🍝', '🍰', '🎂', '🍩', '🍪', '🍫', '🍿', '☕', '🍵', '🥤', '🍺', '🍷', '🥂']),
  (Icons.sports_soccer_outlined, ['⚽', '🏀', '🏈', '⚾', '🎾', '🏐', '🎱', '🏓', '🥊', '🎯', '🎮', '🎲', '🧩', '🎨', '🎬', '🎤', '🎧', '🎸', '🎹', '🥁', '🏆', '🥇', '🎉', '🎊', '🎁', '🎈', '✈️', '🚗', '🚀', '🏠', '🏖', '⛰', '🗽', '🕌', '⛪']),
  (Icons.lightbulb_outline_rounded, ['📱', '💻', '⌚', '📷', '🎥', '📺', '📞', '🔋', '💡', '🔦', '📚', '📖', '✏️', '📝', '📌', '📎', '✂️', '🔒', '🔑', '🔨', '💰', '💳', '📈', '📉', '📅', '⏰', '⏳', '🧭', '🎓', '💼', '🛒', '🧾', '📦', '✉️', '📣', '🔔']),
];

/// Telegram's Emoji / GIFs / Stickers panel. Emoji go into the text box;
/// GIFs and stickers are sent straight away through [onSendGif] and
/// [onSendSticker].
class ExpressionPanel extends ConsumerStatefulWidget {
  const ExpressionPanel({
    super.key,
    required this.onEmoji,
    required this.onSendGif,
    required this.onSendSticker,
    this.height = 340,
  });

  final ValueChanged<String> onEmoji;
  final Future<void> Function(GifItem) onSendGif;
  final Future<void> Function(td.Sticker) onSendSticker;
  final double height;

  @override
  ConsumerState<ExpressionPanel> createState() => _ExpressionPanelState();
}

class _ExpressionPanelState extends ConsumerState<ExpressionPanel> {
  _Pane _pane = _Pane.emoji;
  int _emojiCategory = 0;
  final _search = TextEditingController();
  Timer? _debounce;

  List<GifItem>? _gifs;
  String _gifQuery = '';

  List<td.StickerSetInfo> _sets = const [];
  int? _setId; // null: favourites + recent
  List<td.Sticker>? _stickers;
  List<td.Sticker> _favorites = const [];
  List<td.Sticker> _recent = const [];

  TelegramToolRunner get _runner => ref.read(toolRunnerProvider);

  @override
  void dispose() {
    _search.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _show(_Pane p) {
    setState(() {
      _pane = p;
      _search.clear();
    });
    if (p == _Pane.gifs && _gifs == null) _loadGifs('');
    if (p == _Pane.stickers && _stickers == null) _loadStickerHome();
  }

  Future<void> _loadGifs(String q) async {
    setState(() {
      _gifQuery = q;
      _gifs = null;
    });
    try {
      final list = q.isEmpty ? await _runner.savedGifs() : await _runner.searchGifs(q);
      if (mounted && _gifQuery == q) setState(() => _gifs = list);
    } catch (e) {
      if (mounted) setState(() => _gifs = const []);
    }
  }

  Future<void> _loadStickerHome() async {
    try {
      final (sets, fav, recent) = await (_runner.stickerSets(), _runner.favoriteStickers(), _runner.recentStickers()).wait;
      if (!mounted) return;
      setState(() {
        _sets = sets;
        _favorites = fav;
        _recent = recent;
        _setId = null;
        _stickers = [...fav, ...recent.where((r) => fav.every((f) => f.sticker.id != r.sticker.id))];
      });
    } catch (_) {
      if (mounted) setState(() => _stickers = const []);
    }
  }

  Future<void> _openSet(int id) async {
    setState(() {
      _setId = id;
      _stickers = null;
    });
    final list = await _runner.stickerSetStickers(id).catchError((_) => <td.Sticker>[]);
    if (mounted && _setId == id) setState(() => _stickers = list);
  }

  void _onSearch(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      if (_pane == _Pane.gifs) {
        await _loadGifs(q.trim());
      } else if (_pane == _Pane.stickers) {
        if (q.trim().isEmpty) {
          await _loadStickerHome();
          return;
        }
        setState(() => _stickers = null);
        final list = await _runner.findStickers(q).catchError((_) => <td.Sticker>[]);
        if (mounted) setState(() => _stickers = list);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.xl)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              if (_pane == _Pane.stickers && _sets.isNotEmpty) _setRow(),
              if (_pane != _Pane.emoji) _searchBar(),
              Expanded(
                child: switch (_pane) {
                  _Pane.emoji => _emojiGrid(),
                  _Pane.gifs => _gifGrid(),
                  _Pane.stickers => _stickerGrid(),
                },
              ),
            ],
          ),
          Positioned(
            bottom: Space.s,
            left: 0,
            right: 0,
            child: Center(
              child: Glass(
                opacity: 0.9,
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final (p, label) in const [(_Pane.emoji, 'Emoji'), (_Pane.gifs, 'GIFs'), (_Pane.stickers, 'Stickers')])
                      InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => _show(p),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _pane == p ? AppColors.surface3 : Colors.transparent,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: _pane == p ? AppColors.text : AppColors.text2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() => Padding(
    padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.m, Space.xs),
    child: Container(
      height: 42,
      decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(999)),
      child: Row(
        children: [
          const SizedBox(width: Space.m),
          const Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
          const SizedBox(width: Space.s),
          SizedBox(
            width: 110,
            child: TextField(
              controller: _search,
              onChanged: _onSearch,
              decoration: const InputDecoration(
                hintText: 'Search',
                isDense: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final e in _quickMoods)
                  InkWell(
                    onTap: () {
                      _search.text = e;
                      _onSearch(e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Center(child: Text(e, style: const TextStyle(fontSize: 20))),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _setRow() => SizedBox(
    height: 52,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(Space.s, Space.s, Space.s, 0),
      children: [
        _SetButton(
          selected: _setId == null,
          onTap: _loadStickerHome,
          child: const Icon(Icons.star_outline_rounded, color: AppColors.text2),
        ),
        for (final s in _sets)
          _SetButton(
            selected: _setId == s.id,
            onTap: () => _openSet(s.id),
            child: s.covers.isNotEmpty
                ? StickerImage(sticker: s.covers.first, size: 34)
                : Text(s.title.characters.first, style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
      ],
    ),
  );

  Widget _emojiGrid() {
    final (_, emojis) = _emojiCategories[_emojiCategory];
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final (i, (icon, _)) in _emojiCategories.indexed)
                IconButton(
                  icon: Icon(icon, size: 21, color: i == _emojiCategory ? AppColors.accent : AppColors.text3),
                  onPressed: () => setState(() => _emojiCategory = i),
                ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(Space.s, 0, Space.s, 64),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 46),
            itemCount: emojis.length,
            itemBuilder: (_, i) => InkWell(
              borderRadius: BorderRadius.circular(Radii.s),
              onTap: () => widget.onEmoji(emojis[i]),
              child: Center(child: Text(emojis[i], style: const TextStyle(fontSize: 27))),
            ),
          ),
        ),
      ],
    );
  }

  Widget _gifGrid() {
    final gifs = _gifs;
    if (gifs == null) return const Center(child: SizedBox.square(dimension: 22, child: CircularProgressIndicator(strokeWidth: 2)));
    if (gifs.isEmpty) {
      return Center(
        child: Text(_gifQuery.isEmpty ? 'No saved GIFs yet. Search above.' : 'No GIFs for "$_gifQuery"', style: context.text.bodySmall),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 64),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 1.3),
      itemCount: gifs.length,
      itemBuilder: (_, i) => ClipRRect(
        borderRadius: BorderRadius.circular(Radii.s),
        child: InkWell(
          onTap: () => widget.onSendGif(gifs[i]),
          onLongPress: () async {
            await _runner.saveGif(gifs[i].animation).catchError((_) {});
            if (mounted) showSnack(context, 'Saved to your GIFs', icon: Icons.gif_box_outlined);
          },
          child: GifThumb(animation: gifs[i].animation),
        ),
      ),
    );
  }

  Widget _stickerGrid() {
    final stickers = _stickers;
    if (stickers == null) return const Center(child: SizedBox.square(dimension: 22, child: CircularProgressIndicator(strokeWidth: 2)));
    if (stickers.isEmpty) return Center(child: Text('No stickers here', style: context.text.bodySmall));
    final favIds = {for (final f in _favorites) f.sticker.id};
    final home = _setId == null && _search.text.isEmpty;
    return CustomScrollView(
      slivers: [
        if (home && _favorites.isNotEmpty) _label('Favorites'),
        if (home && _favorites.isNotEmpty) _stickerSliver(_favorites, favIds),
        if (home && _recent.isNotEmpty) _label('Recently used'),
        if (home)
          _stickerSliver(_recent.where((r) => !favIds.contains(r.sticker.id)).toList(), favIds)
        else
          _stickerSliver(stickers, favIds),
        const SliverToBoxAdapter(child: SizedBox(height: 64)),
      ],
    );
  }

  Widget _label(String t) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.xs),
      child: Text(t, style: context.text.titleSmall?.copyWith(color: AppColors.text2)),
    ),
  );

  Widget _stickerSliver(List<td.Sticker> list, Set<int> favIds) => SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: Space.s),
    sliver: SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 84),
      itemCount: list.length,
      itemBuilder: (_, i) => InkWell(
        borderRadius: BorderRadius.circular(Radii.m),
        onTap: () => widget.onSendSticker(list[i]),
        onLongPress: () async {
          final fav = !favIds.contains(list[i].sticker.id);
          await _runner.setFavoriteSticker(list[i].sticker.id, fav).catchError((_) {});
          if (mounted) showSnack(context, fav ? 'Added to favourites' : 'Removed from favourites', icon: Icons.star_rounded);
          await _loadStickerHome();
        },
        child: Padding(padding: const EdgeInsets.all(4), child: StickerImage(sticker: list[i])),
      ),
    ),
  );
}

class _SetButton extends StatelessWidget {
  const _SetButton({required this.selected, required this.onTap, required this.child});
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 4),
    child: InkWell(
      borderRadius: BorderRadius.circular(Radii.m),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.surface3 : Colors.transparent,
          borderRadius: BorderRadius.circular(Radii.m),
        ),
        child: child,
      ),
    ),
  );
}
