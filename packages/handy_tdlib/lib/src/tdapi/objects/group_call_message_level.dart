part of '../tdapi.dart';

/// **GroupCallMessageLevel** *(groupCallMessageLevel)* - basic class
///
/// Represents a level of features for a message sent in a live story group call.
///
/// * [minStarCount]: The minimum number of Telegram Stars required to get features of the level.
/// * [pinDuration]: The amount of time the message of this level will be pinned, in seconds.
/// * [maxTextLength]: The maximum allowed length of the message text.
/// * [maxCustomEmojiCount]: The maximum allowed number of custom emoji in the message text.
/// * [firstColor]: The first color used to show the message text in the RGB format.
/// * [secondColor]: The second color used to show the message text in the RGB format.
/// * [backgroundColor]: Background color for the message in the RGB format.
final class GroupCallMessageLevel extends TdObject {
  /// **GroupCallMessageLevel** *(groupCallMessageLevel)* - basic class
  ///
  /// Represents a level of features for a message sent in a live story group call.
  ///
  /// * [minStarCount]: The minimum number of Telegram Stars required to get features of the level.
  /// * [pinDuration]: The amount of time the message of this level will be pinned, in seconds.
  /// * [maxTextLength]: The maximum allowed length of the message text.
  /// * [maxCustomEmojiCount]: The maximum allowed number of custom emoji in the message text.
  /// * [firstColor]: The first color used to show the message text in the RGB format.
  /// * [secondColor]: The second color used to show the message text in the RGB format.
  /// * [backgroundColor]: Background color for the message in the RGB format.
  const GroupCallMessageLevel({
    required this.minStarCount,
    required this.pinDuration,
    required this.maxTextLength,
    required this.maxCustomEmojiCount,
    required this.firstColor,
    required this.secondColor,
    required this.backgroundColor,
  });

  /// The minimum number of Telegram Stars required to get features of the level
  final int minStarCount;

  /// The amount of time the message of this level will be pinned, in seconds
  final int pinDuration;

  /// The maximum allowed length of the message text
  final int maxTextLength;

  /// The maximum allowed number of custom emoji in the message text
  final int maxCustomEmojiCount;

  /// The first color used to show the message text in the RGB format
  final int firstColor;

  /// The second color used to show the message text in the RGB format
  final int secondColor;

  /// Background color for the message in the RGB format
  final int backgroundColor;

  /// Parse from a json
  factory GroupCallMessageLevel.fromJson(Map<String, dynamic> json) =>
      GroupCallMessageLevel(
        minStarCount: json['min_star_count'],
        pinDuration: json['pin_duration'],
        maxTextLength: json['max_text_length'],
        maxCustomEmojiCount: json['max_custom_emoji_count'],
        firstColor: json['first_color'],
        secondColor: json['second_color'],
        backgroundColor: json['background_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "min_star_count": minStarCount,
      "pin_duration": pinDuration,
      "max_text_length": maxTextLength,
      "max_custom_emoji_count": maxCustomEmojiCount,
      "first_color": firstColor,
      "second_color": secondColor,
      "background_color": backgroundColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [min_star_count]: The minimum number of Telegram Stars required to get features of the level
  /// * [pin_duration]: The amount of time the message of this level will be pinned, in seconds
  /// * [max_text_length]: The maximum allowed length of the message text
  /// * [max_custom_emoji_count]: The maximum allowed number of custom emoji in the message text
  /// * [first_color]: The first color used to show the message text in the RGB format
  /// * [second_color]: The second color used to show the message text in the RGB format
  /// * [background_color]: Background color for the message in the RGB format
  GroupCallMessageLevel copyWith({
    int? minStarCount,
    int? pinDuration,
    int? maxTextLength,
    int? maxCustomEmojiCount,
    int? firstColor,
    int? secondColor,
    int? backgroundColor,
  }) =>
      GroupCallMessageLevel(
        minStarCount: minStarCount ?? this.minStarCount,
        pinDuration: pinDuration ?? this.pinDuration,
        maxTextLength: maxTextLength ?? this.maxTextLength,
        maxCustomEmojiCount: maxCustomEmojiCount ?? this.maxCustomEmojiCount,
        firstColor: firstColor ?? this.firstColor,
        secondColor: secondColor ?? this.secondColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallMessageLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
