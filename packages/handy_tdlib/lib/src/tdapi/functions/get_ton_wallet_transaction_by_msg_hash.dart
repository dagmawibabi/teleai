part of '../tdapi.dart';

/// **GetTonWalletTransactionByMsgHash** *(getTonWalletTransactionByMsgHash)* - TDLib function
///
/// Returns a TON wallet transaction by its msg_hash; returns an error if the transaction isn't finalized yet.
///
/// * [msgHash]: Value of msg_hash of the transaction.
///
/// [TonWalletTransaction] is returned on completion.
final class GetTonWalletTransactionByMsgHash extends TdFunction {
  /// **GetTonWalletTransactionByMsgHash** *(getTonWalletTransactionByMsgHash)* - TDLib function
  ///
  /// Returns a TON wallet transaction by its msg_hash; returns an error if the transaction isn't finalized yet.
  ///
  /// * [msgHash]: Value of msg_hash of the transaction.
  ///
  /// [TonWalletTransaction] is returned on completion.
  const GetTonWalletTransactionByMsgHash({
    required this.msgHash,
  });

  /// Value of msg_hash of the transaction
  final String msgHash;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "msg_hash": msgHash,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [msg_hash]: Value of msg_hash of the transaction
  GetTonWalletTransactionByMsgHash copyWith({
    String? msgHash,
  }) =>
      GetTonWalletTransactionByMsgHash(
        msgHash: msgHash ?? this.msgHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletTransactionByMsgHash';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
