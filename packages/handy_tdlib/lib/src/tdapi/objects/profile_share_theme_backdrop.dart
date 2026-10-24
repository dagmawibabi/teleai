part of '../tdapi.dart';

/// **ProfileShareThemeBackdrop** *(profileShareThemeBackdrop)* - basic class
///
/// Describes a backdrop, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
///
/// * [id]: Unique identifier of the backdrop.
/// * [name]: Name of the backdrop.
/// * [colors]: Colors of the backdrop.
final class ProfileShareThemeBackdrop extends TdObject {
  /// **ProfileShareThemeBackdrop** *(profileShareThemeBackdrop)* - basic class
  ///
  /// Describes a backdrop, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
  ///
  /// * [id]: Unique identifier of the backdrop.
  /// * [name]: Name of the backdrop.
  /// * [colors]: Colors of the backdrop.
  const ProfileShareThemeBackdrop({
    required this.id,
    required this.name,
    required this.colors,
  });

  /// Unique identifier of the backdrop
  final int id;

  /// Name of the backdrop
  final String name;

  /// Colors of the backdrop
  final UpgradedGiftBackdropColors colors;

  /// Parse from a json
  factory ProfileShareThemeBackdrop.fromJson(Map<String, dynamic> json) =>
      ProfileShareThemeBackdrop(
        id: json['id'],
        name: json['name'],
        colors: UpgradedGiftBackdropColors.fromJson(json['colors']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "colors": colors.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the backdrop
  /// * [name]: Name of the backdrop
  /// * [colors]: Colors of the backdrop
  ProfileShareThemeBackdrop copyWith({
    int? id,
    String? name,
    UpgradedGiftBackdropColors? colors,
  }) =>
      ProfileShareThemeBackdrop(
        id: id ?? this.id,
        name: name ?? this.name,
        colors: colors ?? this.colors,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileShareThemeBackdrop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
