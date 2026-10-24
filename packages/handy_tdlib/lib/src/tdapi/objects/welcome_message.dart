part of '../tdapi.dart';

/// **WelcomeMessage** *(welcomeMessage)* - basic class
///
/// Describes a set up welcome message.
///
/// * [id]: Welcome message identifier; unique for the chat to which the welcome message belongs.
/// * [content]: Content of the welcome message.
final class WelcomeMessage extends TdObject {
  /// **WelcomeMessage** *(welcomeMessage)* - basic class
  ///
  /// Describes a set up welcome message.
  ///
  /// * [id]: Welcome message identifier; unique for the chat to which the welcome message belongs.
  /// * [content]: Content of the welcome message.
  const WelcomeMessage({
    required this.id,
    required this.content,
  });

  /// Welcome message identifier; unique for the chat to which the welcome message belongs
  final int id;

  /// Content of the welcome message
  final MessageContent content;

  /// Parse from a json
  factory WelcomeMessage.fromJson(Map<String, dynamic> json) => WelcomeMessage(
        id: json['id'],
        content: MessageContent.fromJson(json['content']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "content": content.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Welcome message identifier; unique for the chat to which the welcome message belongs
  /// * [content]: Content of the welcome message
  WelcomeMessage copyWith({
    int? id,
    MessageContent? content,
  }) =>
      WelcomeMessage(
        id: id ?? this.id,
        content: content ?? this.content,
      );

  /// TDLib object type
  static const String defaultObjectId = 'welcomeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
