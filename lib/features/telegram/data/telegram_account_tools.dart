part of 'telegram_tools.dart';

// The account itself: where it is logged in, who may see and do what
// (privacy), the profile, and a health check of its security.

/// Privacy settings by the names the assistant and the Privacy screen use.
final privacySettings = <String, (String, td.UserPrivacySetting)>{
  'last_seen': ('Last seen & online', const td.UserPrivacySettingShowStatus()),
  'profile_photo': ('Profile photo', const td.UserPrivacySettingShowProfilePhoto()),
  'phone_number': ('Phone number', const td.UserPrivacySettingShowPhoneNumber()),
  'bio': ('Bio', const td.UserPrivacySettingShowBio()),
  'birthdate': ('Date of birth', const td.UserPrivacySettingShowBirthdate()),
  'invites': ('Who can add me to groups', const td.UserPrivacySettingAllowChatInvites()),
  'calls': ('Who can call me', const td.UserPrivacySettingAllowCalls()),
  'p2p_calls': ('Peer-to-peer calls', const td.UserPrivacySettingAllowPeerToPeerCalls()),
};

const _audiences = ['everybody', 'contacts', 'nobody'];

final _accountTools = <TelegramTool>[
  TelegramTool(
    name: 'list_sessions',
    label: 'Checking logged-in devices',
    category: ToolCategory.account,
    description:
        'Every device and app logged in to the account: app and version, whether it is an official Telegram app, '
        'device, system, IP and location, when it logged in and was last active, which one is this phone, and the '
        'auto-logout period for inactive devices.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'end_session',
    label: 'Logging a device out',
    category: ToolCategory.account,
    requiresApproval: true,
    destructive: true,
    description:
        'Logs one device out of the account (session_id from list_sessions), or every device except this phone '
        '(all_others). Use when the user doesn\'t recognise a device. Always asks first.',
    parameters: _obj({
      'session_id': {'type': 'string'},
      'all_others': {'type': 'boolean'},
    }),
  ),
  TelegramTool(
    name: 'set_session_options',
    label: 'Changing device settings',
    category: ToolCategory.account,
    requiresApproval: true,
    description: 'Sets after how many days of inactivity devices are logged out (7, 30, 90, 180 or 365), and/or whether one device (session_id) may take calls. Needs approval.',
    parameters: _obj({
      'inactive_days': {'type': 'integer'},
      'session_id': {'type': 'string'},
      'can_accept_calls': {'type': 'boolean'},
    }),
  ),
  TelegramTool(
    name: 'get_privacy',
    label: 'Checking privacy',
    category: ToolCategory.account,
    description:
        'The account\'s privacy settings: who sees last seen, profile photo, phone number, bio and birthday; who may add '
        'the user to groups and call them; whether read times are shown; whether strangers may start chats. Each with '
        'the people added as exceptions.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'set_privacy',
    label: 'Changing privacy',
    category: ToolCategory.account,
    requiresApproval: true,
    description:
        'Changes one privacy setting: setting is last_seen, profile_photo, phone_number, bio, birthdate, invites, '
        'calls, p2p_calls, read_dates (show_read_dates) or new_chats (allow strangers). audience: everybody, contacts '
        'or nobody; always_user_ids and never_user_ids are exceptions. Needs approval.',
    parameters: _obj({
      'setting': {'type': 'string', 'enum': [...privacySettings.keys, 'read_dates', 'new_chats']},
      'audience': {'type': 'string', 'enum': _audiences},
      'always_user_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'never_user_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'enabled': {'type': 'boolean', 'description': 'For read_dates and new_chats.'},
    }, ['setting']),
  ),
  TelegramTool(
    name: 'get_profile',
    label: 'Reading your profile',
    category: ToolCategory.account,
    description: 'The user\'s own profile: name, username, bio, birthday, phone, Premium, and their personal channel.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'edit_profile',
    label: 'Editing your profile',
    category: ToolCategory.account,
    requiresApproval: true,
    description:
        'Changes the user\'s profile: first_name/last_name, bio (70 characters, more with Premium), username (empty '
        'removes it), birthday ("YYYY-MM-DD" or "MM-DD"; "" removes it), a new profile photo from files, or the '
        'personal channel shown on the profile (personal_channel_id; 0 removes). Only given fields change. Needs approval.',
    parameters: _obj({
      'first_name': {'type': 'string'},
      'last_name': {'type': 'string'},
      'bio': {'type': 'string'},
      'username': {'type': 'string'},
      'birthday': {'type': 'string'},
      'files': {'type': 'array', 'items': {'type': 'string'}, 'description': 'One picture for the profile photo.'},
      'personal_channel_id': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'account_health',
    label: 'Checking account security',
    category: ToolCategory.account,
    description:
        'A security check-up of the account: two-step verification and its recovery email, devices logged in (unknown, '
        'unofficial or long-idle ones), who can see the phone number and who can add the user to groups, and the '
        'account\'s self-destruct period, with a score and what to fix.',
    parameters: _obj({}),
  ),
];

extension AccountTools on TelegramToolRunner {
  Future<ToolOutput>? _runAccount(String name, Map<String, dynamic> args) => switch (name) {
    'list_sessions' => _sessions(),
    'end_session' => _endSession(args),
    'set_session_options' => _sessionOptions(args),
    'get_privacy' => _getPrivacy(),
    'set_privacy' => _setPrivacy(args),
    'get_profile' => _getProfile(),
    'edit_profile' => _editProfile(args),
    'account_health' => _health(),
    _ => null,
  };

  String? _describeAccount(String name, Map<String, dynamic> args) => switch (name) {
    'end_session' => args['all_others'] == true
        ? 'Log out EVERY other device and app, keeping only this phone'
        : 'Log out ${_sessionLabels[int.tryParse('${args['session_id']}')] ?? 'device ${args['session_id']}'}',
    'set_session_options' => [
      if (args['inactive_days'] != null) 'Log out devices after ${args['inactive_days']} days of inactivity',
      if (args['can_accept_calls'] != null) '${args['can_accept_calls'] == true ? 'Allow' : 'Stop'} calls on ${_sessionLabels[int.tryParse('${args['session_id']}')] ?? 'device ${args['session_id']}'}',
    ].join('\n'),
    'set_privacy' => 'Privacy: ${privacySettings[args['setting']]?.$1 ?? args['setting']} → '
        '${args['enabled'] ?? args['audience'] ?? '?'}'
        '${(args['always_user_ids'] as List?)?.isNotEmpty == true ? ', always: ${[for (final u in args['always_user_ids'] as List) _store.userName((u as num).toInt())].join(', ')}' : ''}'
        '${(args['never_user_ids'] as List?)?.isNotEmpty == true ? ', never: ${[for (final u in args['never_user_ids'] as List) _store.userName((u as num).toInt())].join(', ')}' : ''}',
    'edit_profile' => 'Change your profile: ${[
      for (final e in args.entries)
        if (e.key == 'files') 'new photo' else if (e.key == 'personal_channel_id') 'personal channel → ${_store.chat((e.value as num).toInt())?.title ?? e.value}' else '${e.key.replaceAll('_', ' ')} → “${e.value}”',
    ].join(', ')}',
    _ => null,
  };

  static final Map<int, String> _sessionLabels = {};

  String _sessionLabel(td.Session s) =>
      '${s.applicationName} ${s.applicationVersion} on ${s.deviceModel.isEmpty ? s.platform : s.deviceModel}'.trim();

  Future<td.Sessions> activeSessions() async {
    final r = await _client.send<td.Sessions>(const td.GetActiveSessions(), limited: true);
    for (final s in r.sessions) {
      _sessionLabels[s.id] = _sessionLabel(s);
    }
    return r;
  }

  Map<String, dynamic> _sessionJson(td.Session s) => {
    'session_id': '${s.id}',
    'app': '${s.applicationName} ${s.applicationVersion}'.trim(),
    if (!s.isOfficialApplication) 'unofficial_app': true,
    'device': [s.deviceModel, s.platform, s.systemVersion].where((x) => x.isNotEmpty).join(' · '),
    if (s.isCurrent) 'this_phone': true,
    if (s.isPasswordPending) 'waiting_for_password': true,
    if (s.isUnconfirmed) 'unconfirmed_new_login': true,
    'ip': s.ipAddress,
    'location': s.location,
    'logged_in': TelegramToolRunner._iso(s.logInDate),
    'last_active': TelegramToolRunner._iso(s.lastActiveDate),
    'can_take_calls': s.canAcceptCalls,
  };

  Future<ToolOutput> _sessions() async {
    final r = await activeSessions();
    return ToolOutput({
      'count': r.sessions.length,
      'auto_logout_after_days': r.inactiveSessionTtlDays,
      'sessions': [for (final s in r.sessions) _sessionJson(s)],
    });
  }

  /// Runs only after the person approved it (always asked).
  Future<void> endSession({int? sessionId, bool allOthers = false}) async {
    if (allOthers) {
      await _client.send<td.Ok>(const td.TerminateAllOtherSessions(), limited: true);
    } else {
      await _client.send<td.Ok>(td.TerminateSession(sessionId: sessionId!), limited: true);
    }
  }

  Future<ToolOutput> _endSession(Map<String, dynamic> args) async {
    if (args['all_others'] == true) {
      await endSession(allOthers: true);
      return const ToolOutput({'done': true, 'logged_out': 'every other device'});
    }
    final id = int.tryParse('${args['session_id'] ?? ''}');
    if (id == null) throw ArgumentError('session_id is required (from list_sessions), or all_others.');
    final current = (await activeSessions()).sessions.where((s) => s.id == id).firstOrNull;
    if (current == null) throw ArgumentError('No device with that session_id.');
    if (current.isCurrent) throw ArgumentError('That is this phone; it can\'t log itself out here.');
    await endSession(sessionId: id);
    return ToolOutput({'done': true, 'logged_out': _sessionLabel(current)});
  }

  Future<ToolOutput> _sessionOptions(Map<String, dynamic> args) async {
    final days = TelegramToolRunner._intOrNull(args, 'inactive_days');
    if (days != null) {
      final allowed = const [7, 30, 90, 180, 365];
      final pick = allowed.reduce((a, b) => (a - days).abs() <= (b - days).abs() ? a : b);
      await _client.send<td.Ok>(td.SetInactiveSessionTtl(inactiveSessionTtlDays: pick), limited: true);
    }
    if (args['can_accept_calls'] is bool) {
      final id = int.tryParse('${args['session_id'] ?? ''}');
      if (id == null) throw ArgumentError('session_id is required for can_accept_calls.');
      await _client.send<td.Ok>(td.ToggleSessionCanAcceptCalls(sessionId: id, canAcceptCalls: args['can_accept_calls'] as bool), limited: true);
    }
    return const ToolOutput({'done': true});
  }

  // ---- privacy ---------------------------------------------------------------

  /// A rule set in words: "contacts, except Abel; also Liya".
  ({String audience, List<int> always, List<int> never}) readRules(td.UserPrivacySettingRules r) {
    var audience = 'nobody';
    final always = <int>[], never = <int>[];
    for (final rule in r.rules) {
      switch (rule) {
        case td.UserPrivacySettingRuleAllowAll():
          if (audience == 'nobody') audience = 'everybody';
        case td.UserPrivacySettingRuleAllowContacts():
          if (audience == 'nobody') audience = 'contacts';
        case td.UserPrivacySettingRuleAllowUsers(:final userIds):
          always.addAll(userIds);
        case td.UserPrivacySettingRuleRestrictUsers(:final userIds):
          never.addAll(userIds);
        default:
          break;
      }
    }
    return (audience: audience, always: always, never: never);
  }

  td.UserPrivacySettingRules makeRules(String audience, {List<int> always = const [], List<int> never = const []}) =>
      td.UserPrivacySettingRules(
        rules: [
          if (always.isNotEmpty) td.UserPrivacySettingRuleAllowUsers(userIds: always),
          if (never.isNotEmpty) td.UserPrivacySettingRuleRestrictUsers(userIds: never),
          switch (audience) {
            'everybody' => const td.UserPrivacySettingRuleAllowAll(),
            'contacts' => const td.UserPrivacySettingRuleAllowContacts(),
            _ => const td.UserPrivacySettingRuleRestrictAll(),
          },
        ],
      );

  Future<td.UserPrivacySettingRules> privacyRules(td.UserPrivacySetting s) =>
      _client.send<td.UserPrivacySettingRules>(td.GetUserPrivacySettingRules(setting: s), limited: true);

  Future<void> setPrivacyRules(td.UserPrivacySetting s, td.UserPrivacySettingRules rules) =>
      _client.send<td.Ok>(td.SetUserPrivacySettingRules(setting: s, rules: rules), limited: true);

  Future<bool> showsReadDates() async =>
      (await _client.send<td.ReadDatePrivacySettings>(const td.GetReadDatePrivacySettings(), limited: true)).showReadDate;

  Future<bool> allowsNewChats() async =>
      (await _client.send<td.NewChatPrivacySettings>(const td.GetNewChatPrivacySettings(), limited: true)).allowNewChatsFromUnknownUsers;

  Future<ToolOutput> _getPrivacy() async {
    final out = <String, dynamic>{};
    for (final e in privacySettings.entries) {
      try {
        final r = readRules(await privacyRules(e.value.$2));
        out[e.key] = {
          'audience': r.audience,
          if (r.always.isNotEmpty) 'always': [for (final u in r.always) _store.userName(u)],
          if (r.never.isNotEmpty) 'never': [for (final u in r.never) _store.userName(u)],
        };
      } on TelegramException {
        // A setting this account can't have (e.g. needs Premium).
      }
    }
    try {
      out['show_read_dates'] = await showsReadDates();
      out['strangers_can_message'] = await allowsNewChats();
    } on TelegramException {
      // Older servers.
    }
    return ToolOutput(out);
  }

  Future<ToolOutput> _setPrivacy(Map<String, dynamic> args) async {
    final key = '${args['setting'] ?? ''}';
    if (key == 'read_dates' || key == 'new_chats') {
      final on = args['enabled'] is bool ? args['enabled'] as bool : args['audience'] != 'nobody';
      if (key == 'read_dates') {
        await _client.send<td.Ok>(td.SetReadDatePrivacySettings(settings: td.ReadDatePrivacySettings(showReadDate: on)), limited: true);
      } else {
        // Keep the Stars price strangers pay to message: only the switch changes.
        final current = await _client.send<td.NewChatPrivacySettings>(const td.GetNewChatPrivacySettings(), limited: true);
        await _client.send<td.Ok>(
          td.SetNewChatPrivacySettings(
            settings: td.NewChatPrivacySettings(
              allowNewChatsFromUnknownUsers: on,
              incomingPaidMessageStarCount: current.incomingPaidMessageStarCount,
            ),
          ),
          limited: true,
        );
      }
      return ToolOutput({'done': true, key: on});
    }
    final setting = privacySettings[key];
    if (setting == null) throw ArgumentError('Unknown setting "$key".');
    final current = readRules(await privacyRules(setting.$2));
    final audience = '${args['audience'] ?? current.audience}';
    if (!_audiences.contains(audience)) throw ArgumentError('audience is everybody, contacts or nobody.');
    final always = args['always_user_ids'] != null ? _argIds(args, 'always_user_ids') : current.always;
    final never = args['never_user_ids'] != null ? _argIds(args, 'never_user_ids') : current.never;
    await setPrivacyRules(setting.$2, makeRules(audience, always: always, never: never));
    return ToolOutput({'done': true, 'setting': setting.$1, 'audience': audience});
  }

  // ---- profile ---------------------------------------------------------------

  Future<ToolOutput> _getProfile() async {
    final me = _store.me;
    if (me == null) throw ArgumentError('The account isn\'t loaded yet.');
    final full = await _client.send<td.UserFullInfo>(td.GetUserFullInfo(userId: me.id), limited: true);
    final b = full.birthdate;
    return ToolOutput({
      'user_id': me.id,
      'first_name': me.firstName,
      'last_name': me.lastName,
      if (_store.username(me.usernames) case final u?) 'username': '@$u',
      if (me.phoneNumber.isNotEmpty) 'phone': '+${me.phoneNumber}',
      'bio': full.bio?.text ?? '',
      if (b != null) 'birthday': '${b.year > 0 ? '${b.year}-' : ''}${'${b.month}'.padLeft(2, '0')}-${'${b.day}'.padLeft(2, '0')}',
      'premium': me.isPremium,
      if (full.personalChatId != 0) 'personal_channel': _store.chat(full.personalChatId)?.title ?? '${full.personalChatId}',
      'has_photo': me.profilePhoto != null,
    });
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _editProfile(Map<String, dynamic> args) async {
    final me = _store.me;
    if (me == null) throw ArgumentError('The account isn\'t loaded yet.');
    final changed = <String>[];
    if (args['first_name'] != null || args['last_name'] != null) {
      final first = '${args['first_name'] ?? me.firstName}'.trim();
      if (first.isEmpty) throw ArgumentError('A first name is required.');
      await _client.send<td.Ok>(td.SetName(firstName: first, lastName: '${args['last_name'] ?? me.lastName}'.trim()), limited: true);
      changed.add('name');
    }
    if (args['bio'] != null) {
      await _client.send<td.Ok>(td.SetBio(bio: '${args['bio']}'), limited: true);
      changed.add('bio');
    }
    if (args['username'] != null) {
      await _client.send<td.Ok>(td.SetUsername(username: '${args['username']}'.replaceFirst('@', '').trim()), limited: true);
      changed.add('username');
    }
    if (args['birthday'] != null) {
      final s = '${args['birthday']}'.trim();
      td.Birthdate? b;
      if (s.isNotEmpty) {
        final p = s.split('-').map(int.tryParse).toList();
        if (p.any((x) => x == null) || (p.length != 2 && p.length != 3)) throw ArgumentError('birthday is "YYYY-MM-DD" or "MM-DD".');
        b = p.length == 3 ? td.Birthdate(year: p[0]!, month: p[1]!, day: p[2]!) : td.Birthdate(year: 0, month: p[0]!, day: p[1]!);
      }
      await _client.send<td.Ok>(td.SetBirthdate(birthdate: b), limited: true);
      changed.add('birthday');
    }
    final photo = [for (final f in (args['files'] as List? ?? const [])) if (File('$f').existsSync()) '$f'].firstOrNull;
    if (photo != null) {
      await _client.send<td.Ok>(
        td.SetProfilePhoto(photo: td.InputChatPhotoStatic(photo: td.InputFileLocal(path: photo)), isPublic: false),
        limited: true,
        timeout: const Duration(minutes: 2),
      );
      changed.add('photo');
    }
    if (args['personal_channel_id'] != null) {
      await _client.send<td.Ok>(td.SetPersonalChat(chatId: TelegramToolRunner._intOrNull(args, 'personal_channel_id') ?? 0), limited: true);
      changed.add('personal channel');
    }
    if (changed.isEmpty) throw ArgumentError('Nothing to change.');
    return ToolOutput({'done': true, 'changed': changed});
  }

  // ---- health ----------------------------------------------------------------

  /// The security check-up behind the tool and the Account screen.
  Future<Map<String, dynamic>> accountHealth() async {
    final issues = <String>[];
    final good = <String>[];
    var score = 100;
    final out = <String, dynamic>{};

    final pass = await _client.send<td.PasswordState>(const td.GetPasswordState(), limited: true);
    out['two_step_verification'] = pass.hasPassword;
    if (pass.hasPassword) {
      good.add('Two-step verification is on');
      out['recovery_email'] = pass.hasRecoveryEmailAddress;
      if (!pass.hasRecoveryEmailAddress) {
        score -= 10;
        issues.add('Add a recovery email to two-step verification, or a forgotten password locks you out');
      }
      if (pass.pendingResetDate > 0) {
        score -= 30;
        issues.add('Someone asked to reset your two-step password (${TelegramToolRunner._iso(pass.pendingResetDate)}): if it wasn\'t you, cancel it in Telegram\'s settings');
      }
    } else {
      score -= 35;
      issues.add('Turn on two-step verification (a password on top of the SMS code)');
    }

    final sessions = await activeSessions();
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final unofficial = sessions.sessions.where((s) => !s.isOfficialApplication && !s.isCurrent).toList();
    final idle = sessions.sessions.where((s) => !s.isCurrent && now - s.lastActiveDate > 90 * 86400).toList();
    final fresh = sessions.sessions.where((s) => s.isUnconfirmed || s.isPasswordPending).toList();
    out['devices'] = sessions.sessions.length;
    if (fresh.isNotEmpty) {
      score -= 25;
      issues.add('New logins waiting for confirmation: ${fresh.map(_sessionLabel).join('; ')}. If not you, log them out');
    }
    if (unofficial.isNotEmpty) {
      score -= 10;
      issues.add('${unofficial.length} device(s) use unofficial apps: ${unofficial.map(_sessionLabel).join('; ')}. Check you know them');
    }
    if (idle.isNotEmpty) {
      score -= 5;
      issues.add('${idle.length} device(s) idle for 3+ months; log out the ones you don\'t use');
    }
    if (sessions.inactiveSessionTtlDays > 180) {
      issues.add('Idle devices are logged out only after ${sessions.inactiveSessionTtlDays} days; a shorter period is safer');
    }

    for (final (key, label) in [('phone_number', 'phone number'), ('invites', 'adding you to groups')]) {
      try {
        final r = readRules(await privacyRules(privacySettings[key]!.$2));
        out['${key}_visible_to'] = r.audience;
        if (r.audience == 'everybody') {
          score -= 7;
          issues.add('Everybody can see your $label; contacts or nobody is safer');
        }
      } on TelegramException {
        // Skip what this account can't read.
      }
    }

    try {
      final ttl = await _client.send<td.AccountTtl>(const td.GetAccountTtl(), limited: true);
      out['self_destruct_after_days'] = ttl.days;
    } on TelegramException {
      // Optional.
    }
    out['score'] = score.clamp(0, 100);
    out['verdict'] = score >= 85 ? 'good' : (score >= 60 ? 'could be better' : 'needs attention');
    out['fix'] = issues;
    out['fine'] = good;
    return out;
  }

  Future<ToolOutput> _health() async => ToolOutput(await accountHealth());
}
