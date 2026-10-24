part of '../tdapi.dart';

/// **CanPurchaseFromStore** *(canPurchaseFromStore)* - TDLib function
///
/// Checks whether an in-store purchase is possible. Must be called before any in-store purchase. For official applications only.
///
/// * [purpose]: Transaction purpose.
///
/// [Ok] is returned on completion.
final class CanPurchaseFromStore extends TdFunction {
  /// **CanPurchaseFromStore** *(canPurchaseFromStore)* - TDLib function
  ///
  /// Checks whether an in-store purchase is possible. Must be called before any in-store purchase. For official applications only.
  ///
  /// * [purpose]: Transaction purpose.
  ///
  /// [Ok] is returned on completion.
  const CanPurchaseFromStore({
    required this.purpose,
  });

  /// Transaction purpose
  final StorePaymentPurpose purpose;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "purpose": purpose.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [purpose]: Transaction purpose
  CanPurchaseFromStore copyWith({
    StorePaymentPurpose? purpose,
  }) =>
      CanPurchaseFromStore(
        purpose: purpose ?? this.purpose,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canPurchaseFromStore';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
