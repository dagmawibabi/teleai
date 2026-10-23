part of 'telegram_tools.dart';

// Telegram Stars: the balance, where Stars went and came from, paid
// subscriptions, Stars earned by the user's channels and bots, and giving
// Stars to a post or message (the ⭐ reaction). Anything that spends Stars
// asks the user every time.

final _starTools = <TelegramTool>[
  TelegramTool(
    name: 'get_star_balance',
    label: 'Checking your Stars',
    category: ToolCategory.stars,
    description:
        'The user\'s Telegram Stars balance, plus how many Stars their active subscriptions need and the prices for '
        'buying more (buying happens in Telegram\'s official app).',
    parameters: _obj({
      'with_prices': {'type': 'boolean', 'description': 'Include the Star packs on sale. Default false.'},
    }),
  ),
  TelegramTool(
    name: 'list_star_transactions',
    label: 'Reading Star history',
    category: ToolCategory.stars,
    description:
        'The user\'s Star transactions, newest first: Stars bought, received from people, spent on reactions, paid '
        'media, subscriptions, bots and gifts, with who was on the other side.',
    parameters: _obj({
      'direction': {'type': 'string', 'enum': ['all', 'incoming', 'outgoing']},
      'limit': {'type': 'integer', 'description': 'Default 20, at most 100.'},
      'offset': {'type': 'string', 'description': 'next_offset from an earlier call, for older ones.'},
    }),
  ),
  TelegramTool(
    name: 'send_star_reaction',
    label: 'Sending Stars',
    category: ToolCategory.stars,
    requiresApproval: true,
    alwaysAsk: true,
    description:
        'Gives Stars to a post or message as a paid ⭐ reaction (from 1 to 2500 Stars); the Stars go to the channel or '
        'chat\'s owner and the user shows up among its top supporters unless anonymous. This is how to "star" a post or '
        'a person\'s content. Spends the user\'s Stars, so the user approves it every time.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'stars': {'type': 'integer', 'description': 'How many Stars, 1-2500.'},
      'anonymous': {'type': 'boolean', 'description': 'Hide the user from the top supporters list.'},
    }, ['chat_id', 'message_id', 'stars']),
  ),
  TelegramTool(
    name: 'get_star_reactors',
    label: 'Seeing who sent Stars',
    category: ToolCategory.stars,
    description: 'Who gave Stars to a post or message, the top supporters first, and how many in total.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),
  TelegramTool(
    name: 'list_star_subscriptions',
    label: 'Listing Star subscriptions',
    category: ToolCategory.stars,
    description: 'The channels and groups the user pays Stars for each month, with price, renewal date and status.',
    parameters: _obj({
      'only_expiring': {'type': 'boolean'},
    }),
  ),
  TelegramTool(
    name: 'set_star_subscription',
    label: 'Changing a Star subscription',
    category: ToolCategory.stars,
    requiresApproval: true,
    description: 'Cancels a Star subscription (it runs until the paid period ends) or turns a cancelled one back on. Needs approval.',
    parameters: _obj({
      'subscription_id': {'type': 'string'},
      'cancel': {'type': 'boolean', 'description': 'true cancels, false renews.'},
    }, ['subscription_id', 'cancel']),
  ),
  TelegramTool(
    name: 'get_star_revenue',
    label: 'Checking Star earnings',
    category: ToolCategory.stars,
    description:
        'Stars earned by one of the user\'s channels or bots (chat_id of the channel, or of the bot\'s chat): total, '
        'available to withdraw, and their value in USD.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
];

extension StarTools on TelegramToolRunner {
  Future<ToolOutput>? _runStars(String name, Map<String, dynamic> args) => switch (name) {
    'get_star_balance' => _starBalance(args),
    'list_star_transactions' => _starTransactions(args),
    'send_star_reaction' => _sendStars(args),
    'get_star_reactors' => _starReactors(args),
    'list_star_subscriptions' => _starSubscriptions(args),
    'set_star_subscription' => _setStarSubscription(args),
    'get_star_revenue' => _starRevenue(args),
    _ => null,
  };

  String? _describeStars(String name, Map<String, dynamic> args, String title) => switch (name) {
    'send_star_reaction' =>
      'Spend ${args['stars']} ⭐ Star${args['stars'] == 1 ? '' : 's'} on message ${args['message_id']} in $title'
          '${args['anonymous'] == true ? ', anonymously' : ''}',
    'set_star_subscription' => args['cancel'] == false
        ? 'Renew Star subscription ${args['subscription_id']}'
        : 'Cancel Star subscription ${args['subscription_id']}',
    _ => null,
  };

  td.MessageSender get _meSender {
    final me = _store.me;
    if (me == null) throw ArgumentError('The account isn\'t loaded yet.');
    return td.MessageSenderUser(userId: me.id);
  }

  Future<int> starBalance() async => (await _client.send<td.StarTransactions>(
    td.GetStarTransactions(ownerId: _meSender, subscriptionId: '', offset: '', limit: 1),
    limited: true,
  )).starCount;

  Future<ToolOutput> _starBalance(Map<String, dynamic> args) async {
    final balance = await starBalance();
    final out = <String, dynamic>{'stars': balance};
    try {
      final subs = await _client.send<td.StarSubscriptions>(
        const td.GetStarSubscriptions(onlyExpiring: false, offset: ''),
        limited: true,
      );
      out['active_subscriptions'] = subs.subscriptions.where((s) => !s.isCanceled).length;
      if (subs.requiredStarCount > 0) out['stars_needed_for_renewals'] = subs.requiredStarCount;
    } on TelegramException {
      // Subscriptions are optional detail.
    }
    if (args['with_prices'] == true) {
      final options = await _client.send<td.StarPaymentOptions>(const td.GetStarPaymentOptions(), limited: true);
      out['packs'] = [
        for (final o in options.options.where((o) => !o.isAdditional))
          {'stars': o.starCount, 'price': '${(o.amount / 100).toStringAsFixed(2)} ${o.currency}'},
      ];
      out['note'] = 'Stars are bought in Telegram\'s official app.';
    }
    return ToolOutput(out);
  }

  String _partner(td.StarTransactionPartner p) => switch (p) {
    td.StarTransactionPartnerTelegram() => 'Telegram',
    td.StarTransactionPartnerAppStore() => 'App Store purchase',
    td.StarTransactionPartnerGooglePlay() => 'Google Play purchase',
    td.StarTransactionPartnerFragment() => 'Fragment',
    td.StarTransactionPartnerTelegramAds() => 'Telegram Ads',
    td.StarTransactionPartnerBot(:final userId, :final purpose) => '${_store.userName(userId)} (bot, ${switch (purpose) {
      td.BotTransactionPurposePaidMedia() => 'paid media',
      td.BotTransactionPurposeInvoicePayment() => 'payment',
    }})',
    td.StarTransactionPartnerBusiness(:final userId) => '${_store.userName(userId)} (paid media)',
    td.StarTransactionPartnerChat(:final chatId, :final purpose) => '${_store.chat(chatId)?.title ?? 'chat $chatId'} (${switch (purpose) {
      td.ChatTransactionPurposePaidMedia() => 'paid media',
      td.ChatTransactionPurposeJoin() => 'subscription',
      td.ChatTransactionPurposeReaction() => 'star reaction',
      td.ChatTransactionPurposeGiveaway() => 'giveaway',
    }})',
    td.StarTransactionPartnerUser(:final userId, :final sticker) =>
      '${_store.userName(userId)}${sticker == null ? '' : ' (gift ${sticker.emoji})'}',
    td.StarTransactionPartnerUnsupported() => 'other',
  };

  Future<ToolOutput> _starTransactions(Map<String, dynamic> args) async {
    final r = await _client.send<td.StarTransactions>(
      td.GetStarTransactions(
        ownerId: _meSender,
        subscriptionId: '',
        direction: switch ('${args['direction'] ?? 'all'}') {
          'incoming' => const td.StarTransactionDirectionIncoming(),
          'outgoing' => const td.StarTransactionDirectionOutgoing(),
          _ => null,
        },
        offset: '${args['offset'] ?? ''}',
        limit: TelegramToolRunner._int(args, 'limit', fallback: 20, max: 100),
      ),
      limited: true,
    );
    return ToolOutput({
      'stars': r.starCount,
      'count': r.transactions.length,
      'transactions': [
        for (final t in r.transactions)
          {
            'date': TelegramToolRunner._iso(t.date),
            'stars': t.starCount,
            'with': _partner(t.partner),
            if (t.isRefund) 'refund': true,
          },
      ],
      if (r.nextOffset.isNotEmpty) 'next_offset': r.nextOffset,
    });
  }

  /// Gives [stars] to a message as a paid reaction. Runs only after the
  /// person approved it (always asked, whatever the settings).
  Future<void> sendStars(int chatId, int messageId, int stars, {bool? anonymous}) async {
    await _client.send<td.Ok>(
      td.AddPendingPaidMessageReaction(
        chatId: chatId,
        messageId: messageId,
        starCount: stars,
        useDefaultIsAnonymous: anonymous == null,
        isAnonymous: anonymous ?? false,
      ),
      limited: true,
    );
    // Telegram's apps wait a few seconds to batch taps; this is one tap.
    await _client.send<td.Ok>(td.CommitPendingPaidMessageReactions(chatId: chatId, messageId: messageId), limited: true);
  }

  Future<ToolOutput> _sendStars(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    final stars = TelegramToolRunner._int(args, 'stars', fallback: 1, max: 2500);
    final balance = await starBalance();
    if (balance < stars) {
      return ToolOutput({'error': 'Not enough Stars: the balance is $balance and this needs $stars. Stars are bought in Telegram\'s official app.'});
    }
    await sendStars(c.id, id, stars, anonymous: args['anonymous'] is bool ? args['anonymous'] as bool : null);
    return ToolOutput({'done': true, 'chat': c.title, 'stars_sent': stars, 'balance_left': balance - stars, 'ref': 'post:${c.id}:$id'});
  }

  Future<ToolOutput> _starReactors(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    final m = await _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
    final reactions = m.interactionInfo?.reactions;
    final total = reactions?.reactions.where((r) => r.type is td.ReactionTypePaid).fold<int>(0, (n, r) => n + r.totalCount) ?? 0;
    return ToolOutput({
      'ref': 'post:${c.id}:$id',
      'total_stars': total,
      'supporters': [
        for (final p in reactions?.paidReactors ?? const <td.PaidReactor>[])
          {
            'name': p.isMe ? 'You' : (p.isAnonymous || p.senderId == null ? 'Anonymous' : _store.senderName(p.senderId!)),
            'stars': p.starCount,
            if (p.isTop) 'top': true,
          },
      ],
    });
  }

  Future<ToolOutput> _starSubscriptions(Map<String, dynamic> args) async {
    final r = await _client.send<td.StarSubscriptions>(
      td.GetStarSubscriptions(onlyExpiring: args['only_expiring'] == true, offset: ''),
      limited: true,
    );
    return ToolOutput({
      'stars': r.starCount,
      if (r.requiredStarCount > 0) 'stars_needed_for_renewals': r.requiredStarCount,
      'subscriptions': [
        for (final s in r.subscriptions)
          {
            'subscription_id': s.id,
            'chat': _store.chat(s.chatId)?.title ?? 'chat ${s.chatId}',
            'chat_id': s.chatId,
            'stars': s.pricing.starCount,
            'every_days': (s.pricing.period / 86400).round(),
            'until': TelegramToolRunner._iso(s.expirationDate),
            if (s.isCanceled) 'cancelled': true,
            if (s.isExpiring) 'expiring': true,
          },
      ],
    });
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _setStarSubscription(Map<String, dynamic> args) async {
    final id = '${args['subscription_id'] ?? ''}'.trim();
    if (id.isEmpty) throw ArgumentError('subscription_id is required');
    final cancel = args['cancel'] != false;
    await _client.send<td.Ok>(td.EditStarSubscription(subscriptionId: id, isCanceled: cancel), limited: true);
    return ToolOutput({'done': true, 'subscription_id': id, 'cancelled': cancel});
  }

  Future<ToolOutput> _starRevenue(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final owner = switch (c.type) {
      td.ChatTypePrivate(:final userId) => td.MessageSenderUser(userId: userId),
      _ => td.MessageSenderChat(chatId: c.id),
    };
    final r = await _client.send<td.StarRevenueStatistics>(
      td.GetStarRevenueStatistics(ownerId: owner, isDark: true),
      limited: true,
    );
    final s = r.status;
    return ToolOutput({
      'chat': c.title,
      'total_stars': s.totalCount,
      'current_stars': s.currentCount,
      'available_to_withdraw': s.availableCount,
      'usd_per_star': r.usdRate,
      'total_usd': (s.totalCount * r.usdRate).toStringAsFixed(2),
      if (s.withdrawalEnabled) 'withdrawal': 'possible in Telegram\'s official app',
    });
  }
}
