part of '../tdapi.dart';

/// **InlineKeyboardButtonType** *(inlineKeyboardButtonType)* - parent
///
/// Describes the type of inline keyboard button.
sealed class InlineKeyboardButtonType extends TdObject {
  /// **InlineKeyboardButtonType** *(inlineKeyboardButtonType)* - parent
  ///
  /// Describes the type of inline keyboard button.
  const InlineKeyboardButtonType();

  /// a InlineKeyboardButtonType return type can be :
  /// * [InlineKeyboardButtonTypeUrl]
  /// * [InlineKeyboardButtonTypeLoginUrl]
  /// * [InlineKeyboardButtonTypeWebApp]
  /// * [InlineKeyboardButtonTypeCallback]
  /// * [InlineKeyboardButtonTypeCallbackWithPassword]
  /// * [InlineKeyboardButtonTypeCallbackGame]
  /// * [InlineKeyboardButtonTypeSwitchInline]
  /// * [InlineKeyboardButtonTypeBuy]
  /// * [InlineKeyboardButtonTypeUser]
  /// * [InlineKeyboardButtonTypeCopyText]
  /// * [InlineKeyboardButtonTypeDisabled]
  factory InlineKeyboardButtonType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InlineKeyboardButtonTypeUrl.defaultObjectId:
        return InlineKeyboardButtonTypeUrl.fromJson(json);
      case InlineKeyboardButtonTypeLoginUrl.defaultObjectId:
        return InlineKeyboardButtonTypeLoginUrl.fromJson(json);
      case InlineKeyboardButtonTypeWebApp.defaultObjectId:
        return InlineKeyboardButtonTypeWebApp.fromJson(json);
      case InlineKeyboardButtonTypeCallback.defaultObjectId:
        return InlineKeyboardButtonTypeCallback.fromJson(json);
      case InlineKeyboardButtonTypeCallbackWithPassword.defaultObjectId:
        return InlineKeyboardButtonTypeCallbackWithPassword.fromJson(json);
      case InlineKeyboardButtonTypeCallbackGame.defaultObjectId:
        return InlineKeyboardButtonTypeCallbackGame.fromJson(json);
      case InlineKeyboardButtonTypeSwitchInline.defaultObjectId:
        return InlineKeyboardButtonTypeSwitchInline.fromJson(json);
      case InlineKeyboardButtonTypeBuy.defaultObjectId:
        return InlineKeyboardButtonTypeBuy.fromJson(json);
      case InlineKeyboardButtonTypeUser.defaultObjectId:
        return InlineKeyboardButtonTypeUser.fromJson(json);
      case InlineKeyboardButtonTypeCopyText.defaultObjectId:
        return InlineKeyboardButtonTypeCopyText.fromJson(json);
      case InlineKeyboardButtonTypeDisabled.defaultObjectId:
        return InlineKeyboardButtonTypeDisabled.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InlineKeyboardButtonType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InlineKeyboardButtonType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeUrl** *(inlineKeyboardButtonTypeUrl)* - child of InlineKeyboardButtonType
///
/// A button that opens a specified URL.
///
/// * [url]: HTTP or tg:// URL to open. If the link is of the type internalLinkTypeWebApp, then the button must be marked as a Web App button.
final class InlineKeyboardButtonTypeUrl extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeUrl** *(inlineKeyboardButtonTypeUrl)* - child of InlineKeyboardButtonType
  ///
  /// A button that opens a specified URL.
  ///
  /// * [url]: HTTP or tg:// URL to open. If the link is of the type internalLinkTypeWebApp, then the button must be marked as a Web App button.
  const InlineKeyboardButtonTypeUrl({
    required this.url,
  });

  /// HTTP or tg:// URL to open. If the link is of the type internalLinkTypeWebApp, then the button must be marked as a Web App button
  final String url;

