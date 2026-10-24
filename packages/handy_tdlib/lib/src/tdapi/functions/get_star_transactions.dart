part of '../tdapi.dart';

/// **GetStarTransactions** *(getStarTransactions)* - TDLib function
///
/// Returns the list of Telegram Star transactions for the specified owner.
///
/// * [ownerId]: Identifier of the owner of the Telegram Stars; can be the identifier of the current user, identifier of an owned bot,. or identifier of a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true.
/// * [subscriptionId]: If non-empty, only transactions related to the Star Subscription will be returned.
/// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
/// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of transactions to return.
///
/// [StarTransactions] is returned on completion.
final class GetStarTransactions extends TdFunction {
  /// **GetStarTransactions** *(getStarTransactions)* - TDLib function
  ///
  /// Returns the list of Telegram Star transactions for the specified owner.
  ///
  /// * [ownerId]: Identifier of the owner of the Telegram Stars; can be the identifier of the current user, identifier of an owned bot,. or identifier of a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true.
  /// * [subscriptionId]: If non-empty, only transactions related to the Star Subscription will be returned.
  /// * [direction]: Direction of the transactions to receive; pass null to get all transactions *(optional)*.
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of transactions to return.
  ///
  /// [StarTransactions] is returned on completion.
  const GetStarTransactions({
    required this.ownerId,
    required this.subscriptionId,
    this.direction,
    required this.offset,
    required this.limit,
  });

  /// Identifier of the owner of the Telegram Stars; can be the identifier of the current user, identifier of an owned bot,. or identifier of a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
  final MessageSender ownerId;

  /// If non-empty, only transactions related to the Star Subscription will be returned
  final String subscriptionId;

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
      "owner_id": ownerId.toJson(),
      "subscription_id": subscriptionId,
      "direction": direction?.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the owner of the Telegram Stars; can be the identifier of the current user, identifier of an owned bot,. or identifier of a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
  /// * [subscription_id]: If non-empty, only transactions related to the Star Subscription will be returned
  /// * [direction]: Direction of the transactions to receive; pass null to get all transactions
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of transactions to return
  GetStarTransactions copyWith({
    MessageSender? ownerId,
    String? subscriptionId,
    TransactionDirection? direction,
    String? offset,
    int? limit,
  }) =>
      GetStarTransactions(
        ownerId: ownerId ?? this.ownerId,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        direction: direction ?? this.direction,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
