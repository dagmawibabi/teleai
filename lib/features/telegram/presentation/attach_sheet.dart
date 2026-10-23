import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../app/theme.dart';
import '../../../core/widgets/glass.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/file_loader.dart';
import '../data/telegram_store.dart';
import '../data/telegram_tools.dart';
import 'tg_avatar.dart';

/// What the attach sheet hands back.
sealed class AttachResult {
  const AttachResult();
}

class AttachFiles extends AttachResult {
  const AttachFiles(this.files);

  /// Local path and display name of each.
  final List<(String, String)> files;
}

class AttachLocation extends AttachResult {
  const AttachLocation(this.liveMinutes);
  final int liveMinutes;
}

class AttachPoll extends AttachResult {
  const AttachPoll(this.draft);
  final PollDraft draft;
}

class AttachContact extends AttachResult {
  const AttachContact(this.userId);
  final int userId;
}

enum _Tab {
  gallery('Gallery', Icons.photo_library_outlined),
  file('File', Icons.insert_drive_file_outlined),
  location('Location', Icons.location_on_outlined),
  poll('Poll', Icons.bar_chart_rounded),
  contact('Contact', Icons.person_outline_rounded);

  const _Tab(this.label, this.icon);
  final String label;
  final IconData icon;
}

/// Telegram's attach sheet: recent photos and videos with a camera tile,
/// and tabs for files, location, polls and contacts. [telegram] false
/// leaves only what the assistant can take (gallery and files).
Future<AttachResult?> showAttachSheet(BuildContext context, {bool telegram = true}) =>
    showModalBottomSheet<AttachResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: false,
      backgroundColor: AppColors.surface,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.62,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scroll) => _AttachSheet(telegram: telegram, scroll: scroll),
      ),
    );

class _AttachSheet extends ConsumerStatefulWidget {
  const _AttachSheet({required this.telegram, required this.scroll});
  final bool telegram;
  final ScrollController scroll;

  @override
  ConsumerState<_AttachSheet> createState() => _AttachSheetState();
}

class _AttachSheetState extends ConsumerState<_AttachSheet> {
  _Tab _tab = _Tab.gallery;

  List<_Tab> get _tabs => widget.telegram ? _Tab.values : const [_Tab.gallery, _Tab.file];

  Future<void> _pickFiles() async {
    final files = await FilePicker.pickFiles();
    final picked = [
      for (final f in files)
        if (f.path != null) (f.path!, f.name),
    ];
    if (picked.isNotEmpty && mounted) Navigator.pop(context, AttachFiles(picked));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: switch (_tab) {
            _Tab.gallery => _Gallery(scroll: widget.scroll),
            _Tab.file => _FileTab(scroll: widget.scroll, onPick: _pickFiles),
            _Tab.location => _LocationTab(scroll: widget.scroll),
            _Tab.poll => _PollTab(scroll: widget.scroll),
            _Tab.contact => _ContactTab(scroll: widget.scroll),
          },
        ),
        Positioned(
          left: Space.m,
          right: Space.m,
          bottom: Space.m,
          child: SafeArea(
            top: false,
            child: Glass(
              radius: Radii.xl + 6,
              opacity: 0.85,
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  for (final t in _tabs)
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(Radii.xl),
                        onTap: () {
                          setState(() => _tab = t);
                          if (t == _Tab.file) _pickFiles();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: _tab == t ? AppColors.accent.withValues(alpha: 0.18) : Colors.transparent,
                            borderRadius: BorderRadius.circular(Radii.xl),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(t.icon, size: 22, color: _tab == t ? AppColors.accent : AppColors.text2),
                              const SizedBox(height: 2),
                              Text(
                                t.label,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: _tab == t ? AppColors.accent : AppColors.text2,
                                ),
                              ),
                            ],
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
    );
  }
}

// ---- gallery -------------------------------------------------------------------

