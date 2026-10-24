part of '../tdapi.dart';

/// **AddQuickReplyShortcutInlineQueryResultMessage** *(addQuickReplyShortcutInlineQueryResultMessage)* - TDLib function
///
/// Adds a message to a quick reply shortcut via inline bot. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message.
///
/// * [shortcutName]: Name of the target shortcut.
/// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
/// * [queryId]: Identifier of the inline query.
/// * [resultId]: Identifier of the inline query result.
/// * [hideViaBot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username").
///
/// [QuickReplyMessage] is returned on completion.
final class AddQuickReplyShortcutInlineQueryResultMessage extends TdFunction {
  /// **AddQuickReplyShortcutInlineQueryResultMessage** *(addQuickReplyShortcutInlineQueryResultMessage)* - TDLib function
  ///
  /// Adds a message to a quick reply shortcut via inline bot. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message.
  ///
  /// * [shortcutName]: Name of the target shortcut.
  /// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
  /// * [queryId]: Identifier of the inline query.
  /// * [resultId]: Identifier of the inline query result.
  /// * [hideViaBot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username").
  ///
  /// [QuickReplyMessage] is returned on completion.
  const AddQuickReplyShortcutInlineQueryResultMessage({
    required this.shortcutName,
    required this.replyToMessageId,
    required this.queryId,
    required this.resultId,
    required this.hideViaBot,
  });

  /// Name of the target shortcut
  final String shortcutName;

  /// Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  final int replyToMessageId;

  /// Identifier of the inline query
  final int queryId;

  /// Identifier of the inline query result
  final String resultId;

  /// Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
  final bool hideViaBot;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_name": shortcutName,
      "reply_to_message_id": replyToMessageId,
      "query_id": queryId,
      "result_id": resultId,
      "hide_via_bot": hideViaBot,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_name]: Name of the target shortcut
  /// * [reply_to_message_id]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  /// * [query_id]: Identifier of the inline query
  /// * [result_id]: Identifier of the inline query result
  /// * [hide_via_bot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
  AddQuickReplyShortcutInlineQueryResultMessage copyWith({
    String? shortcutName,
    int? replyToMessageId,
    int? queryId,
    String? resultId,
    bool? hideViaBot,
  }) =>
      AddQuickReplyShortcutInlineQueryResultMessage(
        shortcutName: shortcutName ?? this.shortcutName,
        replyToMessageId: replyToMessageId ?? this.replyToMessageId,
        queryId: queryId ?? this.queryId,
        resultId: resultId ?? this.resultId,
        hideViaBot: hideViaBot ?? this.hideViaBot,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'addQuickReplyShortcutInlineQueryResultMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
