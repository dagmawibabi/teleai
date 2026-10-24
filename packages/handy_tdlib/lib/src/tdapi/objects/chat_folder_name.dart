part of '../tdapi.dart';

/// **ChatFolderName** *(chatFolderName)* - basic class
///
/// Describes name of a chat folder.
///
/// * [text]: The text of the chat folder name; 1-12 characters without line feeds. May contain only CustomEmoji entities.
/// * [animateCustomEmoji]: True, if custom emoji in the name must be animated.
final class ChatFolderName extends TdObject {
  /// **ChatFolderName** *(chatFolderName)* - basic class
  ///
  /// Describes name of a chat folder.
  ///
  /// * [text]: The text of the chat folder name; 1-12 characters without line feeds. May contain only CustomEmoji entities.
  /// * [animateCustomEmoji]: True, if custom emoji in the name must be animated.
  const ChatFolderName({
    required this.text,
    required this.animateCustomEmoji,
  });

  /// The text of the chat folder name; 1-12 characters without line feeds. May contain only CustomEmoji entities
  final FormattedText text;

  /// True, if custom emoji in the name must be animated
  final bool animateCustomEmoji;

  /// Parse from a json
  factory ChatFolderName.fromJson(Map<String, dynamic> json) => ChatFolderName(
        text: FormattedText.fromJson(json['text']),
        animateCustomEmoji: json['animate_custom_emoji'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "animate_custom_emoji": animateCustomEmoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text of the chat folder name; 1-12 characters without line feeds. May contain only CustomEmoji entities
  /// * [animate_custom_emoji]: True, if custom emoji in the name must be animated
  ChatFolderName copyWith({
    FormattedText? text,
    bool? animateCustomEmoji,
  }) =>
      ChatFolderName(
        text: text ?? this.text,
        animateCustomEmoji: animateCustomEmoji ?? this.animateCustomEmoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolderName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
