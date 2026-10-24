part of '../tdapi.dart';

/// **GetPremiumInfoSticker** *(getPremiumInfoSticker)* - TDLib function
///
/// Returns the sticker to be used as representation of the Telegram Premium subscription.
///
/// * [monthCount]: Number of months the Telegram Premium subscription will be active.
///
/// [Sticker] is returned on completion.
final class GetPremiumInfoSticker extends TdFunction {
  /// **GetPremiumInfoSticker** *(getPremiumInfoSticker)* - TDLib function
  ///
  /// Returns the sticker to be used as representation of the Telegram Premium subscription.
  ///
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active.
  ///
  /// [Sticker] is returned on completion.
  const GetPremiumInfoSticker({
    required this.monthCount,
  });

  /// Number of months the Telegram Premium subscription will be active
  final int monthCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "month_count": monthCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [month_count]: Number of months the Telegram Premium subscription will be active
  GetPremiumInfoSticker copyWith({
    int? monthCount,
  }) =>
      GetPremiumInfoSticker(
        monthCount: monthCount ?? this.monthCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumInfoSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
