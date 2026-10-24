part of '../tdapi.dart';

/// **BusinessChatLinkInfo** *(businessChatLinkInfo)* - basic class
///
/// Contains information about a business chat link.
///
/// * [chatId]: Identifier of the private chat that created the link.
/// * [text]: Message draft text that must be added to the input field.
final class BusinessChatLinkInfo extends TdObject {
  /// **BusinessChatLinkInfo** *(businessChatLinkInfo)* - basic class
  ///
  /// Contains information about a business chat link.
  ///
  /// * [chatId]: Identifier of the private chat that created the link.
  /// * [text]: Message draft text that must be added to the input field.
  const BusinessChatLinkInfo({
    required this.chatId,
    required this.text,
    this.extra,
    this.clientId,
  });

  /// Identifier of the private chat that created the link
  final int chatId;

  /// Message draft text that must be added to the input field
  final FormattedText text;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessChatLinkInfo.fromJson(Map<String, dynamic> json) =>
      BusinessChatLinkInfo(
        chatId: json['chat_id'],
        text: FormattedText.fromJson(json['text']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the private chat that created the link
  /// * [text]: Message draft text that must be added to the input field
  BusinessChatLinkInfo copyWith({
    int? chatId,
    FormattedText? text,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessChatLinkInfo(
        chatId: chatId ?? this.chatId,
        text: text ?? this.text,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessChatLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
