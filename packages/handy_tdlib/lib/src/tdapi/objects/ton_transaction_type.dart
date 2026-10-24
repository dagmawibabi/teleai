part of '../tdapi.dart';

/// **TonTransactionType** *(tonTransactionType)* - parent
///
/// Describes type of transaction with TON Grams.
sealed class TonTransactionType extends TdObject {
  /// **TonTransactionType** *(tonTransactionType)* - parent
  ///
  /// Describes type of transaction with TON Grams.
  const TonTransactionType();

  /// a TonTransactionType return type can be :
  /// * [TonTransactionTypeFragmentDeposit]
  /// * [TonTransactionTypeFragmentWithdrawal]
  /// * [TonTransactionTypeSuggestedPostPayment]
  /// * [TonTransactionTypeGiftPurchaseOffer]
  /// * [TonTransactionTypeUpgradedGiftPurchase]
  /// * [TonTransactionTypeUpgradedGiftSale]
  /// * [TonTransactionTypeStakeDiceStake]
  /// * [TonTransactionTypeStakeDicePayout]
  /// * [TonTransactionTypeUnsupported]
  factory TonTransactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonTransactionTypeFragmentDeposit.defaultObjectId:
        return TonTransactionTypeFragmentDeposit.fromJson(json);
      case TonTransactionTypeFragmentWithdrawal.defaultObjectId:
        return TonTransactionTypeFragmentWithdrawal.fromJson(json);
      case TonTransactionTypeSuggestedPostPayment.defaultObjectId:
        return TonTransactionTypeSuggestedPostPayment.fromJson(json);
      case TonTransactionTypeGiftPurchaseOffer.defaultObjectId:
        return TonTransactionTypeGiftPurchaseOffer.fromJson(json);
      case TonTransactionTypeUpgradedGiftPurchase.defaultObjectId:
        return TonTransactionTypeUpgradedGiftPurchase.fromJson(json);
      case TonTransactionTypeUpgradedGiftSale.defaultObjectId:
        return TonTransactionTypeUpgradedGiftSale.fromJson(json);
      case TonTransactionTypeStakeDiceStake.defaultObjectId:
        return TonTransactionTypeStakeDiceStake.fromJson(json);
      case TonTransactionTypeStakeDicePayout.defaultObjectId:
        return TonTransactionTypeStakeDicePayout.fromJson(json);
      case TonTransactionTypeUnsupported.defaultObjectId:
        return TonTransactionTypeUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonTransactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonTransactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeFragmentDeposit** *(tonTransactionTypeFragmentDeposit)* - child of TonTransactionType
///
/// The transaction is a deposit of Grams from Fragment.
///
/// * [isGift]: True, if the transaction is a gift from another user.
/// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown *(optional)*.
final class TonTransactionTypeFragmentDeposit extends TonTransactionType {
  /// **TonTransactionTypeFragmentDeposit** *(tonTransactionTypeFragmentDeposit)* - child of TonTransactionType
  ///
  /// The transaction is a deposit of Grams from Fragment.
  ///
  /// * [isGift]: True, if the transaction is a gift from another user.
  /// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown *(optional)*.
  const TonTransactionTypeFragmentDeposit({
    required this.isGift,
    this.sticker,
  });

  /// True, if the transaction is a gift from another user
  final bool isGift;

