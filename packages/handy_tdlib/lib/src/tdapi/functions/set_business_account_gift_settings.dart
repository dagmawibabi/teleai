part of '../tdapi.dart';

/// **SetBusinessAccountGiftSettings** *(setBusinessAccountGiftSettings)* - TDLib function
///
/// Changes settings for gift receiving of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [settings]: The new settings.
///
/// [Ok] is returned on completion.
final class SetBusinessAccountGiftSettings extends TdFunction {
  /// **SetBusinessAccountGiftSettings** *(setBusinessAccountGiftSettings)* - TDLib function
  ///
  /// Changes settings for gift receiving of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [settings]: The new settings.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAccountGiftSettings({
    required this.businessConnectionId,
    required this.settings,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// The new settings
  final GiftSettings settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "settings": settings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [settings]: The new settings
  SetBusinessAccountGiftSettings copyWith({
    String? businessConnectionId,
    GiftSettings? settings,
  }) =>
      SetBusinessAccountGiftSettings(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAccountGiftSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
