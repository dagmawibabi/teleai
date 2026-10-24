part of '../tdapi.dart';

/// **TonWalletTransferResult** *(tonWalletTransferResult)* - basic class
///
/// Represents result of cryptocurrency transfer from the current user's TON wallet.
///
/// * [isGasless]: True, if the transfer is gasless.
/// * [msgHash]: Unique identifier of the sent message; use getTonWalletTransactionByMsgHash to poll information about the transaction.
/// * [transaction]: The completed transaction; may be null if the transaction is still pending *(optional)*.
final class TonWalletTransferResult extends TdObject {
  /// **TonWalletTransferResult** *(tonWalletTransferResult)* - basic class
  ///
  /// Represents result of cryptocurrency transfer from the current user's TON wallet.
  ///
  /// * [isGasless]: True, if the transfer is gasless.
  /// * [msgHash]: Unique identifier of the sent message; use getTonWalletTransactionByMsgHash to poll information about the transaction.
  /// * [transaction]: The completed transaction; may be null if the transaction is still pending *(optional)*.
  const TonWalletTransferResult({
    required this.isGasless,
    required this.msgHash,
    this.transaction,
    this.extra,
    this.clientId,
  });

  /// True, if the transfer is gasless
  final bool isGasless;

  /// Unique identifier of the sent message; use getTonWalletTransactionByMsgHash to poll information about the transaction
  final String msgHash;

  /// The completed transaction; may be null if the transaction is still pending
  final TonWalletTransaction? transaction;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletTransferResult.fromJson(Map<String, dynamic> json) =>
      TonWalletTransferResult(
        isGasless: json['is_gasless'],
        msgHash: json['msg_hash'],
        transaction: json['transaction'] == null
            ? null
            : TonWalletTransaction.fromJson(json['transaction']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_gasless": isGasless,
      "msg_hash": msgHash,
      "transaction": transaction?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_gasless]: True, if the transfer is gasless
  /// * [msg_hash]: Unique identifier of the sent message; use getTonWalletTransactionByMsgHash to poll information about the transaction
  /// * [transaction]: The completed transaction; may be null if the transaction is still pending
  TonWalletTransferResult copyWith({
    bool? isGasless,
    String? msgHash,
    TonWalletTransaction? transaction,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletTransferResult(
        isGasless: isGasless ?? this.isGasless,
        msgHash: msgHash ?? this.msgHash,
        transaction: transaction ?? this.transaction,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransferResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
