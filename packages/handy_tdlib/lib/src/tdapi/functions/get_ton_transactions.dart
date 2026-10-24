part of '../tdapi.dart';

/// **GetTonTransactions** *(getTonTransactions)* - TDLib function
///
/// Returns the list of TON Gram transactions of the current user.
///
/// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
/// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of transactions to return.
///
/// [TonTransactions] is returned on completion.
final class GetTonTransactions extends TdFunction {
  /// **GetTonTransactions** *(getTonTransactions)* - TDLib function
  ///
  /// Returns the list of TON Gram transactions of the current user.
  ///
  /// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of transactions to return.
  ///
  /// [TonTransactions] is returned on completion.
  const GetTonTransactions({
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
  GetTonTransactions copyWith({
    TransactionDirection? direction,
    String? offset,
    int? limit,
  }) =>
      GetTonTransactions(
        direction: direction ?? this.direction,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
