part of '../tdapi.dart';

/// **ProfileShareThemeBackdrops** *(profileShareThemeBackdrops)* - basic class
///
/// Contains a list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
///
/// * [backdrops]: The list of backdrops.
final class ProfileShareThemeBackdrops extends TdObject {
  /// **ProfileShareThemeBackdrops** *(profileShareThemeBackdrops)* - basic class
  ///
  /// Contains a list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
  ///
  /// * [backdrops]: The list of backdrops.
  const ProfileShareThemeBackdrops({
    required this.backdrops,
    this.extra,
    this.clientId,
  });

  /// The list of backdrops
  final List<ProfileShareThemeBackdrop> backdrops;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ProfileShareThemeBackdrops.fromJson(Map<String, dynamic> json) =>
      ProfileShareThemeBackdrops(
        backdrops: List<ProfileShareThemeBackdrop>.from(
            (json['backdrops'] ?? [])
                .map((item) => ProfileShareThemeBackdrop.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "backdrops": backdrops.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [backdrops]: The list of backdrops
  ProfileShareThemeBackdrops copyWith({
    List<ProfileShareThemeBackdrop>? backdrops,
    dynamic extra,
    int? clientId,
  }) =>
      ProfileShareThemeBackdrops(
        backdrops: backdrops ?? this.backdrops,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileShareThemeBackdrops';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