  /// Parse from a json
  factory InlineKeyboardButtonTypeUrl.fromJson(Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeUrl(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: HTTP or tg:// URL to open. If the link is of the type internalLinkTypeWebApp, then the button must be marked as a Web App button
  @override
  InlineKeyboardButtonTypeUrl copyWith({
    String? url,
  }) =>
      InlineKeyboardButtonTypeUrl(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeLoginUrl** *(inlineKeyboardButtonTypeLoginUrl)* - child of InlineKeyboardButtonType
///
/// A button that opens a specified URL and automatically authorize the current user by calling getLoginUrlInfo; not supported in ephemeral messages.
///
/// * [url]: An HTTP URL to pass to getLoginUrlInfo.
/// * [id]: Unique button identifier.
/// * [forwardText]: If non-empty, new text of the button in forwarded messages.
final class InlineKeyboardButtonTypeLoginUrl extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeLoginUrl** *(inlineKeyboardButtonTypeLoginUrl)* - child of InlineKeyboardButtonType
  ///
  /// A button that opens a specified URL and automatically authorize the current user by calling getLoginUrlInfo; not supported in ephemeral messages.
  ///
  /// * [url]: An HTTP URL to pass to getLoginUrlInfo.
  /// * [id]: Unique button identifier.
  /// * [forwardText]: If non-empty, new text of the button in forwarded messages.
  const InlineKeyboardButtonTypeLoginUrl({
    required this.url,
    required this.id,
    required this.forwardText,
  });

  /// An HTTP URL to pass to getLoginUrlInfo
  final String url;

  /// Unique button identifier
  final int id;

  /// If non-empty, new text of the button in forwarded messages
  final String forwardText;

  /// Parse from a json
  factory InlineKeyboardButtonTypeLoginUrl.fromJson(
          Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeLoginUrl(
        url: json['url'],
        id: json['id'],
        forwardText: json['forward_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "id": id,
      "forward_text": forwardText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: An HTTP URL to pass to getLoginUrlInfo
  /// * [id]: Unique button identifier
  /// * [forward_text]: If non-empty, new text of the button in forwarded messages
  @override
  InlineKeyboardButtonTypeLoginUrl copyWith({
    String? url,
    int? id,
    String? forwardText,
  }) =>
      InlineKeyboardButtonTypeLoginUrl(
        url: url ?? this.url,
        id: id ?? this.id,
        forwardText: forwardText ?? this.forwardText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeLoginUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeWebApp** *(inlineKeyboardButtonTypeWebApp)* - child of InlineKeyboardButtonType
///
/// A button that opens a Web App by calling openWebApp.
///
/// * [url]: An HTTP URL to pass to openWebApp.
final class InlineKeyboardButtonTypeWebApp extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeWebApp** *(inlineKeyboardButtonTypeWebApp)* - child of InlineKeyboardButtonType
  ///
  /// A button that opens a Web App by calling openWebApp.
  ///
  /// * [url]: An HTTP URL to pass to openWebApp.
  const InlineKeyboardButtonTypeWebApp({
    required this.url,
  });

  /// An HTTP URL to pass to openWebApp
  final String url;

  /// Parse from a json
  factory InlineKeyboardButtonTypeWebApp.fromJson(Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeWebApp(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: An HTTP URL to pass to openWebApp
  @override
  InlineKeyboardButtonTypeWebApp copyWith({
    String? url,
  }) =>
      InlineKeyboardButtonTypeWebApp(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeCallback** *(inlineKeyboardButtonTypeCallback)* - child of InlineKeyboardButtonType
///
/// A button that sends a callback query to a bot.
///
/// * [data]: Data to be sent to the bot via a callback query.
final class InlineKeyboardButtonTypeCallback extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeCallback** *(inlineKeyboardButtonTypeCallback)* - child of InlineKeyboardButtonType
  ///
  /// A button that sends a callback query to a bot.
  ///
  /// * [data]: Data to be sent to the bot via a callback query.
  const InlineKeyboardButtonTypeCallback({
    required this.data,
  });

  /// Data to be sent to the bot via a callback query
  final String data;

  /// Parse from a json
  factory InlineKeyboardButtonTypeCallback.fromJson(
          Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeCallback(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: Data to be sent to the bot via a callback query
  @override
  InlineKeyboardButtonTypeCallback copyWith({
    String? data,
  }) =>
      InlineKeyboardButtonTypeCallback(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeCallback';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeCallbackWithPassword** *(inlineKeyboardButtonTypeCallbackWithPassword)* - child of InlineKeyboardButtonType
///
/// A button that asks for the 2-step verification password of the current user and then sends a callback query to a bot.
///
/// * [data]: Data to be sent to the bot via a callback query.
final class InlineKeyboardButtonTypeCallbackWithPassword
    extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeCallbackWithPassword** *(inlineKeyboardButtonTypeCallbackWithPassword)* - child of InlineKeyboardButtonType
  ///
  /// A button that asks for the 2-step verification password of the current user and then sends a callback query to a bot.
  ///
  /// * [data]: Data to be sent to the bot via a callback query.
  const InlineKeyboardButtonTypeCallbackWithPassword({
    required this.data,
  });

  /// Data to be sent to the bot via a callback query
  final String data;

  /// Parse from a json
  factory InlineKeyboardButtonTypeCallbackWithPassword.fromJson(
          Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeCallbackWithPassword(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: Data to be sent to the bot via a callback query
  @override
  InlineKeyboardButtonTypeCallbackWithPassword copyWith({
    String? data,
  }) =>
      InlineKeyboardButtonTypeCallbackWithPassword(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inlineKeyboardButtonTypeCallbackWithPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeCallbackGame** *(inlineKeyboardButtonTypeCallbackGame)* - child of InlineKeyboardButtonType
///
/// A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame.
final class InlineKeyboardButtonTypeCallbackGame
    extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeCallbackGame** *(inlineKeyboardButtonTypeCallbackGame)* - child of InlineKeyboardButtonType
  ///
  /// A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame.
  const InlineKeyboardButtonTypeCallbackGame();

  /// Parse from a json
  factory InlineKeyboardButtonTypeCallbackGame.fromJson(
          Map<String, dynamic> json) =>
      const InlineKeyboardButtonTypeCallbackGame();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InlineKeyboardButtonTypeCallbackGame copyWith() =>
      const InlineKeyboardButtonTypeCallbackGame();

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeCallbackGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeSwitchInline** *(inlineKeyboardButtonTypeSwitchInline)* - child of InlineKeyboardButtonType
///
/// A button that forces an inline query to the bot to be inserted in the input field.
///
/// * [query]: Inline query to be sent to the bot.
/// * [targetChat]: Target chat from which to send the inline query.
final class InlineKeyboardButtonTypeSwitchInline
    extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeSwitchInline** *(inlineKeyboardButtonTypeSwitchInline)* - child of InlineKeyboardButtonType
  ///
  /// A button that forces an inline query to the bot to be inserted in the input field.
  ///
  /// * [query]: Inline query to be sent to the bot.
  /// * [targetChat]: Target chat from which to send the inline query.
  const InlineKeyboardButtonTypeSwitchInline({
    required this.query,
    required this.targetChat,
  });

  /// Inline query to be sent to the bot
  final String query;

  /// Target chat from which to send the inline query
  final TargetChat targetChat;

  /// Parse from a json
  factory InlineKeyboardButtonTypeSwitchInline.fromJson(
          Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeSwitchInline(
        query: json['query'],
        targetChat: TargetChat.fromJson(json['target_chat']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
      "target_chat": targetChat.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Inline query to be sent to the bot
  /// * [target_chat]: Target chat from which to send the inline query
  @override
  InlineKeyboardButtonTypeSwitchInline copyWith({
    String? query,
    TargetChat? targetChat,
  }) =>
      InlineKeyboardButtonTypeSwitchInline(
        query: query ?? this.query,
        targetChat: targetChat ?? this.targetChat,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeSwitchInline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeBuy** *(inlineKeyboardButtonTypeBuy)* - child of InlineKeyboardButtonType
///
/// A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice.
final class InlineKeyboardButtonTypeBuy extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeBuy** *(inlineKeyboardButtonTypeBuy)* - child of InlineKeyboardButtonType
  ///
  /// A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice.
  const InlineKeyboardButtonTypeBuy();

  /// Parse from a json
  factory InlineKeyboardButtonTypeBuy.fromJson(Map<String, dynamic> json) =>
      const InlineKeyboardButtonTypeBuy();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InlineKeyboardButtonTypeBuy copyWith() => const InlineKeyboardButtonTypeBuy();

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeBuy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeUser** *(inlineKeyboardButtonTypeUser)* - child of InlineKeyboardButtonType
///
/// A button with a user reference to be handled in the same way as textEntityTypeMentionName entities.
///
/// * [userId]: User identifier.
final class InlineKeyboardButtonTypeUser extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeUser** *(inlineKeyboardButtonTypeUser)* - child of InlineKeyboardButtonType
  ///
  /// A button with a user reference to be handled in the same way as textEntityTypeMentionName entities.
  ///
  /// * [userId]: User identifier.
  const InlineKeyboardButtonTypeUser({
    required this.userId,
  });

  /// User identifier
  final int userId;

  /// Parse from a json
  factory InlineKeyboardButtonTypeUser.fromJson(Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeUser(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  @override
  InlineKeyboardButtonTypeUser copyWith({
    int? userId,
  }) =>
      InlineKeyboardButtonTypeUser(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeCopyText** *(inlineKeyboardButtonTypeCopyText)* - child of InlineKeyboardButtonType
///
/// A button that copies specified text to clipboard.
///
/// * [text]: The text to copy to clipboard.
final class InlineKeyboardButtonTypeCopyText extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeCopyText** *(inlineKeyboardButtonTypeCopyText)* - child of InlineKeyboardButtonType
  ///
  /// A button that copies specified text to clipboard.
  ///
  /// * [text]: The text to copy to clipboard.
  const InlineKeyboardButtonTypeCopyText({
    required this.text,
  });

  /// The text to copy to clipboard
  final String text;

  /// Parse from a json
  factory InlineKeyboardButtonTypeCopyText.fromJson(
          Map<String, dynamic> json) =>
      InlineKeyboardButtonTypeCopyText(
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text to copy to clipboard
  @override
  InlineKeyboardButtonTypeCopyText copyWith({
    String? text,
  }) =>
      InlineKeyboardButtonTypeCopyText(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeCopyText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineKeyboardButtonTypeDisabled** *(inlineKeyboardButtonTypeDisabled)* - child of InlineKeyboardButtonType
///
/// A disabled button.
final class InlineKeyboardButtonTypeDisabled extends InlineKeyboardButtonType {
  /// **InlineKeyboardButtonTypeDisabled** *(inlineKeyboardButtonTypeDisabled)* - child of InlineKeyboardButtonType
  ///
  /// A disabled button.
  const InlineKeyboardButtonTypeDisabled();

  /// Parse from a json
  factory InlineKeyboardButtonTypeDisabled.fromJson(
          Map<String, dynamic> json) =>
      const InlineKeyboardButtonTypeDisabled();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InlineKeyboardButtonTypeDisabled copyWith() =>
      const InlineKeyboardButtonTypeDisabled();

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButtonTypeDisabled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
