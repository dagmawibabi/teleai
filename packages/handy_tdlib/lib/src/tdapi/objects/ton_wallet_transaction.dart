part of '../tdapi.dart';

/// **TonWalletTransaction** *(tonWalletTransaction)* - basic class
///
/// Represents a transaction with the TON wallet of the current user.
///
/// * [id]: Unique identifier of the transaction.
/// * [peerAddress]: Address in the TON blockchain of the transaction peer; may be empty if the transaction isn't a wallet transfer.
/// * [peerUserId]: Identifier of the other user who participated in the transaction; 0 if unknown.
/// * [peerDomain]: Identifier of the domain assigned to the peer address; may be empty if none.
/// * [date]: Point in time (Unix timestamp) when the transaction was completed.
/// * [feeAmount]: The fee amount paid for the transaction in TON Grams, in the smallest units of the cryptocurrency.
/// * [state]: State of the transaction.
/// * [type]: Type of the transaction.
final class TonWalletTransaction extends TdObject {
  /// **TonWalletTransaction** *(tonWalletTransaction)* - basic class
  ///
  /// Represents a transaction with the TON wallet of the current user.
  ///
  /// * [id]: Unique identifier of the transaction.
  /// * [peerAddress]: Address in the TON blockchain of the transaction peer; may be empty if the transaction isn't a wallet transfer.
  /// * [peerUserId]: Identifier of the other user who participated in the transaction; 0 if unknown.
  /// * [peerDomain]: Identifier of the domain assigned to the peer address; may be empty if none.
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed.
  /// * [feeAmount]: The fee amount paid for the transaction in TON Grams, in the smallest units of the cryptocurrency.
  /// * [state]: State of the transaction.
  /// * [type]: Type of the transaction.
  const TonWalletTransaction({
    required this.id,
    required this.peerAddress,
    required this.peerUserId,
    required this.peerDomain,
    required this.date,
    required this.feeAmount,
    required this.state,
    required this.type,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the transaction
  final String id;

  /// Address in the TON blockchain of the transaction peer; may be empty if the transaction isn't a wallet transfer
  final String peerAddress;

  /// Identifier of the other user who participated in the transaction; 0 if unknown
  final int peerUserId;

  /// Identifier of the domain assigned to the peer address; may be empty if none
  final String peerDomain;

  /// Point in time (Unix timestamp) when the transaction was completed
  final int date;

  /// The fee amount paid for the transaction in TON Grams, in the smallest units of the cryptocurrency
  final int feeAmount;

  /// State of the transaction
  final TonWalletTransactionState state;

  /// Type of the transaction
  final TonWalletTransactionType type;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletTransaction.fromJson(Map<String, dynamic> json) =>
      TonWalletTransaction(
        id: json['id'],
        peerAddress: json['peer_address'],
        peerUserId: json['peer_user_id'],
        peerDomain: json['peer_domain'],
        date: json['date'],
        feeAmount: json['fee_amount'],
        state: TonWalletTransactionState.fromJson(json['state']),
        type: TonWalletTransactionType.fromJson(json['type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "peer_address": peerAddress,
      "peer_user_id": peerUserId,
      "peer_domain": peerDomain,
      "date": date,
      "fee_amount": feeAmount,
      "state": state.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the transaction
  /// * [peer_address]: Address in the TON blockchain of the transaction peer; may be empty if the transaction isn't a wallet transfer
  /// * [peer_user_id]: Identifier of the other user who participated in the transaction; 0 if unknown
  /// * [peer_domain]: Identifier of the domain assigned to the peer address; may be empty if none
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed
  /// * [fee_amount]: The fee amount paid for the transaction in TON Grams, in the smallest units of the cryptocurrency
  /// * [state]: State of the transaction
  /// * [type]: Type of the transaction
  TonWalletTransaction copyWith({
    String? id,
    String? peerAddress,
    int? peerUserId,
    String? peerDomain,
    int? date,
    int? feeAmount,
    TonWalletTransactionState? state,
    TonWalletTransactionType? type,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletTransaction(
        id: id ?? this.id,
        peerAddress: peerAddress ?? this.peerAddress,
        peerUserId: peerUserId ?? this.peerUserId,
        peerDomain: peerDomain ?? this.peerDomain,
        date: date ?? this.date,
        feeAmount: feeAmount ?? this.feeAmount,
        state: state ?? this.state,
        type: type ?? this.type,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