  /// The sticker to be shown in the transaction information; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory TonTransactionTypeFragmentDeposit.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeFragmentDeposit(
        isGift: json['is_gift'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_gift": isGift,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_gift]: True, if the transaction is a gift from another user
  /// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown
  @override
  TonTransactionTypeFragmentDeposit copyWith({
    bool? isGift,
    Sticker? sticker,
  }) =>
      TonTransactionTypeFragmentDeposit(
        isGift: isGift ?? this.isGift,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeFragmentDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeFragmentWithdrawal** *(tonTransactionTypeFragmentWithdrawal)* - child of TonTransactionType
///
/// The transaction is a withdrawal of earned Grams to Fragment.
///
/// * [withdrawalState]: State of the withdrawal; may be null for refunds from Fragment *(optional)*.
final class TonTransactionTypeFragmentWithdrawal extends TonTransactionType {
  /// **TonTransactionTypeFragmentWithdrawal** *(tonTransactionTypeFragmentWithdrawal)* - child of TonTransactionType
  ///
  /// The transaction is a withdrawal of earned Grams to Fragment.
  ///
  /// * [withdrawalState]: State of the withdrawal; may be null for refunds from Fragment *(optional)*.
  const TonTransactionTypeFragmentWithdrawal({
    this.withdrawalState,
  });

  /// State of the withdrawal; may be null for refunds from Fragment
  final RevenueWithdrawalState? withdrawalState;

  /// Parse from a json
  factory TonTransactionTypeFragmentWithdrawal.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeFragmentWithdrawal(
        withdrawalState: json['withdrawal_state'] == null
            ? null
            : RevenueWithdrawalState.fromJson(json['withdrawal_state']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "withdrawal_state": withdrawalState?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [withdrawal_state]: State of the withdrawal; may be null for refunds from Fragment
  @override
  TonTransactionTypeFragmentWithdrawal copyWith({
    RevenueWithdrawalState? withdrawalState,
  }) =>
      TonTransactionTypeFragmentWithdrawal(
        withdrawalState: withdrawalState ?? this.withdrawalState,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeFragmentWithdrawal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeSuggestedPostPayment** *(tonTransactionTypeSuggestedPostPayment)* - child of TonTransactionType
///
/// The transaction is a payment for a suggested post.
///
/// * [chatId]: Identifier of the channel chat that posted the post.
final class TonTransactionTypeSuggestedPostPayment extends TonTransactionType {
  /// **TonTransactionTypeSuggestedPostPayment** *(tonTransactionTypeSuggestedPostPayment)* - child of TonTransactionType
  ///
  /// The transaction is a payment for a suggested post.
  ///
  /// * [chatId]: Identifier of the channel chat that posted the post.
  const TonTransactionTypeSuggestedPostPayment({
    required this.chatId,
  });

  /// Identifier of the channel chat that posted the post
  final int chatId;

  /// Parse from a json
  factory TonTransactionTypeSuggestedPostPayment.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeSuggestedPostPayment(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat that posted the post
  @override
  TonTransactionTypeSuggestedPostPayment copyWith({
    int? chatId,
  }) =>
      TonTransactionTypeSuggestedPostPayment(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'tonTransactionTypeSuggestedPostPayment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeGiftPurchaseOffer** *(tonTransactionTypeGiftPurchaseOffer)* - child of TonTransactionType
///
/// The transaction is an offer of gift purchase.
///
/// * [gift]: The gift.
final class TonTransactionTypeGiftPurchaseOffer extends TonTransactionType {
  /// **TonTransactionTypeGiftPurchaseOffer** *(tonTransactionTypeGiftPurchaseOffer)* - child of TonTransactionType
  ///
  /// The transaction is an offer of gift purchase.
  ///
  /// * [gift]: The gift.
  const TonTransactionTypeGiftPurchaseOffer({
    required this.gift,
  });

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory TonTransactionTypeGiftPurchaseOffer.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeGiftPurchaseOffer(
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  @override
  TonTransactionTypeGiftPurchaseOffer copyWith({
    UpgradedGift? gift,
  }) =>
      TonTransactionTypeGiftPurchaseOffer(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeGiftPurchaseOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeUpgradedGiftPurchase** *(tonTransactionTypeUpgradedGiftPurchase)* - child of TonTransactionType
///
/// The transaction is a purchase of an upgraded gift for some user or channel.
///
/// * [userId]: Identifier of the user who sold the gift.
/// * [gift]: The gift.
final class TonTransactionTypeUpgradedGiftPurchase extends TonTransactionType {
  /// **TonTransactionTypeUpgradedGiftPurchase** *(tonTransactionTypeUpgradedGiftPurchase)* - child of TonTransactionType
  ///
  /// The transaction is a purchase of an upgraded gift for some user or channel.
  ///
  /// * [userId]: Identifier of the user who sold the gift.
  /// * [gift]: The gift.
  const TonTransactionTypeUpgradedGiftPurchase({
    required this.userId,
    required this.gift,
  });

  /// Identifier of the user who sold the gift
  final int userId;

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory TonTransactionTypeUpgradedGiftPurchase.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeUpgradedGiftPurchase(
        userId: json['user_id'],
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who sold the gift
  /// * [gift]: The gift
  @override
  TonTransactionTypeUpgradedGiftPurchase copyWith({
    int? userId,
    UpgradedGift? gift,
  }) =>
      TonTransactionTypeUpgradedGiftPurchase(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'tonTransactionTypeUpgradedGiftPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeUpgradedGiftSale** *(tonTransactionTypeUpgradedGiftSale)* - child of TonTransactionType
///
/// The transaction is a sale of an upgraded gift.
///
/// * [userId]: Identifier of the user who bought the gift.
/// * [gift]: The gift.
/// * [commissionPerMille]: The number of Grams received by the Telegram for each 1000 Grams received by the seller of the gift.
/// * [commissionGramAmount]: The Gram amount that was received by the Telegram; in the smallest units of the currency.
/// * [viaOffer]: True, if the gift was sold through a purchase offer.
final class TonTransactionTypeUpgradedGiftSale extends TonTransactionType {
  /// **TonTransactionTypeUpgradedGiftSale** *(tonTransactionTypeUpgradedGiftSale)* - child of TonTransactionType
  ///
  /// The transaction is a sale of an upgraded gift.
  ///
  /// * [userId]: Identifier of the user who bought the gift.
  /// * [gift]: The gift.
  /// * [commissionPerMille]: The number of Grams received by the Telegram for each 1000 Grams received by the seller of the gift.
  /// * [commissionGramAmount]: The Gram amount that was received by the Telegram; in the smallest units of the currency.
  /// * [viaOffer]: True, if the gift was sold through a purchase offer.
  const TonTransactionTypeUpgradedGiftSale({
    required this.userId,
    required this.gift,
    required this.commissionPerMille,
    required this.commissionGramAmount,
    required this.viaOffer,
  });

  /// Identifier of the user who bought the gift
  final int userId;

  /// The gift
  final UpgradedGift gift;

  /// The number of Grams received by the Telegram for each 1000 Grams received by the seller of the gift
  final int commissionPerMille;

  /// The Gram amount that was received by the Telegram; in the smallest units of the currency
  final int commissionGramAmount;

  /// True, if the gift was sold through a purchase offer
  final bool viaOffer;

  /// Parse from a json
  factory TonTransactionTypeUpgradedGiftSale.fromJson(
          Map<String, dynamic> json) =>
      TonTransactionTypeUpgradedGiftSale(
        userId: json['user_id'],
        gift: UpgradedGift.fromJson(json['gift']),
        commissionPerMille: json['commission_per_mille'],
        commissionGramAmount: json['commission_gram_amount'],
        viaOffer: json['via_offer'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
      "commission_per_mille": commissionPerMille,
      "commission_gram_amount": commissionGramAmount,
      "via_offer": viaOffer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the gift
  /// * [gift]: The gift
  /// * [commission_per_mille]: The number of Grams received by the Telegram for each 1000 Grams received by the seller of the gift
  /// * [commission_gram_amount]: The Gram amount that was received by the Telegram; in the smallest units of the currency
  /// * [via_offer]: True, if the gift was sold through a purchase offer
  @override
  TonTransactionTypeUpgradedGiftSale copyWith({
    int? userId,
    UpgradedGift? gift,
    int? commissionPerMille,
    int? commissionGramAmount,
    bool? viaOffer,
  }) =>
      TonTransactionTypeUpgradedGiftSale(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        commissionGramAmount: commissionGramAmount ?? this.commissionGramAmount,
        viaOffer: viaOffer ?? this.viaOffer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeUpgradedGiftSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeStakeDiceStake** *(tonTransactionTypeStakeDiceStake)* - child of TonTransactionType
///
/// The transaction is a payment for stake dice throw.
final class TonTransactionTypeStakeDiceStake extends TonTransactionType {
  /// **TonTransactionTypeStakeDiceStake** *(tonTransactionTypeStakeDiceStake)* - child of TonTransactionType
  ///
  /// The transaction is a payment for stake dice throw.
  const TonTransactionTypeStakeDiceStake();

  /// Parse from a json
  factory TonTransactionTypeStakeDiceStake.fromJson(
          Map<String, dynamic> json) =>
      const TonTransactionTypeStakeDiceStake();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonTransactionTypeStakeDiceStake copyWith() =>
      const TonTransactionTypeStakeDiceStake();

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeStakeDiceStake';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeStakeDicePayout** *(tonTransactionTypeStakeDicePayout)* - child of TonTransactionType
///
/// The transaction is a payment for successful stake dice throw.
final class TonTransactionTypeStakeDicePayout extends TonTransactionType {
  /// **TonTransactionTypeStakeDicePayout** *(tonTransactionTypeStakeDicePayout)* - child of TonTransactionType
  ///
  /// The transaction is a payment for successful stake dice throw.
  const TonTransactionTypeStakeDicePayout();

  /// Parse from a json
  factory TonTransactionTypeStakeDicePayout.fromJson(
          Map<String, dynamic> json) =>
      const TonTransactionTypeStakeDicePayout();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonTransactionTypeStakeDicePayout copyWith() =>
      const TonTransactionTypeStakeDicePayout();

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeStakeDicePayout';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonTransactionTypeUnsupported** *(tonTransactionTypeUnsupported)* - child of TonTransactionType
///
/// The transaction is a transaction of an unsupported type.
final class TonTransactionTypeUnsupported extends TonTransactionType {
  /// **TonTransactionTypeUnsupported** *(tonTransactionTypeUnsupported)* - child of TonTransactionType
  ///
  /// The transaction is a transaction of an unsupported type.
  const TonTransactionTypeUnsupported();

  /// Parse from a json
  factory TonTransactionTypeUnsupported.fromJson(Map<String, dynamic> json) =>
      const TonTransactionTypeUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonTransactionTypeUnsupported copyWith() =>
      const TonTransactionTypeUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactionTypeUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
