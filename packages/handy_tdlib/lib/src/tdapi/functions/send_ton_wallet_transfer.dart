part of '../tdapi.dart';

/// **SendTonWalletTransfer** *(sendTonWalletTransfer)* - TDLib function
///
/// Sends a cryptocurrency from the user's TON wallet; can be used only if getOption("can_use_ton_wallet").
///
/// * [userId]: Identifier of the user who will receive the transfer; pass 0 if unknown.
/// * [address]: Address in the TON blockchain of the transaction peer.
/// * [amount]: The amount of the sent cryptocurrency, in the smallest units of the cryptocurrency.
/// * [comment]: Comment added to the transaction.
/// * [isCommentEncrypted]: Pass true if the comment is encrypted and must be decrypted using the receiver's or sender's private key.
/// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
/// * [regularTransferData]: Serialized data for regular cryptocurrency transfer request. The minimum allowed transfer amount is getOption("ton_wallet_transfer_amount_min").
/// * [gaslessTransferData]: Serialized data for gasless cryptocurrency transfer request; pass an empty string to force a regular request.. The minimum allowed transfer amount for a gasless transfer is getOption("ton_wallet_gasless_transfer_amount_min").
///
/// [TonWalletTransferResult] is returned on completion.
final class SendTonWalletTransfer extends TdFunction {
  /// **SendTonWalletTransfer** *(sendTonWalletTransfer)* - TDLib function
  ///
  /// Sends a cryptocurrency from the user's TON wallet; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [userId]: Identifier of the user who will receive the transfer; pass 0 if unknown.
  /// * [address]: Address in the TON blockchain of the transaction peer.
  /// * [amount]: The amount of the sent cryptocurrency, in the smallest units of the cryptocurrency.
  /// * [comment]: Comment added to the transaction.
  /// * [isCommentEncrypted]: Pass true if the comment is encrypted and must be decrypted using the receiver's or sender's private key.
  /// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
  /// * [regularTransferData]: Serialized data for regular cryptocurrency transfer request. The minimum allowed transfer amount is getOption("ton_wallet_transfer_amount_min").
  /// * [gaslessTransferData]: Serialized data for gasless cryptocurrency transfer request; pass an empty string to force a regular request.. The minimum allowed transfer amount for a gasless transfer is getOption("ton_wallet_gasless_transfer_amount_min").
  ///
  /// [TonWalletTransferResult] is returned on completion.
  const SendTonWalletTransfer({
    required this.userId,
    required this.address,
    required this.amount,
    required this.comment,
    required this.isCommentEncrypted,
    required this.sendingId,
    required this.regularTransferData,
    required this.gaslessTransferData,
  });

  /// Identifier of the user who will receive the transfer; pass 0 if unknown
  final int userId;

  /// Address in the TON blockchain of the transaction peer
  final String address;

  /// The amount of the sent cryptocurrency, in the smallest units of the cryptocurrency
  final int amount;

  /// Comment added to the transaction
  final String comment;

  /// Pass true if the comment is encrypted and must be decrypted using the receiver's or sender's private key
  final bool isCommentEncrypted;

  /// Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  final int sendingId;

  /// Serialized data for regular cryptocurrency transfer request. The minimum allowed transfer amount is getOption("ton_wallet_transfer_amount_min")
  final String regularTransferData;

  /// Serialized data for gasless cryptocurrency transfer request; pass an empty string to force a regular request.. The minimum allowed transfer amount for a gasless transfer is getOption("ton_wallet_gasless_transfer_amount_min")
  final String gaslessTransferData;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "address": address,
      "amount": amount,
      "comment": comment,
      "is_comment_encrypted": isCommentEncrypted,
      "sending_id": sendingId,
      "regular_transfer_data": regularTransferData,
      "gasless_transfer_data": gaslessTransferData,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who will receive the transfer; pass 0 if unknown
  /// * [address]: Address in the TON blockchain of the transaction peer
  /// * [amount]: The amount of the sent cryptocurrency, in the smallest units of the cryptocurrency
  /// * [comment]: Comment added to the transaction
  /// * [is_comment_encrypted]: Pass true if the comment is encrypted and must be decrypted using the receiver's or sender's private key
  /// * [sending_id]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  /// * [regular_transfer_data]: Serialized data for regular cryptocurrency transfer request. The minimum allowed transfer amount is getOption("ton_wallet_transfer_amount_min")
  /// * [gasless_transfer_data]: Serialized data for gasless cryptocurrency transfer request; pass an empty string to force a regular request.. The minimum allowed transfer amount for a gasless transfer is getOption("ton_wallet_gasless_transfer_amount_min")
  SendTonWalletTransfer copyWith({
    int? userId,
    String? address,
    int? amount,
    String? comment,
    bool? isCommentEncrypted,
    int? sendingId,
    String? regularTransferData,
    String? gaslessTransferData,
  }) =>
      SendTonWalletTransfer(
        userId: userId ?? this.userId,
        address: address ?? this.address,
        amount: amount ?? this.amount,
        comment: comment ?? this.comment,
        isCommentEncrypted: isCommentEncrypted ?? this.isCommentEncrypted,
        sendingId: sendingId ?? this.sendingId,
        regularTransferData: regularTransferData ?? this.regularTransferData,
        gaslessTransferData: gaslessTransferData ?? this.gaslessTransferData,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendTonWalletTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