class _Gallery extends StatefulWidget {
  const _Gallery({required this.scroll});
  final ScrollController scroll;

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  List<AssetEntity>? _assets;
  bool _denied = false;
  bool _unavailable = false;
  final List<AssetEntity> _picked = [];
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final perm = await PhotoManager.requestPermissionExtend();
      if (!perm.hasAccess) {
        if (mounted) setState(() => _denied = true);
        return;
      }
      final paths = await PhotoManager.getAssetPathList(type: RequestType.common, onlyAll: true);
      final list = paths.isEmpty ? <AssetEntity>[] : await paths.first.getAssetListPaged(page: 0, size: 120);
      if (mounted) setState(() => _assets = list);
    } catch (e) {
      // The gallery plugin isn't in this build (it needs a full rebuild,
      // not a hot reload): fall back to the system picker.
      debugPrint('[Attach] gallery: $e');
      if (mounted) setState(() => _unavailable = true);
    }
  }

  Future<void> _systemPicker() async {
    final picked = await ImagePicker().pickMultipleMedia(imageQuality: 90);
    if (picked.isNotEmpty && mounted) Navigator.pop(context, AttachFiles([for (final x in picked) (x.path, x.name)]));
  }

  Future<void> _camera() async {
    final video = await showModalBottomSheet<bool>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take a photo'),
              onTap: () => Navigator.pop(ctx, false),
            ),
            ListTile(
              leading: const Icon(Icons.videocam_outlined),
              title: const Text('Record a video'),
              onTap: () => Navigator.pop(ctx, true),
            ),
          ],
        ),
      ),
    );
    if (video == null) return;
    final picker = ImagePicker();
    final x = video
        ? await picker.pickVideo(source: ImageSource.camera, maxDuration: const Duration(minutes: 10))
        : await picker.pickImage(source: ImageSource.camera, imageQuality: 90);
    if (x != null && mounted) Navigator.pop(context, AttachFiles([(x.path, x.name)]));
  }

  Future<void> _send() async {
    setState(() => _sending = true);
    final out = <(String, String)>[];
    for (final a in _picked) {
      final f = await a.originFile ?? await a.file;
      if (f != null) out.add((f.path, a.title ?? f.path.split(RegExp(r'[\\/]')).last));
    }
    if (mounted) Navigator.pop(context, AttachFiles(out));
  }

  @override
  Widget build(BuildContext context) {
    if (_unavailable) {
      return _Message(
        icon: Icons.photo_library_outlined,
        text: 'The in-app gallery needs a full app rebuild. Pick from the system gallery for now.',
        action: 'Open gallery',
        onAction: _systemPicker,
      );
    }
    if (_denied) {
      return _Message(
        icon: Icons.photo_library_outlined,
        text: 'Allow access to photos and videos to pick from your gallery.',
        action: 'Open settings',
        onAction: PhotoManager.openSetting,
      );
    }
    final assets = _assets;
    return Stack(
      children: [
        GridView.builder(
          controller: widget.scroll,
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 110),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: (assets?.length ?? 0) + 1,
          itemBuilder: (_, i) {
            if (i == 0) {
              return Material(
                color: AppColors.surface3,
                borderRadius: BorderRadius.circular(Radii.m),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Radii.m),
                  onTap: _camera,
                  child: const Center(child: Icon(Icons.photo_camera_rounded, size: 34, color: Colors.white)),
                ),
              );
            }
            final a = assets![i - 1];
            final n = _picked.indexOf(a);
            return GestureDetector(
              onTap: () => setState(() => n >= 0 ? _picked.remove(a) : _picked.add(a)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Radii.m),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _Thumb(asset: a),
                    if (n >= 0) Container(color: Colors.black26),
                    if (a.type == AssetType.video)
                      Positioned(
                        left: 6,
                        bottom: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(99)),
                          child: Text(formatDuration(a.duration), style: const TextStyle(fontSize: 11, color: Colors.white)),
                        ),
                      ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: n >= 0 ? AppColors.accent : Colors.black26,
                          border: Border.all(color: Colors.white, width: 1.6),
                        ),
                        child: n >= 0
                            ? Text('${n + 1}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white))
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (assets == null) const Center(child: SizedBox.square(dimension: 22, child: CircularProgressIndicator(strokeWidth: 2))),
        if (_picked.isNotEmpty)
          Positioned(
            right: Space.l,
            bottom: 96,
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.bg,
              onPressed: _sending ? null : _send,
              icon: _sending
                  ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.bg))
                  : const Icon(Icons.send_rounded),
              label: Text('Send ${_picked.length}'),
            ),
          ),
      ],
    );
  }
}

class _Thumb extends StatefulWidget {
  const _Thumb({required this.asset});
  final AssetEntity asset;

  @override
  State<_Thumb> createState() => _ThumbState();
}

