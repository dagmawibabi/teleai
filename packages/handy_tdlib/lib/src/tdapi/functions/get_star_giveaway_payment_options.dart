part of '../tdapi.dart';

/// **GetStarGiveawayPaymentOptions** *(getStarGiveawayPaymentOptions)* - TDLib function
///
/// Returns available options for Telegram Star giveaway creation.
///
/// [StarGiveawayPaymentOptions] is returned on completion.
final class GetStarGiveawayPaymentOptions extends TdFunction {
  /// **GetStarGiveawayPaymentOptions** *(getStarGiveawayPaymentOptions)* - TDLib function
  ///
  /// Returns available options for Telegram Star giveaway creation.
  ///
  /// [StarGiveawayPaymentOptions] is returned on completion.
  const GetStarGiveawayPaymentOptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetStarGiveawayPaymentOptions copyWith() =>
      const GetStarGiveawayPaymentOptions();

  /// TDLib object type
  static const String defaultObjectId = 'getStarGiveawayPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
