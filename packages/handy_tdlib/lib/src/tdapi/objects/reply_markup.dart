part of '../tdapi.dart';

/// **ReplyMarkup** *(replyMarkup)* - parent
///
/// Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots.
sealed class ReplyMarkup extends TdObject {
  /// **ReplyMarkup** *(replyMarkup)* - parent
  ///
  /// Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots.
  const ReplyMarkup();

  /// a ReplyMarkup return type can be :
  /// * [ReplyMarkupRemoveKeyboard]
  /// * [ReplyMarkupForceReply]
  /// * [ReplyMarkupShowKeyboard]
  /// * [ReplyMarkupInlineKeyboard]
  factory ReplyMarkup.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReplyMarkupRemoveKeyboard.defaultObjectId:
        return ReplyMarkupRemoveKeyboard.fromJson(json);
      case ReplyMarkupForceReply.defaultObjectId:
        return ReplyMarkupForceReply.fromJson(json);
      case ReplyMarkupShowKeyboard.defaultObjectId:
        return ReplyMarkupShowKeyboard.fromJson(json);
      case ReplyMarkupInlineKeyboard.defaultObjectId:
        return ReplyMarkupInlineKeyboard.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReplyMarkup)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReplyMarkup copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'replyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReplyMarkupRemoveKeyboard** *(replyMarkupRemoveKeyboard)* - child of ReplyMarkup
///
/// Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, updateChatReplyMarkup with reply_markup_message == null will be sent.
///
/// * [isPersonal]: True, if the keyboard is removed only for the mentioned users or the target user of a reply.
final class ReplyMarkupRemoveKeyboard extends ReplyMarkup {
  /// **ReplyMarkupRemoveKeyboard** *(replyMarkupRemoveKeyboard)* - child of ReplyMarkup
  ///
  /// Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, updateChatReplyMarkup with reply_markup_message == null will be sent.
  ///
  /// * [isPersonal]: True, if the keyboard is removed only for the mentioned users or the target user of a reply.
  const ReplyMarkupRemoveKeyboard({
    required this.isPersonal,
  });

  /// True, if the keyboard is removed only for the mentioned users or the target user of a reply
  final bool isPersonal;