class _ThumbState extends State<_Thumb> {
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    widget.asset.thumbnailDataWithSize(const ThumbnailSize.square(300)).then((b) {
      if (mounted) setState(() => _bytes = b);
    });
  }

  @override
  Widget build(BuildContext context) =>
      _bytes == null ? Container(color: AppColors.surface3) : Image.memory(_bytes!, fit: BoxFit.cover, gaplessPlayback: true);
}

// ---- other tabs ---------------------------------------------------------------

class _Message extends StatelessWidget {
  const _Message({required this.icon, required this.text, this.action, this.onAction});
  final IconData icon;
  final String text;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(Space.x4, Space.x4, Space.x4, 120),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 42, color: AppColors.text3),
          const SizedBox(height: Space.m),
          Text(text, textAlign: TextAlign.center, style: context.text.bodyMedium?.copyWith(color: AppColors.text2)),
          if (action != null) ...[
            const SizedBox(height: Space.m),
            FilledButton(onPressed: onAction, child: Text(action!)),
          ],
        ],
      ),
    ),
  );
}

class _FileTab extends StatelessWidget {
  const _FileTab({required this.scroll, required this.onPick});
  final ScrollController scroll;
  final VoidCallback onPick;

  @override
  Widget build(BuildContext context) => ListView(
    controller: scroll,
    children: [
      _Message(
        icon: Icons.folder_open_rounded,
        text: 'Send documents, music, archives: anything on this phone.',
        action: 'Choose files',
        onAction: onPick,
      ),
    ],
  );
}

class _LocationTab extends StatelessWidget {
  const _LocationTab({required this.scroll});
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) => ListView(
    controller: scroll,
    padding: const EdgeInsets.fromLTRB(Space.l, Space.l, Space.l, 120),
    children: [
      Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Radii.xl),
          gradient: const LinearGradient(colors: [Color(0xFF1E2A3A), Color(0xFF152030)]),
        ),
        child: Center(child: Icon(Icons.my_location_rounded, size: 46, color: AppColors.accent)),
      ),
      const SizedBox(height: Space.l),
      ListTile(
        leading: CircleAvatar(backgroundColor: AppColors.accent, child: Icon(Icons.place_rounded, color: AppColors.bg)),
        title: const Text('Send my current location'),
        subtitle: const Text('Once, where you are now'),
        onTap: () => Navigator.pop(context, const AttachLocation(0)),
      ),
      for (final (minutes, label) in const [(15, '15 minutes'), (60, '1 hour'), (480, '8 hours')])
        ListTile(
          leading: const CircleAvatar(backgroundColor: AppColors.surface3, child: Icon(Icons.share_location_rounded)),
          title: Text('Share live location for $label'),
          subtitle: const Text('Updates as you move while TeleAI runs'),
          onTap: () => Navigator.pop(context, AttachLocation(minutes)),
        ),
    ],
  );
}

class _PollTab extends StatefulWidget {
  const _PollTab({required this.scroll});
  final ScrollController scroll;

  @override
  State<_PollTab> createState() => _PollTabState();
}

class _PollTabState extends State<_PollTab> {
  final _question = TextEditingController();
  final List<TextEditingController> _options = [TextEditingController(), TextEditingController()];
  final _explanation = TextEditingController();
  bool _anonymous = true;
  bool _multiple = false;
  bool _quiz = false;
  int _correct = 0;
  int _openMinutes = 0;

