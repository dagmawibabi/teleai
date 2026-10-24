part of '../tdapi.dart';

/// **UserRating** *(userRating)* - basic class
///
/// Contains description of user rating.
///
/// * [level]: The level of the user; may be negative.
/// * [isMaximumLevelReached]: True, if the maximum level is reached.
/// * [rating]: Numerical value of the rating.
/// * [currentLevelRating]: The rating required for the current level.
/// * [nextLevelRating]: The rating required for the next level; 0 if the maximum level is reached.
final class UserRating extends TdObject {
  /// **UserRating** *(userRating)* - basic class
  ///
  /// Contains description of user rating.
  ///
  /// * [level]: The level of the user; may be negative.
  /// * [isMaximumLevelReached]: True, if the maximum level is reached.
  /// * [rating]: Numerical value of the rating.
  /// * [currentLevelRating]: The rating required for the current level.
  /// * [nextLevelRating]: The rating required for the next level; 0 if the maximum level is reached.
  const UserRating({
    required this.level,
    required this.isMaximumLevelReached,
    required this.rating,
    required this.currentLevelRating,
    required this.nextLevelRating,
  });

  /// The level of the user; may be negative
  final int level;

  /// True, if the maximum level is reached
  final bool isMaximumLevelReached;

  /// Numerical value of the rating
  final int rating;

  /// The rating required for the current level
  final int currentLevelRating;

  /// The rating required for the next level; 0 if the maximum level is reached
  final int nextLevelRating;

  /// Parse from a json
  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        level: json['level'],
        isMaximumLevelReached: json['is_maximum_level_reached'],
        rating: json['rating'],
        currentLevelRating: json['current_level_rating'],
        nextLevelRating: json['next_level_rating'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "level": level,
      "is_maximum_level_reached": isMaximumLevelReached,
      "rating": rating,
      "current_level_rating": currentLevelRating,
      "next_level_rating": nextLevelRating,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [level]: The level of the user; may be negative
  /// * [is_maximum_level_reached]: True, if the maximum level is reached
  /// * [rating]: Numerical value of the rating
  /// * [current_level_rating]: The rating required for the current level
  /// * [next_level_rating]: The rating required for the next level; 0 if the maximum level is reached
  UserRating copyWith({
    int? level,
    bool? isMaximumLevelReached,
    int? rating,
    int? currentLevelRating,
    int? nextLevelRating,
  }) =>
      UserRating(
        level: level ?? this.level,
        isMaximumLevelReached:
            isMaximumLevelReached ?? this.isMaximumLevelReached,
        rating: rating ?? this.rating,
        currentLevelRating: currentLevelRating ?? this.currentLevelRating,
        nextLevelRating: nextLevelRating ?? this.nextLevelRating,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userRating';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
