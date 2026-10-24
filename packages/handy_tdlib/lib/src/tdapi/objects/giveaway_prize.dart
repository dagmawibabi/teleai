part of '../tdapi.dart';

/// **GiveawayPrize** *(giveawayPrize)* - parent
///
/// Contains information about a giveaway prize.
sealed class GiveawayPrize extends TdObject {
  /// **GiveawayPrize** *(giveawayPrize)* - parent
  ///
  /// Contains information about a giveaway prize.
  const GiveawayPrize();

  /// a GiveawayPrize return type can be :
  /// * [GiveawayPrizePremium]
  /// * [GiveawayPrizeStars]
  factory GiveawayPrize.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiveawayPrizePremium.defaultObjectId:
        return GiveawayPrizePremium.fromJson(json);
      case GiveawayPrizeStars.defaultObjectId:
        return GiveawayPrizeStars.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiveawayPrize)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiveawayPrize copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giveawayPrize';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayPrizePremium** *(giveawayPrizePremium)* - child of GiveawayPrize
///
/// The giveaway sends Telegram Premium subscriptions to the winners.
///
/// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation.
final class GiveawayPrizePremium extends GiveawayPrize {
  /// **GiveawayPrizePremium** *(giveawayPrizePremium)* - child of GiveawayPrize
  ///
  /// The giveaway sends Telegram Premium subscriptions to the winners.
  ///
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation.
  const GiveawayPrizePremium({
    required this.monthCount,
  });

  /// Number of months the Telegram Premium subscription will be active after code activation
  final int monthCount;

  /// Parse from a json
  factory GiveawayPrizePremium.fromJson(Map<String, dynamic> json) =>
      GiveawayPrizePremium(
        monthCount: json['month_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "month_count": monthCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [month_count]: Number of months the Telegram Premium subscription will be active after code activation
  @override
  GiveawayPrizePremium copyWith({
    int? monthCount,
  }) =>
      GiveawayPrizePremium(
        monthCount: monthCount ?? this.monthCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giveawayPrizePremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayPrizeStars** *(giveawayPrizeStars)* - child of GiveawayPrize
///
/// The giveaway sends Telegram Stars to the winners.
///
/// * [starCount]: Number of Telegram Stars that will be shared by all winners.
final class GiveawayPrizeStars extends GiveawayPrize {
  /// **GiveawayPrizeStars** *(giveawayPrizeStars)* - child of GiveawayPrize
  ///
  /// The giveaway sends Telegram Stars to the winners.
  ///
  /// * [starCount]: Number of Telegram Stars that will be shared by all winners.
  const GiveawayPrizeStars({
    required this.starCount,
  });

  /// Number of Telegram Stars that will be shared by all winners
  final int starCount;

  /// Parse from a json
  factory GiveawayPrizeStars.fromJson(Map<String, dynamic> json) =>
      GiveawayPrizeStars(
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that will be shared by all winners
  @override
  GiveawayPrizeStars copyWith({
    int? starCount,
  }) =>
      GiveawayPrizeStars(
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giveawayPrizeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
