part of '../tdapi.dart';

/// **GetTonWalletTransactions** *(getTonWalletTransactions)* - TDLib function
///
/// Returns the list of TON wallet transactions of the current user; can be used only if getOption("can_use_ton_wallet").
///
/// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
/// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of transactions to return.
///
/// [TonWalletTransactions] is returned on completion.
final class GetTonWalletTransactions extends TdFunction {
  /// **GetTonWalletTransactions** *(getTonWalletTransactions)* - TDLib function
  ///
  /// Returns the list of TON wallet transactions of the current user; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of transactions to return.
  ///
  /// [TonWalletTransactions] is returned on completion.
  const GetTonWalletTransactions({
    this.direction,
    required this.offset,
    required this.limit,
  });

  /// Direction of the transactions to receive; pass null to get all transactions
  final TransactionDirection? direction;

  /// Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of transactions to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "direction": direction?.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [direction]: Direction of the transactions to receive; pass null to get all transactions
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of transactions to return
  GetTonWalletTransactions copyWith({
    TransactionDirection? direction,
    String? offset,
    int? limit,
  }) =>
      GetTonWalletTransactions(
        direction: direction ?? this.direction,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
