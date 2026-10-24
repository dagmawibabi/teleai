part of '../tdapi.dart';

/// **TonWalletTransactionType** *(tonWalletTransactionType)* - parent
///
/// Describes type of transaction with a TON wallet.
sealed class TonWalletTransactionType extends TdObject {
  /// **TonWalletTransactionType** *(tonWalletTransactionType)* - parent
  ///
  /// Describes type of transaction with a TON wallet.
  const TonWalletTransactionType();

  /// a TonWalletTransactionType return type can be :
  /// * [TonWalletTransactionTypeOnRampDeposit]
  /// * [TonWalletTransactionTypeTransfer]
  /// * [TonWalletTransactionTypeNftTransfer]
  /// * [TonWalletTransactionTypeTelegramGiftTransfer]
  /// * [TonWalletTransactionTypeKeyChange]
  factory TonWalletTransactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonWalletTransactionTypeOnRampDeposit.defaultObjectId:
        return TonWalletTransactionTypeOnRampDeposit.fromJson(json);
      case TonWalletTransactionTypeTransfer.defaultObjectId:
        return TonWalletTransactionTypeTransfer.fromJson(json);
      case TonWalletTransactionTypeNftTransfer.defaultObjectId:
        return TonWalletTransactionTypeNftTransfer.fromJson(json);
      case TonWalletTransactionTypeTelegramGiftTransfer.defaultObjectId:
        return TonWalletTransactionTypeTelegramGiftTransfer.fromJson(json);
      case TonWalletTransactionTypeKeyChange.defaultObjectId:
        return TonWalletTransactionTypeKeyChange.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonWalletTransactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonWalletTransactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionTypeOnRampDeposit** *(tonWalletTransactionTypeOnRampDeposit)* - child of TonWalletTransactionType
///
/// The transaction is a deposit from an on-ramp provider.
///
/// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency.
/// * [providerName]: Name of the on-ramp provider.
final class TonWalletTransactionTypeOnRampDeposit
    extends TonWalletTransactionType {
  /// **TonWalletTransactionTypeOnRampDeposit** *(tonWalletTransactionTypeOnRampDeposit)* - child of TonWalletTransactionType
  ///
  /// The transaction is a deposit from an on-ramp provider.
  ///
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency.
  /// * [providerName]: Name of the on-ramp provider.
  const TonWalletTransactionTypeOnRampDeposit({
    required this.amount,
    required this.providerName,
  });

  /// The amount of received cryptocurrency, in the smallest units of the cryptocurrency
  final int amount;

  /// Name of the on-ramp provider
  final String providerName;

  /// Parse from a json
  factory TonWalletTransactionTypeOnRampDeposit.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransactionTypeOnRampDeposit(
        amount: json['amount'],
        providerName: json['provider_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "amount": amount,
      "provider_name": providerName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency
  /// * [provider_name]: Name of the on-ramp provider
  @override
  TonWalletTransactionTypeOnRampDeposit copyWith({
    int? amount,
    String? providerName,
  }) =>
      TonWalletTransactionTypeOnRampDeposit(
        amount: amount ?? this.amount,
        providerName: providerName ?? this.providerName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionTypeOnRampDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionTypeTransfer** *(tonWalletTransactionTypeTransfer)* - child of TonWalletTransactionType
///
/// A transfer of TON Grams to or from the wallet.
///
/// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions.
/// * [isGasless]: True, if the fee was paid by Telegram.
/// * [comment]: Comment added to the transaction.
/// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the user's private key.
final class TonWalletTransactionTypeTransfer extends TonWalletTransactionType {
  /// **TonWalletTransactionTypeTransfer** *(tonWalletTransactionTypeTransfer)* - child of TonWalletTransactionType
  ///
  /// A transfer of TON Grams to or from the wallet.
  ///
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions.
  /// * [isGasless]: True, if the fee was paid by Telegram.
  /// * [comment]: Comment added to the transaction.
  /// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the user's private key.
  const TonWalletTransactionTypeTransfer({
    required this.amount,
    required this.isGasless,
    required this.comment,
    required this.isCommentEncrypted,
  });

  /// The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions
  final int amount;

  /// True, if the fee was paid by Telegram
  final bool isGasless;

  /// Comment added to the transaction
  final String comment;

  /// True, if the comment is encrypted and must be decrypted using the user's private key
  final bool isCommentEncrypted;

  /// Parse from a json
  factory TonWalletTransactionTypeTransfer.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransactionTypeTransfer(
        amount: json['amount'],
        isGasless: json['is_gasless'],
        comment: json['comment'],
        isCommentEncrypted: json['is_comment_encrypted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "amount": amount,
      "is_gasless": isGasless,
      "comment": comment,
      "is_comment_encrypted": isCommentEncrypted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions
  /// * [is_gasless]: True, if the fee was paid by Telegram
  /// * [comment]: Comment added to the transaction
  /// * [is_comment_encrypted]: True, if the comment is encrypted and must be decrypted using the user's private key
  @override
  TonWalletTransactionTypeTransfer copyWith({
    int? amount,
    bool? isGasless,
    String? comment,
    bool? isCommentEncrypted,
  }) =>
      TonWalletTransactionTypeTransfer(
        amount: amount ?? this.amount,
        isGasless: isGasless ?? this.isGasless,
        comment: comment ?? this.comment,
        isCommentEncrypted: isCommentEncrypted ?? this.isCommentEncrypted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionTypeTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionTypeNftTransfer** *(tonWalletTransactionTypeNftTransfer)* - child of TonWalletTransactionType
///
/// A transfer of a TON NFT to or from the wallet.
///
/// * [nft]: The transferred NFT.
/// * [isOutgoing]: True, if the transfer is outgoing.
/// * [comment]: Comment added to the transaction.
/// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the user's private key.
final class TonWalletTransactionTypeNftTransfer
    extends TonWalletTransactionType {
  /// **TonWalletTransactionTypeNftTransfer** *(tonWalletTransactionTypeNftTransfer)* - child of TonWalletTransactionType
  ///
  /// A transfer of a TON NFT to or from the wallet.
  ///
  /// * [nft]: The transferred NFT.
  /// * [isOutgoing]: True, if the transfer is outgoing.
  /// * [comment]: Comment added to the transaction.
  /// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the user's private key.
  const TonWalletTransactionTypeNftTransfer({
    required this.nft,
    required this.isOutgoing,
    required this.comment,
    required this.isCommentEncrypted,
  });

  /// The transferred NFT
  final TonNft nft;

  /// True, if the transfer is outgoing
  final bool isOutgoing;

  /// Comment added to the transaction
  final String comment;

  /// True, if the comment is encrypted and must be decrypted using the user's private key
  final bool isCommentEncrypted;

  /// Parse from a json
  factory TonWalletTransactionTypeNftTransfer.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransactionTypeNftTransfer(
        nft: TonNft.fromJson(json['nft']),
        isOutgoing: json['is_outgoing'],
        comment: json['comment'],
        isCommentEncrypted: json['is_comment_encrypted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nft": nft.toJson(),
      "is_outgoing": isOutgoing,
      "comment": comment,
      "is_comment_encrypted": isCommentEncrypted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nft]: The transferred NFT
  /// * [is_outgoing]: True, if the transfer is outgoing
  /// * [comment]: Comment added to the transaction
  /// * [is_comment_encrypted]: True, if the comment is encrypted and must be decrypted using the user's private key
  @override
  TonWalletTransactionTypeNftTransfer copyWith({
    TonNft? nft,
    bool? isOutgoing,
    String? comment,
    bool? isCommentEncrypted,
  }) =>
      TonWalletTransactionTypeNftTransfer(
        nft: nft ?? this.nft,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        comment: comment ?? this.comment,
        isCommentEncrypted: isCommentEncrypted ?? this.isCommentEncrypted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionTypeNftTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionTypeTelegramGiftTransfer** *(tonWalletTransactionTypeTelegramGiftTransfer)* - child of TonWalletTransactionType
///
/// A Telegram gift was minted as a TON NFT or was transferred from Telegram to the wallet or back; peer details aren't available for the transaction.
///
/// * [nft]: The minted or transferred NFT.
/// * [isOutgoing]: True, if the transfer is from the wallet to Telegram.
/// * [isSaved]: True, if the gift was displayed on the current user's profile page before or after the transfer.
final class TonWalletTransactionTypeTelegramGiftTransfer
    extends TonWalletTransactionType {
  /// **TonWalletTransactionTypeTelegramGiftTransfer** *(tonWalletTransactionTypeTelegramGiftTransfer)* - child of TonWalletTransactionType
  ///
  /// A Telegram gift was minted as a TON NFT or was transferred from Telegram to the wallet or back; peer details aren't available for the transaction.
  ///
  /// * [nft]: The minted or transferred NFT.
  /// * [isOutgoing]: True, if the transfer is from the wallet to Telegram.
  /// * [isSaved]: True, if the gift was displayed on the current user's profile page before or after the transfer.
  const TonWalletTransactionTypeTelegramGiftTransfer({
    required this.nft,
    required this.isOutgoing,
    required this.isSaved,
  });

  /// The minted or transferred NFT
  final TonNft nft;

  /// True, if the transfer is from the wallet to Telegram
  final bool isOutgoing;

  /// True, if the gift was displayed on the current user's profile page before or after the transfer
  final bool isSaved;

  /// Parse from a json
  factory TonWalletTransactionTypeTelegramGiftTransfer.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransactionTypeTelegramGiftTransfer(
        nft: TonNft.fromJson(json['nft']),
        isOutgoing: json['is_outgoing'],
        isSaved: json['is_saved'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nft": nft.toJson(),
      "is_outgoing": isOutgoing,
      "is_saved": isSaved,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nft]: The minted or transferred NFT
  /// * [is_outgoing]: True, if the transfer is from the wallet to Telegram
  /// * [is_saved]: True, if the gift was displayed on the current user's profile page before or after the transfer
  @override
  TonWalletTransactionTypeTelegramGiftTransfer copyWith({
    TonNft? nft,
    bool? isOutgoing,
    bool? isSaved,
  }) =>
      TonWalletTransactionTypeTelegramGiftTransfer(
        nft: nft ?? this.nft,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        isSaved: isSaved ?? this.isSaved,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'tonWalletTransactionTypeTelegramGiftTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionTypeKeyChange** *(tonWalletTransactionTypeKeyChange)* - child of TonWalletTransactionType
///
/// Change of the wallet key.
final class TonWalletTransactionTypeKeyChange extends TonWalletTransactionType {
  /// **TonWalletTransactionTypeKeyChange** *(tonWalletTransactionTypeKeyChange)* - child of TonWalletTransactionType
  ///
  /// Change of the wallet key.
  const TonWalletTransactionTypeKeyChange();

  /// Parse from a json
  factory TonWalletTransactionTypeKeyChange.fromJson(
          Map<String, dynamic> json) =>
      const TonWalletTransactionTypeKeyChange();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonWalletTransactionTypeKeyChange copyWith() =>
      const TonWalletTransactionTypeKeyChange();

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionTypeKeyChange';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
