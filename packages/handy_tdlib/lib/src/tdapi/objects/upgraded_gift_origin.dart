part of '../tdapi.dart';

/// **UpgradedGiftOrigin** *(upgradedGiftOrigin)* - parent
///
/// Describes origin from which the upgraded gift was obtained.
sealed class UpgradedGiftOrigin extends TdObject {
  /// **UpgradedGiftOrigin** *(upgradedGiftOrigin)* - parent
  ///
  /// Describes origin from which the upgraded gift was obtained.
  const UpgradedGiftOrigin();

  /// a UpgradedGiftOrigin return type can be :
  /// * [UpgradedGiftOriginUpgrade]
  /// * [UpgradedGiftOriginTransfer]
  /// * [UpgradedGiftOriginResale]
  /// * [UpgradedGiftOriginBlockchain]
  /// * [UpgradedGiftOriginPrepaidUpgrade]
  /// * [UpgradedGiftOriginOffer]
  /// * [UpgradedGiftOriginCraft]
  factory UpgradedGiftOrigin.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UpgradedGiftOriginUpgrade.defaultObjectId:
        return UpgradedGiftOriginUpgrade.fromJson(json);
      case UpgradedGiftOriginTransfer.defaultObjectId:
        return UpgradedGiftOriginTransfer.fromJson(json);
      case UpgradedGiftOriginResale.defaultObjectId:
        return UpgradedGiftOriginResale.fromJson(json);
      case UpgradedGiftOriginBlockchain.defaultObjectId:
        return UpgradedGiftOriginBlockchain.fromJson(json);
      case UpgradedGiftOriginPrepaidUpgrade.defaultObjectId:
        return UpgradedGiftOriginPrepaidUpgrade.fromJson(json);
      case UpgradedGiftOriginOffer.defaultObjectId:
        return UpgradedGiftOriginOffer.fromJson(json);
      case UpgradedGiftOriginCraft.defaultObjectId:
        return UpgradedGiftOriginCraft.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UpgradedGiftOrigin)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UpgradedGiftOrigin copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOrigin';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginUpgrade** *(upgradedGiftOriginUpgrade)* - child of UpgradedGiftOrigin
