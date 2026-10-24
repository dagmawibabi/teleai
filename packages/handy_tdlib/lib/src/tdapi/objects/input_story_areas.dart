part of '../tdapi.dart';

/// **InputStoryAreas** *(inputStoryAreas)* - basic class
///
/// Contains a list of story areas to be added.
///
/// * [areas]: List of input story areas. Currently, a story can have. up to 10 inputStoryAreaTypeLocation, inputStoryAreaTypeFoundVenue, and inputStoryAreaTypePreviousVenue areas,. up to getOption("story_suggested_reaction_area_count_max") inputStoryAreaTypeSuggestedReaction areas,. up to 1 inputStoryAreaTypeMessage area,. up to getOption("story_link_area_count_max") inputStoryAreaTypeLink areas if the current user is a Telegram Premium user,. up to 3 inputStoryAreaTypeWeather areas, and. up to 1 inputStoryAreaTypeUpgradedGift area.
final class InputStoryAreas extends TdObject {
  /// **InputStoryAreas** *(inputStoryAreas)* - basic class
  ///
  /// Contains a list of story areas to be added.
  ///
  /// * [areas]: List of input story areas. Currently, a story can have. up to 10 inputStoryAreaTypeLocation, inputStoryAreaTypeFoundVenue, and inputStoryAreaTypePreviousVenue areas,. up to getOption("story_suggested_reaction_area_count_max") inputStoryAreaTypeSuggestedReaction areas,. up to 1 inputStoryAreaTypeMessage area,. up to getOption("story_link_area_count_max") inputStoryAreaTypeLink areas if the current user is a Telegram Premium user,. up to 3 inputStoryAreaTypeWeather areas, and. up to 1 inputStoryAreaTypeUpgradedGift area.
  const InputStoryAreas({
    required this.areas,
  });

  /// List of input story areas. Currently, a story can have. up to 10 inputStoryAreaTypeLocation, inputStoryAreaTypeFoundVenue, and inputStoryAreaTypePreviousVenue areas,. up to getOption("story_suggested_reaction_area_count_max") inputStoryAreaTypeSuggestedReaction areas,. up to 1 inputStoryAreaTypeMessage area,. up to getOption("story_link_area_count_max") inputStoryAreaTypeLink areas if the current user is a Telegram Premium user,. up to 3 inputStoryAreaTypeWeather areas, and. up to 1 inputStoryAreaTypeUpgradedGift area
  final List<InputStoryArea> areas;

  /// Parse from a json
  factory InputStoryAreas.fromJson(Map<String, dynamic> json) =>
      InputStoryAreas(
        areas: List<InputStoryArea>.from((json['areas'] ?? [])
            .map((item) => InputStoryArea.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "areas": areas.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [areas]: List of input story areas. Currently, a story can have. up to 10 inputStoryAreaTypeLocation, inputStoryAreaTypeFoundVenue, and inputStoryAreaTypePreviousVenue areas,. up to getOption("story_suggested_reaction_area_count_max") inputStoryAreaTypeSuggestedReaction areas,. up to 1 inputStoryAreaTypeMessage area,. up to getOption("story_link_area_count_max") inputStoryAreaTypeLink areas if the current user is a Telegram Premium user,. up to 3 inputStoryAreaTypeWeather areas, and. up to 1 inputStoryAreaTypeUpgradedGift area
  InputStoryAreas copyWith({
    List<InputStoryArea>? areas,
  }) =>
      InputStoryAreas(
        areas: areas ?? this.areas,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreas';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
