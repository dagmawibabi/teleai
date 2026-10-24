part of '../tdapi.dart';

/// **SetGiftSettings** *(setGiftSettings)* - TDLib function
///
/// Changes settings for gift receiving for the current user.
///
/// * [settings]: The new settings.
///
/// [Ok] is returned on completion.
final class SetGiftSettings extends TdFunction {
  /// **SetGiftSettings** *(setGiftSettings)* - TDLib function
  ///
  /// Changes settings for gift receiving for the current user.
  ///
  /// * [settings]: The new settings.
  ///
  /// [Ok] is returned on completion.
  const SetGiftSettings({
    required this.settings,
  });

  /// The new settings
  final GiftSettings settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "settings": settings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [settings]: The new settings
  SetGiftSettings copyWith({
    GiftSettings? settings,
  }) =>
      SetGiftSettings(
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGiftSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
