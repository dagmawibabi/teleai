part of '../tdapi.dart';

/// **AssignStoreTransaction** *(assignStoreTransaction)* - TDLib function
///
/// Informs server about an in-store purchase. For official applications only.
///
/// * [transaction]: Information about the transaction.
/// * [purpose]: Transaction purpose.
///
/// [Ok] is returned on completion.
final class AssignStoreTransaction extends TdFunction {
  /// **AssignStoreTransaction** *(assignStoreTransaction)* - TDLib function
  ///
  /// Informs server about an in-store purchase. For official applications only.
  ///
  /// * [transaction]: Information about the transaction.
  /// * [purpose]: Transaction purpose.
  ///
  /// [Ok] is returned on completion.
  const AssignStoreTransaction({
    required this.transaction,
    required this.purpose,
  });

  /// Information about the transaction
  final StoreTransaction transaction;

  /// Transaction purpose
  final StorePaymentPurpose purpose;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "transaction": transaction.toJson(),
      "purpose": purpose.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [transaction]: Information about the transaction
  /// * [purpose]: Transaction purpose
  AssignStoreTransaction copyWith({
    StoreTransaction? transaction,
    StorePaymentPurpose? purpose,
  }) =>
      AssignStoreTransaction(
        transaction: transaction ?? this.transaction,
        purpose: purpose ?? this.purpose,
      );

  /// TDLib object type
  static const String defaultObjectId = 'assignStoreTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
