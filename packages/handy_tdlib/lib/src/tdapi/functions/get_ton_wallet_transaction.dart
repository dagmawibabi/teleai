part of '../tdapi.dart';

/// **GetTonWalletTransaction** *(getTonWalletTransaction)* - TDLib function
///
/// Returns a TON wallet transaction by its identifier.
///
/// * [transactionId]: Identifier of the transaction.
///
/// [TonWalletTransaction] is returned on completion.
final class GetTonWalletTransaction extends TdFunction {
  /// **GetTonWalletTransaction** *(getTonWalletTransaction)* - TDLib function
  ///
  /// Returns a TON wallet transaction by its identifier.
  ///
  /// * [transactionId]: Identifier of the transaction.
  ///
  /// [TonWalletTransaction] is returned on completion.
  const GetTonWalletTransaction({
    required this.transactionId,
  });

  /// Identifier of the transaction
  final String transactionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "transaction_id": transactionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [transaction_id]: Identifier of the transaction
  GetTonWalletTransaction copyWith({
    String? transactionId,
  }) =>
      GetTonWalletTransaction(
        transactionId: transactionId ?? this.transactionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
