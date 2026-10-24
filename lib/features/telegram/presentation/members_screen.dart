import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/telegram_store.dart';
import '../data/telegram_tools.dart';
import 'chat_actions.dart';
import 'chat_profile_screen.dart';
import 'tg_avatar.dart';

enum _MemberFilter {
  recent('Recent'),
  admins('Admins'),
  bots('Bots'),
  restricted('Restricted'),
  banned('Banned');

  const _MemberFilter(this.label);
  final String label;
}

/// A group's members or a channel's subscribers (Telegram shows a channel's
/// list only to its admins), with search, role filters and, for admins,
/// removing and banning.
class MembersScreen extends ConsumerStatefulWidget {
  const MembersScreen({super.key, required this.chatId, this.initialFilter = 'recent'});
  final int chatId;

  /// recent, admins, bots, restricted or banned.
  final String initialFilter;

  @override
  ConsumerState<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends ConsumerState<MembersScreen> {
  final List<td.ChatMember> _members = [];
  int _total = 0;
  bool _loading = false;
  bool _end = false;
  String? _error;
  String _q = '';
  Timer? _debounce;
  late _MemberFilter _filter = _MemberFilter.values.asNameMap()[widget.initialFilter] ?? _MemberFilter.recent;
  final _scroll = ScrollController();

  td.ChatPermissions? _defaults;
  bool _showDefaults = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 400) _load();
    });
    _load();
    ref.read(toolRunnerProvider).chatPermissions(widget.chatId).then((p) {
      if (mounted) setState(() => _defaults = p);
    }, onError: (_) {});
  }

  @override
  void dispose() {
    _scroll.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _reset() {
    _members.clear();
    _end = false;
    _error = null;
    _load();
  }

  Future<void> _load() async {
    if (_loading || _end) return;
    final store = ref.read(telegramStoreProvider);
    final chat = store.chat(widget.chatId);
    if (chat == null) return;
    setState(() => _loading = true);
    final client = ref.read(telegramClientProvider);
    try {
      switch (chat.type) {
        case td.ChatTypeSupergroup(:final supergroupId):
          final q = _q.trim();
          final td.SupergroupMembersFilter filter = switch (_filter) {
            _MemberFilter.recent => q.isEmpty ? const td.SupergroupMembersFilterRecent() : td.SupergroupMembersFilterSearch(query: q),
            _MemberFilter.admins => const td.SupergroupMembersFilterAdministrators(),
            _MemberFilter.bots => const td.SupergroupMembersFilterBots(),
            _MemberFilter.restricted => td.SupergroupMembersFilterRestricted(query: q),
            _MemberFilter.banned => td.SupergroupMembersFilterBanned(query: q),
          };
          final r = await client.send<td.ChatMembers>(
            td.GetSupergroupMembers(supergroupId: supergroupId, filter: filter, offset: _members.length, limit: 100),
            limited: true,
          );
          _total = r.totalCount;
          _members.addAll(r.members.where((m) => _members.every((x) => !_same(x.memberId, m.memberId))));
          _end = r.members.isEmpty || _members.length >= r.totalCount;
        case td.ChatTypeBasicGroup(:final basicGroupId):
          final info = await client.send<td.BasicGroupFullInfo>(
            td.GetBasicGroupFullInfo(basicGroupId: basicGroupId),
            limited: true,
          );
          final q = _q.trim().toLowerCase();
          _members
            ..clear()
            ..addAll(
              info.members.where((m) {
                final ok = switch (_filter) {
                  _MemberFilter.admins =>
                    m.status is td.ChatMemberStatusAdministrator || m.status is td.ChatMemberStatusCreator,
                  _MemberFilter.bots => store.users[_userId(m.memberId)]?.type is td.UserTypeBot,
                  _MemberFilter.recent => true,
                  _ => false,
                };
                return ok && (q.isEmpty || store.senderName(m.memberId).toLowerCase().contains(q));
              }),
            );
          _total = info.members.length;
          _end = true;
        default:
          _end = true;
      }
    } catch (e) {
      _error = '$e';
      _end = true;
    }
    if (mounted) setState(() => _loading = false);
  }

  static int _userId(td.MessageSender s) => switch (s) {
    td.MessageSenderUser(:final userId) => userId,
    _ => 0,
  };

  static bool _same(td.MessageSender a, td.MessageSender b) => switch ((a, b)) {
    (td.MessageSenderUser(userId: final x), td.MessageSenderUser(userId: final y)) => x == y,
    (td.MessageSenderChat(chatId: final x), td.MessageSenderChat(chatId: final y)) => x == y,
    _ => false,
  };

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final chat = store.chat(widget.chatId);
    final channel = chat != null && store.kindOf(chat) == ChatKind.channel;
    final admin = chat != null && store.isAdmin(chat);
    final filters = [
      _MemberFilter.recent,
      _MemberFilter.admins,
      _MemberFilter.bots,
      if (admin && chat.type is td.ChatTypeSupergroup) ...[_MemberFilter.restricted, _MemberFilter.banned],
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${channel ? 'Subscribers' : 'Members'}${_total > 0 ? ' · ${NumberFormat.compact().format(_total)}' : ''}',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
            child: TextField(
              onChanged: (v) {
                _q = v;
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 450), () {
                  if (mounted) setState(_reset);
                });
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search ${channel ? 'subscribers' : 'members'}',
                prefixIcon: const Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          if (_defaults case final d? when !channel)
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
              child: Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.m),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Radii.m),
                  onTap: () => setState(() => _showDefaults = !_showDefaults),
                  child: Padding(
                    padding: const EdgeInsets.all(Space.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.tune_rounded, size: 18, color: AppColors.text2),
                            const SizedBox(width: Space.s),
                            Expanded(
                              child: Text(
                                'What members can do · ${permissionsOf(d).values.where((v) => v).length}/${permissionsOf(d).length}',
                                style: context.text.titleSmall,
                              ),
                            ),
                            Icon(_showDefaults ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppColors.text3),
                          ],
                        ),
                        if (_showDefaults) ...[
                          const SizedBox(height: Space.s),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              for (final e in permissionsOf(d).entries)
                                Text(
                                  '${e.value ? '✓' : '✕'} ${e.key.replaceAll('_', ' ')}',
                                  style: TextStyle(fontSize: 12, color: e.value ? AppColors.success : AppColors.danger),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: Space.l),
              children: [
                for (final f in filters)
                  Padding(
                    padding: const EdgeInsets.only(right: Space.s),
                    child: ChoiceChip(
                      label: Text(f.label),
                      selected: _filter == f,
                      onSelected: (_) => setState(() {
                        _filter = f;
                        _reset();
                      }),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: _members.isEmpty
                ? Center(
                    child: _loading
                        ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : Padding(
                            padding: const EdgeInsets.all(Space.xl),
                            child: Text(
                              _error ??
                                  (channel && !admin
                                      ? 'Telegram only shows a channel\'s subscribers to its admins.'
                                      : 'Nobody here'),
                              textAlign: TextAlign.center,
                              style: context.text.bodySmall,
                            ),
                          ),
                  )
                : ListView.builder(
                    controller: _scroll,
                    itemCount: _members.length + (_end ? 0 : 1),
                    itemBuilder: (_, i) {
                      if (i == _members.length) {
                        return const Padding(
                          padding: EdgeInsets.all(Space.l),
                          child: Center(
                            child: SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2)),
                          ),
                        );
                      }
                      return _MemberTile(
                        member: _members[i],
                        chatId: widget.chatId,
                        canManage: admin,
                        onChanged: () => setState(_reset),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

String _role(td.ChatMemberStatus s) => switch (s) {
  td.ChatMemberStatusCreator() => 'Owner',
  td.ChatMemberStatusAdministrator() => 'Admin',
  td.ChatMemberStatusRestricted() => 'Restricted',
  td.ChatMemberStatusBanned() => 'Banned',
  td.ChatMemberStatusLeft() => 'Left',
  td.ChatMemberStatusMember() => '',
};

class _MemberTile extends ConsumerWidget {
  const _MemberTile({required this.member, required this.chatId, required this.canManage, required this.onChanged});
  final td.ChatMember member;
  final int chatId;
  final bool canManage;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(telegramStoreProvider);
    final m = member;
    final name = store.senderName(m.memberId);
    final userId = _MembersScreenState._userId(m.memberId);
    final user = store.users[userId];
    final role = [_role(m.status), if (m.tag.isNotEmpty) m.tag].where((e) => e.isNotEmpty).join(' · ');
    final status = switch (user?.status) {
      td.UserStatusOnline() => 'online',
      td.UserStatusRecently() => 'last seen recently',
      td.UserStatusOffline(:final wasOnline) =>
        'last seen ${DateFormat('d MMM HH:mm').format(DateTime.fromMillisecondsSinceEpoch(wasOnline * 1000))}',
      td.UserStatusLastWeek() => 'last seen within a week',
      td.UserStatusLastMonth() => 'last seen within a month',
      _ => user?.type is td.UserTypeBot ? 'bot' : '',
    };
    return ListTile(
      leading: switch (m.memberId) {
        td.MessageSenderUser(:final userId) => TgAvatar(userId: userId, title: name, size: 42),
        td.MessageSenderChat(:final chatId) => TgAvatar(chatId: chatId, title: name, size: 42),
      },
      title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        [
          if (status.isNotEmpty) status,
          if (m.joinedChatDate > 0)
            'joined ${DateFormat('d MMM y').format(DateTime.fromMillisecondsSinceEpoch(m.joinedChatDate * 1000))}',
        ].join(' · '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12.5, color: status == 'online' ? AppColors.accent : AppColors.text3),
      ),
      trailing: role.isEmpty
          ? null
          : Text(
              m.status is td.ChatMemberStatusAdministrator
                  ? '$role · ${adminRightsOf((m.status as td.ChatMemberStatusAdministrator).rights).length} rights'
                  : role,
              style: TextStyle(
                fontSize: 12,
                color: m.status is td.ChatMemberStatusBanned ? AppColors.danger : AppColors.accent,
              ),
            ),
      onTap: () => _showMember(context, ref, userId, name, role),
    );
  }

  void _showMember(BuildContext context, WidgetRef ref, int userId, String name, String role) {
    final store = ref.read(telegramStoreProvider);
    final runner = ref.read(toolRunnerProvider);
    final m = member;
    final mine = userId == store.me?.id;
    final manageable = canManage && !mine && m.status is! td.ChatMemberStatusCreator && userId != 0;
    final inviter = m.inviterUserId == 0 ? null : store.userName(m.inviterUserId);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheet) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: TgAvatar(userId: userId == 0 ? null : userId, title: name, size: 44),
              title: Text(name, style: context.text.titleMedium),
              subtitle: Text(
                [
                  if (role.isNotEmpty) role,
                  if (store.users[userId] case final u? when store.username(u.usernames) != null)
                    '@${store.username(u.usernames)}',
                  if (m.joinedChatDate > 0)
                    'joined ${DateFormat('d MMM y, HH:mm').format(DateTime.fromMillisecondsSinceEpoch(m.joinedChatDate * 1000))}',
                  if (inviter != null) 'added by $inviter',
                  if (m.status case td.ChatMemberStatusBanned(:final bannedUntilDate) when bannedUntilDate > 0)
                    'banned until ${DateFormat('d MMM y').format(DateTime.fromMillisecondsSinceEpoch(bannedUntilDate * 1000))}',
                ].join(' · '),
                style: context.text.bodySmall,
              ),
            ),
            if (_rightsLines(m.status) case final lines when lines.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final (label, on) in lines)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: (on ? AppColors.success : AppColors.danger).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '${on ? '✓' : '✕'} $label',
                          style: TextStyle(fontSize: 11.5, color: on ? AppColors.success : AppColors.danger),
                        ),
                      ),
                  ],
                ),
              ),
            const Divider(),
            if (userId != 0)
              ListTile(
                leading: const Icon(Icons.person_outline_rounded),
                title: const Text('View profile'),
                onTap: () {
                  Navigator.pop(sheet);
                  Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ChatProfileScreen(chatId: userId)));
                },
              ),
            if (manageable && m.status is td.ChatMemberStatusBanned)
              ListTile(
                leading: const Icon(Icons.lock_open_rounded),
                title: const Text('Unban'),
                onTap: () async {
                  Navigator.pop(sheet);
                  await runner.unbanMember(chatId, userId);
                  onChanged();
                },
              ),
            if (manageable && m.status is! td.ChatMemberStatusBanned) ...[
              ListTile(
                leading: const Icon(Icons.person_remove_outlined, color: AppColors.danger),
                title: const Text('Remove', style: TextStyle(color: AppColors.danger)),
                subtitle: const Text('They can come back with a link'),
                onTap: () async {
                  Navigator.pop(sheet);
                  if (!await confirmAction(
                    context,
                    title: 'Remove $name?',
                    message: 'They are removed now and can rejoin later.',
                    action: 'Remove',
                  )) {
                    return;
                  }
                  try {
                    await runner.banMember(chatId, userId);
                    await runner.unbanMember(chatId, userId);
                    onChanged();
                  } catch (e) {
                    if (context.mounted) showSnack(context, 'Couldn\'t remove: $e', icon: Icons.error_outline_rounded);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.gavel_rounded, color: AppColors.danger),
                title: const Text('Ban', style: TextStyle(color: AppColors.danger)),
                onTap: () async {
                  Navigator.pop(sheet);
                  if (!await confirmAction(
                    context,
                    title: 'Ban $name?',
                    message: 'They are removed and can\'t rejoin until unbanned.',
                    action: 'Ban',
                  )) {
                    return;
                  }
                  try {
                    await runner.banMember(chatId, userId);
                    onChanged();
                  } catch (e) {
                    if (context.mounted) showSnack(context, 'Couldn\'t ban: $e', icon: Icons.error_outline_rounded);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// What a member's status lets them do (admins) or not do (restricted).
List<(String, bool)> _rightsLines(td.ChatMemberStatus s) => switch (s) {
  td.ChatMemberStatusCreator() => const [('All rights (owner)', true)],
  td.ChatMemberStatusAdministrator(:final rights) => [for (final r in adminRightsOf(rights)) (r, true)],
  td.ChatMemberStatusRestricted(:final permissions, :final restrictedUntilDate) => [
    for (final e in permissionsOf(permissions).entries) (e.key.replaceAll('_', ' '), e.value),
    if (restrictedUntilDate > 0)
      ('until ${DateFormat('d MMM y').format(DateTime.fromMillisecondsSinceEpoch(restrictedUntilDate * 1000))}', false),
  ],
  _ => const [],
};
