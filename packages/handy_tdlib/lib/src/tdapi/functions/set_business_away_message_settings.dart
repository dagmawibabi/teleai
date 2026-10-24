part of '../tdapi.dart';

/// **SetBusinessAwayMessageSettings** *(setBusinessAwayMessageSettings)* - TDLib function
///
/// Changes the business away message settings of the current user. Requires Telegram Business subscription.
///
/// * [awayMessageSettings]: The new settings for the away message of the business; pass null to disable the away message *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBusinessAwayMessageSettings extends TdFunction {
  /// **SetBusinessAwayMessageSettings** *(setBusinessAwayMessageSettings)* - TDLib function
  ///
  /// Changes the business away message settings of the current user. Requires Telegram Business subscription.
  ///
  /// * [awayMessageSettings]: The new settings for the away message of the business; pass null to disable the away message *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAwayMessageSettings({
    this.awayMessageSettings,
  });

  /// The new settings for the away message of the business; pass null to disable the away message
  final BusinessAwayMessageSettings? awayMessageSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "away_message_settings": awayMessageSettings?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [away_message_settings]: The new settings for the away message of the business; pass null to disable the away message
  SetBusinessAwayMessageSettings copyWith({
    BusinessAwayMessageSettings? awayMessageSettings,
  }) =>
      SetBusinessAwayMessageSettings(
        awayMessageSettings: awayMessageSettings ?? this.awayMessageSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAwayMessageSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
