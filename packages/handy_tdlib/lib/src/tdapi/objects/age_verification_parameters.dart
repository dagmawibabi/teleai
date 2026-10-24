part of '../tdapi.dart';

/// **AgeVerificationParameters** *(ageVerificationParameters)* - basic class
///
/// Describes parameters for age verification of the current user.
///
/// * [minAge]: The minimum age required to view restricted content.
/// * [verificationBotUsername]: Username of the bot which main Web App may be used to verify age of the user.
/// * [country]: Unique name for the country or region, which legislation required age verification. May be used to get the corresponding localization key.
final class AgeVerificationParameters extends TdObject {
  /// **AgeVerificationParameters** *(ageVerificationParameters)* - basic class
  ///
  /// Describes parameters for age verification of the current user.
  ///
  /// * [minAge]: The minimum age required to view restricted content.
  /// * [verificationBotUsername]: Username of the bot which main Web App may be used to verify age of the user.
  /// * [country]: Unique name for the country or region, which legislation required age verification. May be used to get the corresponding localization key.
  const AgeVerificationParameters({
    required this.minAge,
    required this.verificationBotUsername,
    required this.country,
  });

  /// The minimum age required to view restricted content
  final int minAge;

  /// Username of the bot which main Web App may be used to verify age of the user
  final String verificationBotUsername;

  /// Unique name for the country or region, which legislation required age verification. May be used to get the corresponding localization key
  final String country;

  /// Parse from a json
  factory AgeVerificationParameters.fromJson(Map<String, dynamic> json) =>
      AgeVerificationParameters(
        minAge: json['min_age'],
        verificationBotUsername: json['verification_bot_username'],
        country: json['country'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "min_age": minAge,
      "verification_bot_username": verificationBotUsername,
      "country": country,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [min_age]: The minimum age required to view restricted content
  /// * [verification_bot_username]: Username of the bot which main Web App may be used to verify age of the user
  /// * [country]: Unique name for the country or region, which legislation required age verification. May be used to get the corresponding localization key
  AgeVerificationParameters copyWith({
    int? minAge,
    String? verificationBotUsername,
    String? country,
  }) =>
      AgeVerificationParameters(
        minAge: minAge ?? this.minAge,
        verificationBotUsername:
            verificationBotUsername ?? this.verificationBotUsername,
        country: country ?? this.country,
      );

  /// TDLib object type
  static const String defaultObjectId = 'ageVerificationParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
