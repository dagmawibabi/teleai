part of '../tdapi.dart';

/// **ChatTheme** *(chatTheme)* - parent
///
/// Describes a chat theme.
sealed class ChatTheme extends TdObject {
  /// **ChatTheme** *(chatTheme)* - parent
  ///
  /// Describes a chat theme.
  const ChatTheme();

  /// a ChatTheme return type can be :
  /// * [ChatThemeEmoji]
  /// * [ChatThemeGift]
  factory ChatTheme.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatThemeEmoji.defaultObjectId:
        return ChatThemeEmoji.fromJson(json);
      case ChatThemeGift.defaultObjectId:
        return ChatThemeGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatTheme)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatTheme copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatThemeEmoji** *(chatThemeEmoji)* - child of ChatTheme
///
/// A chat theme based on an emoji.
///
/// * [name]: Name of the theme; full theme description is received through updateEmojiChatThemes.
final class ChatThemeEmoji extends ChatTheme {
  /// **ChatThemeEmoji** *(chatThemeEmoji)* - child of ChatTheme
  ///
  /// A chat theme based on an emoji.
  ///
  /// * [name]: Name of the theme; full theme description is received through updateEmojiChatThemes.
  const ChatThemeEmoji({
    required this.name,
  });

  /// Name of the theme; full theme description is received through updateEmojiChatThemes
  final String name;

  /// Parse from a json
  factory ChatThemeEmoji.fromJson(Map<String, dynamic> json) => ChatThemeEmoji(
        name: json['name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the theme; full theme description is received through updateEmojiChatThemes
  @override
  ChatThemeEmoji copyWith({
    String? name,
  }) =>
      ChatThemeEmoji(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatThemeEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatThemeGift** *(chatThemeGift)* - child of ChatTheme
///
/// A chat theme based on an upgraded gift.
///
/// * [giftTheme]: The chat theme.
final class ChatThemeGift extends ChatTheme {
  /// **ChatThemeGift** *(chatThemeGift)* - child of ChatTheme
  ///
  /// A chat theme based on an upgraded gift.
  ///
  /// * [giftTheme]: The chat theme.
  const ChatThemeGift({
    required this.giftTheme,
  });

  /// The chat theme
  final GiftChatTheme giftTheme;

  /// Parse from a json
  factory ChatThemeGift.fromJson(Map<String, dynamic> json) => ChatThemeGift(
        giftTheme: GiftChatTheme.fromJson(json['gift_theme']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift_theme": giftTheme.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_theme]: The chat theme
  @override
  ChatThemeGift copyWith({
    GiftChatTheme? giftTheme,
  }) =>
      ChatThemeGift(
        giftTheme: giftTheme ?? this.giftTheme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatThemeGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
