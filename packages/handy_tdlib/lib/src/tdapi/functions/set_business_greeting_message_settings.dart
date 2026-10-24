part of '../tdapi.dart';

/// **SetBusinessGreetingMessageSettings** *(setBusinessGreetingMessageSettings)* - TDLib function
///
/// Changes the business greeting message settings of the current user. Requires Telegram Business subscription.
///
/// * [greetingMessageSettings]: The new settings for the greeting message of the business; pass null to disable the greeting message *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBusinessGreetingMessageSettings extends TdFunction {
  /// **SetBusinessGreetingMessageSettings** *(setBusinessGreetingMessageSettings)* - TDLib function
  ///
  /// Changes the business greeting message settings of the current user. Requires Telegram Business subscription.
  ///
  /// * [greetingMessageSettings]: The new settings for the greeting message of the business; pass null to disable the greeting message *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessGreetingMessageSettings({
    this.greetingMessageSettings,
  });

  /// The new settings for the greeting message of the business; pass null to disable the greeting message
  final BusinessGreetingMessageSettings? greetingMessageSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "greeting_message_settings": greetingMessageSettings?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [greeting_message_settings]: The new settings for the greeting message of the business; pass null to disable the greeting message
  SetBusinessGreetingMessageSettings copyWith({
    BusinessGreetingMessageSettings? greetingMessageSettings,
  }) =>
      SetBusinessGreetingMessageSettings(
        greetingMessageSettings:
            greetingMessageSettings ?? this.greetingMessageSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessGreetingMessageSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
