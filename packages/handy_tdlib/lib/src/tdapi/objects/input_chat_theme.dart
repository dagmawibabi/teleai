part of '../tdapi.dart';

/// **InputChatTheme** *(inputChatTheme)* - parent
///
/// Describes a chat theme to set.
sealed class InputChatTheme extends TdObject {
  /// **InputChatTheme** *(inputChatTheme)* - parent
  ///
  /// Describes a chat theme to set.
  const InputChatTheme();

  /// a InputChatTheme return type can be :
  /// * [InputChatThemeEmoji]
  /// * [InputChatThemeGift]
  factory InputChatTheme.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputChatThemeEmoji.defaultObjectId:
        return InputChatThemeEmoji.fromJson(json);
      case InputChatThemeGift.defaultObjectId:
        return InputChatThemeGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputChatTheme)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputChatTheme copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatThemeEmoji** *(inputChatThemeEmoji)* - child of InputChatTheme
///
/// A theme based on an emoji.
///
/// * [name]: Name of the theme.
final class InputChatThemeEmoji extends InputChatTheme {
  /// **InputChatThemeEmoji** *(inputChatThemeEmoji)* - child of InputChatTheme
  ///
  /// A theme based on an emoji.
  ///
  /// * [name]: Name of the theme.
  const InputChatThemeEmoji({
    required this.name,
  });

  /// Name of the theme
  final String name;

  /// Parse from a json
  factory InputChatThemeEmoji.fromJson(Map<String, dynamic> json) =>
      InputChatThemeEmoji(
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
  /// * [name]: Name of the theme
  @override
  InputChatThemeEmoji copyWith({
    String? name,
  }) =>
      InputChatThemeEmoji(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatThemeEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatThemeGift** *(inputChatThemeGift)* - child of InputChatTheme
///
/// A theme based on an upgraded gift.
///
/// * [name]: Name of the upgraded gift. A gift can be used only in one chat at a time.. When the same gift is used in another chat, theme in the previous chat is reset to default.
final class InputChatThemeGift extends InputChatTheme {
  /// **InputChatThemeGift** *(inputChatThemeGift)* - child of InputChatTheme
  ///
  /// A theme based on an upgraded gift.
  ///
  /// * [name]: Name of the upgraded gift. A gift can be used only in one chat at a time.. When the same gift is used in another chat, theme in the previous chat is reset to default.
  const InputChatThemeGift({
    required this.name,
  });

  /// Name of the upgraded gift. A gift can be used only in one chat at a time.. When the same gift is used in another chat, theme in the previous chat is reset to default
  final String name;

  /// Parse from a json
  factory InputChatThemeGift.fromJson(Map<String, dynamic> json) =>
      InputChatThemeGift(
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
  /// * [name]: Name of the upgraded gift. A gift can be used only in one chat at a time.. When the same gift is used in another chat, theme in the previous chat is reset to default
  @override
  InputChatThemeGift copyWith({
    String? name,
  }) =>
      InputChatThemeGift(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatThemeGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
