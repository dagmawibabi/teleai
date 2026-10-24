part of '../tdapi.dart';

/// **ChatMessageSender** *(chatMessageSender)* - basic class
///
/// Represents a message sender, which can be used to send messages in a chat.
///
/// * [sender]: The message sender.
/// * [needsPremium]: True, if Telegram Premium is needed to use the message sender.
final class ChatMessageSender extends TdObject {
  /// **ChatMessageSender** *(chatMessageSender)* - basic class
  ///
  /// Represents a message sender, which can be used to send messages in a chat.
  ///
  /// * [sender]: The message sender.
  /// * [needsPremium]: True, if Telegram Premium is needed to use the message sender.
  const ChatMessageSender({
    required this.sender,
    required this.needsPremium,
  });

  /// The message sender
  final MessageSender sender;

  /// True, if Telegram Premium is needed to use the message sender
  final bool needsPremium;

  /// Parse from a json
  factory ChatMessageSender.fromJson(Map<String, dynamic> json) =>
      ChatMessageSender(
        sender: MessageSender.fromJson(json['sender']),
        needsPremium: json['needs_premium'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender": sender.toJson(),
      "needs_premium": needsPremium,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender]: The message sender
  /// * [needs_premium]: True, if Telegram Premium is needed to use the message sender
  ChatMessageSender copyWith({
    MessageSender? sender,
    bool? needsPremium,
  }) =>
      ChatMessageSender(
        sender: sender ?? this.sender,
        needsPremium: needsPremium ?? this.needsPremium,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMessageSender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
