part of '../tdapi.dart';

/// **SentGift** *(sentGift)* - parent
///
/// Represents content of a gift received by a user or a channel chat.
sealed class SentGift extends TdObject {
  /// **SentGift** *(sentGift)* - parent
  ///
  /// Represents content of a gift received by a user or a channel chat.
  const SentGift();

  /// a SentGift return type can be :
  /// * [SentGiftRegular]
  /// * [SentGiftUpgraded]
  factory SentGift.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SentGiftRegular.defaultObjectId:
        return SentGiftRegular.fromJson(json);
      case SentGiftUpgraded.defaultObjectId:
        return SentGiftUpgraded.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SentGift)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SentGift copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'sentGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SentGiftRegular** *(sentGiftRegular)* - child of SentGift
///
/// Regular gift.
///
/// * [gift]: The gift.
final class SentGiftRegular extends SentGift {
  /// **SentGiftRegular** *(sentGiftRegular)* - child of SentGift
  ///
  /// Regular gift.
  ///
  /// * [gift]: The gift.
  const SentGiftRegular({
    required this.gift,
  });

  /// The gift
  final Gift gift;

  /// Parse from a json
  factory SentGiftRegular.fromJson(Map<String, dynamic> json) =>
      SentGiftRegular(
        gift: Gift.fromJson(json['gift']),
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
  SentGiftRegular copyWith({
    Gift? gift,
  }) =>
      SentGiftRegular(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sentGiftRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SentGiftUpgraded** *(sentGiftUpgraded)* - child of SentGift
///
/// Upgraded gift.
///
/// * [gift]: The gift.
final class SentGiftUpgraded extends SentGift {
  /// **SentGiftUpgraded** *(sentGiftUpgraded)* - child of SentGift
  ///
  /// Upgraded gift.
  ///
  /// * [gift]: The gift.
  const SentGiftUpgraded({
    required this.gift,
  });

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory SentGiftUpgraded.fromJson(Map<String, dynamic> json) =>
      SentGiftUpgraded(
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
  SentGiftUpgraded copyWith({
    UpgradedGift? gift,
  }) =>
      SentGiftUpgraded(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sentGiftUpgraded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
