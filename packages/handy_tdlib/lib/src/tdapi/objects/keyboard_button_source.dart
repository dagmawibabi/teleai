part of '../tdapi.dart';

/// **KeyboardButtonSource** *(keyboardButtonSource)* - parent
///
/// Describes source of a keyboard button.
sealed class KeyboardButtonSource extends TdObject {
  /// **KeyboardButtonSource** *(keyboardButtonSource)* - parent
  ///
  /// Describes source of a keyboard button.
  const KeyboardButtonSource();

  /// a KeyboardButtonSource return type can be :
  /// * [KeyboardButtonSourceMessage]
  /// * [KeyboardButtonSourceWebApp]
  factory KeyboardButtonSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case KeyboardButtonSourceMessage.defaultObjectId:
        return KeyboardButtonSourceMessage.fromJson(json);
      case KeyboardButtonSourceWebApp.defaultObjectId:
        return KeyboardButtonSourceWebApp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of KeyboardButtonSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  KeyboardButtonSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'keyboardButtonSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **KeyboardButtonSourceMessage** *(keyboardButtonSourceMessage)* - child of KeyboardButtonSource
///
/// The button is from a bot's message.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message with the button.
final class KeyboardButtonSourceMessage extends KeyboardButtonSource {
  /// **KeyboardButtonSourceMessage** *(keyboardButtonSourceMessage)* - child of KeyboardButtonSource
  ///
  /// The button is from a bot's message.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message with the button.
  const KeyboardButtonSourceMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message with the button
  final int messageId;

  /// Parse from a json
  factory KeyboardButtonSourceMessage.fromJson(Map<String, dynamic> json) =>
      KeyboardButtonSourceMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message with the button
  @override
  KeyboardButtonSourceMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      KeyboardButtonSourceMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'keyboardButtonSourceMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **KeyboardButtonSourceWebApp** *(keyboardButtonSourceWebApp)* - child of KeyboardButtonSource
///
/// The button is a prepared keyboard button from a Mini App received via getPreparedKeyboardButton.
///
/// * [botUserId]: Identifier of the bot that created the button.
/// * [preparedButtonId]: Identifier of the prepared button.
final class KeyboardButtonSourceWebApp extends KeyboardButtonSource {
  /// **KeyboardButtonSourceWebApp** *(keyboardButtonSourceWebApp)* - child of KeyboardButtonSource
  ///
  /// The button is a prepared keyboard button from a Mini App received via getPreparedKeyboardButton.
  ///
  /// * [botUserId]: Identifier of the bot that created the button.
  /// * [preparedButtonId]: Identifier of the prepared button.
  const KeyboardButtonSourceWebApp({
    required this.botUserId,
    required this.preparedButtonId,
  });

  /// Identifier of the bot that created the button
  final int botUserId;

  /// Identifier of the prepared button
  final String preparedButtonId;

  /// Parse from a json
  factory KeyboardButtonSourceWebApp.fromJson(Map<String, dynamic> json) =>
      KeyboardButtonSourceWebApp(
        botUserId: json['bot_user_id'],
        preparedButtonId: json['prepared_button_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "prepared_button_id": preparedButtonId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot that created the button
  /// * [prepared_button_id]: Identifier of the prepared button
  @override
  KeyboardButtonSourceWebApp copyWith({
    int? botUserId,
    String? preparedButtonId,
  }) =>
      KeyboardButtonSourceWebApp(
        botUserId: botUserId ?? this.botUserId,
        preparedButtonId: preparedButtonId ?? this.preparedButtonId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'keyboardButtonSourceWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