  @override
  void dispose() {
    _question.dispose();
    _explanation.dispose();
    for (final c in _options) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    final options = [for (final c in _options) c.text.trim()]..removeWhere((o) => o.isEmpty);
    if (_question.text.trim().isEmpty || options.length < 2) {
      showSnack(context, 'Add a question and at least two options', icon: Icons.info_outline_rounded);
      return;
    }
    Navigator.pop(
      context,
      AttachPoll(
        PollDraft(
          question: _question.text.trim(),
          options: options,
          anonymous: _anonymous,
          multipleAnswers: _multiple && !_quiz,
          quiz: _quiz,
          correctOption: _correct.clamp(0, options.length - 1),
          explanation: _explanation.text.trim(),
          openSeconds: _openMinutes * 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scroll,
      padding: const EdgeInsets.fromLTRB(Space.l, Space.l, Space.l, 120),
      children: [
        Row(
          children: [
            Text(_quiz ? 'New quiz' : 'New poll', style: context.text.titleLarge),
            const Spacer(),
            FilledButton(onPressed: _submit, style: FilledButton.styleFrom(minimumSize: const Size(0, 40)), child: const Text('Send')),
          ],
        ),
        const SizedBox(height: Space.l),
        TextField(controller: _question, decoration: const InputDecoration(labelText: 'Question'), maxLength: 255),
        const SizedBox(height: Space.s),
        Text('OPTIONS', style: context.text.labelSmall),
        const SizedBox(height: Space.s),
        for (final (i, c) in _options.indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: Row(
              children: [
                if (_quiz)
                  IconButton(
                    tooltip: 'The right answer',
                    icon: Icon(
                      _correct == i ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                      color: _correct == i ? AppColors.success : AppColors.text3,
                    ),
                    onPressed: () => setState(() => _correct = i),
                  ),
                Expanded(
                  child: TextField(controller: c, decoration: InputDecoration(hintText: 'Option ${i + 1}', isDense: true)),
                ),
                if (_options.length > 2)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline_rounded, color: AppColors.text3),
                    onPressed: () => setState(() => _options.removeAt(i).dispose()),
                  ),
              ],
            ),
          ),
        if (_options.length < 10)
          TextButton.icon(
            onPressed: () => setState(() => _options.add(TextEditingController())),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add an option'),
          ),
        const Divider(height: Space.xl),
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Anonymous voting'), value: _anonymous, onChanged: (v) => setState(() => _anonymous = v)),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Multiple answers'),
          value: _multiple && !_quiz,
          onChanged: _quiz ? null : (v) => setState(() => _multiple = v),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Quiz mode'),
          subtitle: const Text('One right answer; pick it with the circle'),
          value: _quiz,
          onChanged: (v) => setState(() => _quiz = v),
        ),
        if (_quiz)
          TextField(
            controller: _explanation,
            decoration: const InputDecoration(labelText: 'Explanation (optional)', hintText: 'Shown after someone answers'),
          ),
        const SizedBox(height: Space.m),
        Text('CLOSE AUTOMATICALLY', style: context.text.labelSmall),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: 6,
          children: [
            for (final (m, label) in const [(0, 'Never'), (5, '5 min'), (60, '1 hour'), (600, '10 hours')])
              ChoiceChip(label: Text(label), selected: _openMinutes == m, onSelected: (_) => setState(() => _openMinutes = m)),
          ],
        ),
      ],
    );
  }
}

class _ContactTab extends ConsumerStatefulWidget {
  const _ContactTab({required this.scroll});
  final ScrollController scroll;

  @override
  ConsumerState<_ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends ConsumerState<_ContactTab> {
  List<int>? _ids;
  String _q = '';

  @override
  void initState() {
    super.initState();
    ref.read(telegramClientProvider).send<td.Users>(const td.GetContacts(), limited: true).then((u) {
      if (mounted) setState(() => _ids = u.userIds);
    }).ignore();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final me = store.me;
    final ids = [if (me != null) me.id, ...?_ids]
        .where((id) => _q.isEmpty || store.userName(id).toLowerCase().contains(_q))
        .toList();
    return ListView(
      controller: widget.scroll,
      padding: const EdgeInsets.fromLTRB(Space.s, Space.m, Space.s, 120),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.s),
          child: TextField(
            onChanged: (v) => setState(() => _q = v.toLowerCase().trim()),
            decoration: const InputDecoration(isDense: true, hintText: 'Search contacts', prefixIcon: Icon(Icons.search_rounded, size: 20)),
          ),
        ),
        const SizedBox(height: Space.s),
        if (_ids == null) const Padding(padding: EdgeInsets.all(Space.xl), child: Center(child: CircularProgressIndicator(strokeWidth: 2))),
        for (final id in ids)
          ListTile(
            leading: TgAvatar(userId: id, title: store.userName(id), size: 40),
            title: Text(id == me?.id ? 'My contact card' : store.userName(id)),
            subtitle: Text(
              [if (store.username(store.users[id]?.usernames) case final u?) '@$u', if ((store.users[id]?.phoneNumber ?? '').isNotEmpty) '+${store.users[id]!.phoneNumber}'].join(' · '),
              style: context.text.bodySmall,
            ),
            onTap: () => Navigator.pop(context, AttachContact(id)),
          ),
      ],
    );
  }
}
