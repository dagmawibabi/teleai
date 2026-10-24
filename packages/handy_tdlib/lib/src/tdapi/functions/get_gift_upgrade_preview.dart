part of '../tdapi.dart';

/// **GetGiftUpgradePreview** *(getGiftUpgradePreview)* - TDLib function
///
/// Returns examples of possible upgraded gifts for a regular gift.
///
/// * [regularGiftId]: Identifier of the regular gift.
///
/// [GiftUpgradePreview] is returned on completion.
final class GetGiftUpgradePreview extends TdFunction {
  /// **GetGiftUpgradePreview** *(getGiftUpgradePreview)* - TDLib function
  ///
  /// Returns examples of possible upgraded gifts for a regular gift.
  ///
  /// * [regularGiftId]: Identifier of the regular gift.
  ///
  /// [GiftUpgradePreview] is returned on completion.
  const GetGiftUpgradePreview({
    required this.regularGiftId,
  });

  /// Identifier of the regular gift
  final int regularGiftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "regular_gift_id": regularGiftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [regular_gift_id]: Identifier of the regular gift
  GetGiftUpgradePreview copyWith({
    int? regularGiftId,
  }) =>
      GetGiftUpgradePreview(
        regularGiftId: regularGiftId ?? this.regularGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftUpgradePreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