  /// Parse from a json
  factory ReplyMarkupRemoveKeyboard.fromJson(Map<String, dynamic> json) =>
      ReplyMarkupRemoveKeyboard(
        isPersonal: json['is_personal'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_personal": isPersonal,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_personal]: True, if the keyboard is removed only for the mentioned users or the target user of a reply
  @override
  ReplyMarkupRemoveKeyboard copyWith({
    bool? isPersonal,
  }) =>
      ReplyMarkupRemoveKeyboard(
        isPersonal: isPersonal ?? this.isPersonal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replyMarkupRemoveKeyboard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReplyMarkupForceReply** *(replyMarkupForceReply)* - child of ReplyMarkup
///
/// Instructs application to force a reply to this message.
///
/// * [isPersonal]: True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply.
/// * [inputFieldPlaceholder]: If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters.
final class ReplyMarkupForceReply extends ReplyMarkup {
  /// **ReplyMarkupForceReply** *(replyMarkupForceReply)* - child of ReplyMarkup
  ///
  /// Instructs application to force a reply to this message.
  ///
  /// * [isPersonal]: True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply.
  /// * [inputFieldPlaceholder]: If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters.
  const ReplyMarkupForceReply({
    required this.isPersonal,
    required this.inputFieldPlaceholder,
  });

  /// True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
  final bool isPersonal;

  /// If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
  final String inputFieldPlaceholder;

  /// Parse from a json
  factory ReplyMarkupForceReply.fromJson(Map<String, dynamic> json) =>
      ReplyMarkupForceReply(
        isPersonal: json['is_personal'],
        inputFieldPlaceholder: json['input_field_placeholder'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_personal": isPersonal,
      "input_field_placeholder": inputFieldPlaceholder,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_personal]: True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
  /// * [input_field_placeholder]: If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
  @override
  ReplyMarkupForceReply copyWith({
    bool? isPersonal,
    String? inputFieldPlaceholder,
  }) =>
      ReplyMarkupForceReply(
        isPersonal: isPersonal ?? this.isPersonal,
        inputFieldPlaceholder:
            inputFieldPlaceholder ?? this.inputFieldPlaceholder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replyMarkupForceReply';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReplyMarkupShowKeyboard** *(replyMarkupShowKeyboard)* - child of ReplyMarkup
///
/// Contains a custom keyboard layout to quickly reply to bots.
///
/// * [rows]: A list of rows of bot keyboard buttons.
/// * [isPersistent]: True, if the keyboard is expected to always be shown when the ordinary keyboard is hidden.
/// * [resizeKeyboard]: True, if the application needs to resize the keyboard vertically.
/// * [oneTime]: True, if the application needs to hide the keyboard after use.
/// * [isPersonal]: True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply.
/// * [forceReply]: True, if the keyboard must force reply to the message with the keyboard.
/// * [inputFieldPlaceholder]: If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters.
final class ReplyMarkupShowKeyboard extends ReplyMarkup {
  /// **ReplyMarkupShowKeyboard** *(replyMarkupShowKeyboard)* - child of ReplyMarkup
  ///
  /// Contains a custom keyboard layout to quickly reply to bots.
  ///
  /// * [rows]: A list of rows of bot keyboard buttons.
  /// * [isPersistent]: True, if the keyboard is expected to always be shown when the ordinary keyboard is hidden.
  /// * [resizeKeyboard]: True, if the application needs to resize the keyboard vertically.
  /// * [oneTime]: True, if the application needs to hide the keyboard after use.
  /// * [isPersonal]: True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply.
  /// * [forceReply]: True, if the keyboard must force reply to the message with the keyboard.
  /// * [inputFieldPlaceholder]: If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters.
  const ReplyMarkupShowKeyboard({
    required this.rows,
    required this.isPersistent,
    required this.resizeKeyboard,
    required this.oneTime,
    required this.isPersonal,
    required this.forceReply,
    required this.inputFieldPlaceholder,
  });

  /// A list of rows of bot keyboard buttons
  final List<List<KeyboardButton>> rows;

  /// True, if the keyboard is expected to always be shown when the ordinary keyboard is hidden
  final bool isPersistent;

  /// True, if the application needs to resize the keyboard vertically
  final bool resizeKeyboard;

  /// True, if the application needs to hide the keyboard after use
  final bool oneTime;

  /// True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
  final bool isPersonal;

  /// True, if the keyboard must force reply to the message with the keyboard
  final bool forceReply;

  /// If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
  final String inputFieldPlaceholder;

  /// Parse from a json
  factory ReplyMarkupShowKeyboard.fromJson(Map<String, dynamic> json) =>
      ReplyMarkupShowKeyboard(
        rows: List<List<KeyboardButton>>.from((json['rows'] ?? [])
            .map((item) => List<KeyboardButton>.from((item ?? [])
                .map((innerItem) => KeyboardButton.fromJson(innerItem))
                .toList()))
            .toList()),
        isPersistent: json['is_persistent'],
        resizeKeyboard: json['resize_keyboard'],
        oneTime: json['one_time'],
        isPersonal: json['is_personal'],
        forceReply: json['force_reply'],
        inputFieldPlaceholder: json['input_field_placeholder'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "rows": rows.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "is_persistent": isPersistent,
      "resize_keyboard": resizeKeyboard,
      "one_time": oneTime,
      "is_personal": isPersonal,
      "force_reply": forceReply,
      "input_field_placeholder": inputFieldPlaceholder,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [rows]: A list of rows of bot keyboard buttons
  /// * [is_persistent]: True, if the keyboard is expected to always be shown when the ordinary keyboard is hidden
  /// * [resize_keyboard]: True, if the application needs to resize the keyboard vertically
  /// * [one_time]: True, if the application needs to hide the keyboard after use
  /// * [is_personal]: True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
  /// * [force_reply]: True, if the keyboard must force reply to the message with the keyboard
  /// * [input_field_placeholder]: If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
  @override
  ReplyMarkupShowKeyboard copyWith({
    List<List<KeyboardButton>>? rows,
    bool? isPersistent,
    bool? resizeKeyboard,
    bool? oneTime,
    bool? isPersonal,
    bool? forceReply,
    String? inputFieldPlaceholder,
  }) =>
      ReplyMarkupShowKeyboard(
        rows: rows ?? this.rows,
        isPersistent: isPersistent ?? this.isPersistent,
        resizeKeyboard: resizeKeyboard ?? this.resizeKeyboard,
        oneTime: oneTime ?? this.oneTime,
        isPersonal: isPersonal ?? this.isPersonal,
        forceReply: forceReply ?? this.forceReply,
        inputFieldPlaceholder:
            inputFieldPlaceholder ?? this.inputFieldPlaceholder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replyMarkupShowKeyboard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReplyMarkupInlineKeyboard** *(replyMarkupInlineKeyboard)* - child of ReplyMarkup
///
/// Contains an inline keyboard layout.
///
/// * [rows]: A list of rows of inline keyboard buttons.
/// * [forceReply]: True, if a reply to the message must be forced when the message is received.
final class ReplyMarkupInlineKeyboard extends ReplyMarkup {
  /// **ReplyMarkupInlineKeyboard** *(replyMarkupInlineKeyboard)* - child of ReplyMarkup
  ///
  /// Contains an inline keyboard layout.
  ///
  /// * [rows]: A list of rows of inline keyboard buttons.
  /// * [forceReply]: True, if a reply to the message must be forced when the message is received.
  const ReplyMarkupInlineKeyboard({
    required this.rows,
    required this.forceReply,
  });

  /// A list of rows of inline keyboard buttons
  final List<List<InlineKeyboardButton>> rows;

  /// True, if a reply to the message must be forced when the message is received
  final bool forceReply;

  /// Parse from a json
  factory ReplyMarkupInlineKeyboard.fromJson(Map<String, dynamic> json) =>
      ReplyMarkupInlineKeyboard(
        rows: List<List<InlineKeyboardButton>>.from((json['rows'] ?? [])
            .map((item) => List<InlineKeyboardButton>.from((item ?? [])
                .map((innerItem) => InlineKeyboardButton.fromJson(innerItem))
                .toList()))
            .toList()),
        forceReply: json['force_reply'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "rows": rows.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "force_reply": forceReply,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [rows]: A list of rows of inline keyboard buttons
  /// * [force_reply]: True, if a reply to the message must be forced when the message is received
  @override
  ReplyMarkupInlineKeyboard copyWith({
    List<List<InlineKeyboardButton>>? rows,
    bool? forceReply,
  }) =>
      ReplyMarkupInlineKeyboard(
        rows: rows ?? this.rows,
        forceReply: forceReply ?? this.forceReply,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replyMarkupInlineKeyboard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