///
/// The gift was obtained by upgrading of a previously received gift.
///
/// * [giftMessageId]: Identifier of the message with the regular gift that was upgraded; may be 0 or an identifier of a deleted message.
final class UpgradedGiftOriginUpgrade extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginUpgrade** *(upgradedGiftOriginUpgrade)* - child of UpgradedGiftOrigin
  ///
  /// The gift was obtained by upgrading of a previously received gift.
  ///
  /// * [giftMessageId]: Identifier of the message with the regular gift that was upgraded; may be 0 or an identifier of a deleted message.
  const UpgradedGiftOriginUpgrade({
    required this.giftMessageId,
  });

  /// Identifier of the message with the regular gift that was upgraded; may be 0 or an identifier of a deleted message
  final int giftMessageId;

  /// Parse from a json
  factory UpgradedGiftOriginUpgrade.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftOriginUpgrade(
        giftMessageId: json['gift_message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift_message_id": giftMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_message_id]: Identifier of the message with the regular gift that was upgraded; may be 0 or an identifier of a deleted message
  @override
  UpgradedGiftOriginUpgrade copyWith({
    int? giftMessageId,
  }) =>
      UpgradedGiftOriginUpgrade(
        giftMessageId: giftMessageId ?? this.giftMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginUpgrade';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginTransfer** *(upgradedGiftOriginTransfer)* - child of UpgradedGiftOrigin
///
/// The gift was transferred from another owner.
final class UpgradedGiftOriginTransfer extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginTransfer** *(upgradedGiftOriginTransfer)* - child of UpgradedGiftOrigin
  ///
  /// The gift was transferred from another owner.
  const UpgradedGiftOriginTransfer();

  /// Parse from a json
  factory UpgradedGiftOriginTransfer.fromJson(Map<String, dynamic> json) =>
      const UpgradedGiftOriginTransfer();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftOriginTransfer copyWith() => const UpgradedGiftOriginTransfer();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginResale** *(upgradedGiftOriginResale)* - child of UpgradedGiftOrigin
///
/// The gift was bought from another user.
///
/// * [price]: Price paid for the gift.
final class UpgradedGiftOriginResale extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginResale** *(upgradedGiftOriginResale)* - child of UpgradedGiftOrigin
  ///
  /// The gift was bought from another user.
  ///
  /// * [price]: Price paid for the gift.
  const UpgradedGiftOriginResale({
    required this.price,
  });

  /// Price paid for the gift
  final GiftResalePrice price;

  /// Parse from a json
  factory UpgradedGiftOriginResale.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftOriginResale(
        price: GiftResalePrice.fromJson(json['price']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: Price paid for the gift
  @override
  UpgradedGiftOriginResale copyWith({
    GiftResalePrice? price,
  }) =>
      UpgradedGiftOriginResale(
        price: price ?? this.price,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginResale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginBlockchain** *(upgradedGiftOriginBlockchain)* - child of UpgradedGiftOrigin
///
/// The gift was assigned from blockchain and isn't owned by the current user. The gift can't be transferred, resold, or withdrawn to blockchain.
final class UpgradedGiftOriginBlockchain extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginBlockchain** *(upgradedGiftOriginBlockchain)* - child of UpgradedGiftOrigin
  ///
  /// The gift was assigned from blockchain and isn't owned by the current user. The gift can't be transferred, resold, or withdrawn to blockchain.
  const UpgradedGiftOriginBlockchain();

  /// Parse from a json
  factory UpgradedGiftOriginBlockchain.fromJson(Map<String, dynamic> json) =>
      const UpgradedGiftOriginBlockchain();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftOriginBlockchain copyWith() =>
      const UpgradedGiftOriginBlockchain();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginBlockchain';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginPrepaidUpgrade** *(upgradedGiftOriginPrepaidUpgrade)* - child of UpgradedGiftOrigin
///
/// The sender or receiver of the message has paid for upgrade of the gift, which has been completed.
final class UpgradedGiftOriginPrepaidUpgrade extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginPrepaidUpgrade** *(upgradedGiftOriginPrepaidUpgrade)* - child of UpgradedGiftOrigin
  ///
  /// The sender or receiver of the message has paid for upgrade of the gift, which has been completed.
  const UpgradedGiftOriginPrepaidUpgrade();

  /// Parse from a json
  factory UpgradedGiftOriginPrepaidUpgrade.fromJson(
          Map<String, dynamic> json) =>
      const UpgradedGiftOriginPrepaidUpgrade();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftOriginPrepaidUpgrade copyWith() =>
      const UpgradedGiftOriginPrepaidUpgrade();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginPrepaidUpgrade';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginOffer** *(upgradedGiftOriginOffer)* - child of UpgradedGiftOrigin
///
/// The gift was bought through an offer.
///
/// * [price]: Price paid for the gift.
final class UpgradedGiftOriginOffer extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginOffer** *(upgradedGiftOriginOffer)* - child of UpgradedGiftOrigin
  ///
  /// The gift was bought through an offer.
  ///
  /// * [price]: Price paid for the gift.
  const UpgradedGiftOriginOffer({
    required this.price,
  });

  /// Price paid for the gift
  final GiftResalePrice price;

  /// Parse from a json
  factory UpgradedGiftOriginOffer.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftOriginOffer(
        price: GiftResalePrice.fromJson(json['price']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: Price paid for the gift
  @override
  UpgradedGiftOriginOffer copyWith({
    GiftResalePrice? price,
  }) =>
      UpgradedGiftOriginOffer(
        price: price ?? this.price,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftOriginCraft** *(upgradedGiftOriginCraft)* - child of UpgradedGiftOrigin
///
/// The gift was crafted from other gifts.
final class UpgradedGiftOriginCraft extends UpgradedGiftOrigin {
  /// **UpgradedGiftOriginCraft** *(upgradedGiftOriginCraft)* - child of UpgradedGiftOrigin
  ///
  /// The gift was crafted from other gifts.
  const UpgradedGiftOriginCraft();

  /// Parse from a json
  factory UpgradedGiftOriginCraft.fromJson(Map<String, dynamic> json) =>
      const UpgradedGiftOriginCraft();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftOriginCraft copyWith() => const UpgradedGiftOriginCraft();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginCraft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
