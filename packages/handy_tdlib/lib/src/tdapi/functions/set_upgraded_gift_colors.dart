part of '../tdapi.dart';

/// **SetUpgradedGiftColors** *(setUpgradedGiftColors)* - TDLib function
///
/// Changes color scheme for the current user based on an owned or a hosted upgraded gift; for Telegram Premium users only.
///
/// * [upgradedGiftColorsId]: Identifier of the upgradedGiftColors scheme to use.
///
/// [Ok] is returned on completion.
final class SetUpgradedGiftColors extends TdFunction {
  /// **SetUpgradedGiftColors** *(setUpgradedGiftColors)* - TDLib function
  ///
  /// Changes color scheme for the current user based on an owned or a hosted upgraded gift; for Telegram Premium users only.
  ///
  /// * [upgradedGiftColorsId]: Identifier of the upgradedGiftColors scheme to use.
  ///
  /// [Ok] is returned on completion.
  const SetUpgradedGiftColors({
    required this.upgradedGiftColorsId,
  });

  /// Identifier of the upgradedGiftColors scheme to use
  final int upgradedGiftColorsId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "upgraded_gift_colors_id": upgradedGiftColorsId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [upgraded_gift_colors_id]: Identifier of the upgradedGiftColors scheme to use
  SetUpgradedGiftColors copyWith({
    int? upgradedGiftColorsId,
  }) =>
      SetUpgradedGiftColors(
        upgradedGiftColorsId: upgradedGiftColorsId ?? this.upgradedGiftColorsId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUpgradedGiftColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
