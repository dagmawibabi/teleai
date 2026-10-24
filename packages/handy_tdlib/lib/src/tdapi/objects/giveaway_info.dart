part of '../tdapi.dart';

/// **GiveawayInfo** *(giveawayInfo)* - parent
///
/// Contains information about a giveaway.
sealed class GiveawayInfo extends TdObject {
  /// **GiveawayInfo** *(giveawayInfo)* - parent
  ///
  /// Contains information about a giveaway.
  const GiveawayInfo();

  /// a GiveawayInfo return type can be :
  /// * [GiveawayInfoOngoing]
  /// * [GiveawayInfoCompleted]
  factory GiveawayInfo.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiveawayInfoOngoing.defaultObjectId:
        return GiveawayInfoOngoing.fromJson(json);
      case GiveawayInfoCompleted.defaultObjectId:
        return GiveawayInfoCompleted.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiveawayInfo)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiveawayInfo copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giveawayInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayInfoOngoing** *(giveawayInfoOngoing)* - child of GiveawayInfo
///
/// Describes an ongoing giveaway.
///
/// * [creationDate]: Point in time (Unix timestamp) when the giveaway was created.
/// * [status]: Status of the current user in the giveaway.
/// * [isEnded]: True, if the giveaway has ended and results are being prepared.
final class GiveawayInfoOngoing extends GiveawayInfo {
  /// **GiveawayInfoOngoing** *(giveawayInfoOngoing)* - child of GiveawayInfo
  ///
  /// Describes an ongoing giveaway.
  ///
  /// * [creationDate]: Point in time (Unix timestamp) when the giveaway was created.
  /// * [status]: Status of the current user in the giveaway.
  /// * [isEnded]: True, if the giveaway has ended and results are being prepared.
  const GiveawayInfoOngoing({
    required this.creationDate,
    required this.status,
    required this.isEnded,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) when the giveaway was created
  final int creationDate;

  /// Status of the current user in the giveaway
  final GiveawayParticipantStatus status;

  /// True, if the giveaway has ended and results are being prepared
  final bool isEnded;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiveawayInfoOngoing.fromJson(Map<String, dynamic> json) =>
      GiveawayInfoOngoing(
        creationDate: json['creation_date'],
        status: GiveawayParticipantStatus.fromJson(json['status']),
        isEnded: json['is_ended'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "creation_date": creationDate,
      "status": status.toJson(),
      "is_ended": isEnded,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [creation_date]: Point in time (Unix timestamp) when the giveaway was created
  /// * [status]: Status of the current user in the giveaway
  /// * [is_ended]: True, if the giveaway has ended and results are being prepared
  @override
  GiveawayInfoOngoing copyWith({
    int? creationDate,
    GiveawayParticipantStatus? status,
    bool? isEnded,
    dynamic extra,
    int? clientId,
  }) =>
      GiveawayInfoOngoing(
        creationDate: creationDate ?? this.creationDate,
        status: status ?? this.status,
        isEnded: isEnded ?? this.isEnded,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giveawayInfoOngoing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayInfoCompleted** *(giveawayInfoCompleted)* - child of GiveawayInfo
///
/// Describes a completed giveaway.
///
/// * [creationDate]: Point in time (Unix timestamp) when the giveaway was created.
/// * [actualWinnersSelectionDate]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway.
/// * [wasRefunded]: True, if the giveaway was canceled and was fully refunded.
/// * [isWinner]: True, if the current user is a winner of the giveaway.
/// * [winnerCount]: Number of winners in the giveaway.
/// * [activationCount]: Number of winners, which activated their gift codes; for Telegram Premium giveaways only.
/// * [giftCode]: Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Premium giveaway.
/// * [wonStarCount]: The Telegram Star amount won by the current user; 0 if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Star giveaway.
final class GiveawayInfoCompleted extends GiveawayInfo {
  /// **GiveawayInfoCompleted** *(giveawayInfoCompleted)* - child of GiveawayInfo
  ///
  /// Describes a completed giveaway.
  ///
  /// * [creationDate]: Point in time (Unix timestamp) when the giveaway was created.
  /// * [actualWinnersSelectionDate]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway.
  /// * [wasRefunded]: True, if the giveaway was canceled and was fully refunded.
  /// * [isWinner]: True, if the current user is a winner of the giveaway.
  /// * [winnerCount]: Number of winners in the giveaway.
  /// * [activationCount]: Number of winners, which activated their gift codes; for Telegram Premium giveaways only.
  /// * [giftCode]: Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Premium giveaway.
  /// * [wonStarCount]: The Telegram Star amount won by the current user; 0 if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Star giveaway.
  const GiveawayInfoCompleted({
    required this.creationDate,
    required this.actualWinnersSelectionDate,
    required this.wasRefunded,
    required this.isWinner,
    required this.winnerCount,
    required this.activationCount,
    required this.giftCode,
    required this.wonStarCount,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) when the giveaway was created
  final int creationDate;

  /// Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
  final int actualWinnersSelectionDate;

  /// True, if the giveaway was canceled and was fully refunded
  final bool wasRefunded;

  /// True, if the current user is a winner of the giveaway
  final bool isWinner;

  /// Number of winners in the giveaway
  final int winnerCount;

  /// Number of winners, which activated their gift codes; for Telegram Premium giveaways only
  final int activationCount;

  /// Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Premium giveaway
  final String giftCode;

  /// The Telegram Star amount won by the current user; 0 if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Star giveaway
  final int wonStarCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiveawayInfoCompleted.fromJson(Map<String, dynamic> json) =>
      GiveawayInfoCompleted(
        creationDate: json['creation_date'],
        actualWinnersSelectionDate: json['actual_winners_selection_date'],
        wasRefunded: json['was_refunded'],
        isWinner: json['is_winner'],
        winnerCount: json['winner_count'],
        activationCount: json['activation_count'],
        giftCode: json['gift_code'],
        wonStarCount: json['won_star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "creation_date": creationDate,
      "actual_winners_selection_date": actualWinnersSelectionDate,
      "was_refunded": wasRefunded,
      "is_winner": isWinner,
      "winner_count": winnerCount,
      "activation_count": activationCount,
      "gift_code": giftCode,
      "won_star_count": wonStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [creation_date]: Point in time (Unix timestamp) when the giveaway was created
  /// * [actual_winners_selection_date]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
  /// * [was_refunded]: True, if the giveaway was canceled and was fully refunded
  /// * [is_winner]: True, if the current user is a winner of the giveaway
  /// * [winner_count]: Number of winners in the giveaway
  /// * [activation_count]: Number of winners, which activated their gift codes; for Telegram Premium giveaways only
  /// * [gift_code]: Telegram Premium gift code that was received by the current user; empty if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Premium giveaway
  /// * [won_star_count]: The Telegram Star amount won by the current user; 0 if the user isn't a winner in the giveaway or the giveaway isn't a Telegram Star giveaway
  @override
  GiveawayInfoCompleted copyWith({
    int? creationDate,
    int? actualWinnersSelectionDate,
    bool? wasRefunded,
    bool? isWinner,
    int? winnerCount,
    int? activationCount,
    String? giftCode,
    int? wonStarCount,
    dynamic extra,
    int? clientId,
  }) =>
      GiveawayInfoCompleted(
        creationDate: creationDate ?? this.creationDate,
        actualWinnersSelectionDate:
            actualWinnersSelectionDate ?? this.actualWinnersSelectionDate,
        wasRefunded: wasRefunded ?? this.wasRefunded,
        isWinner: isWinner ?? this.isWinner,
        winnerCount: winnerCount ?? this.winnerCount,
        activationCount: activationCount ?? this.activationCount,
        giftCode: giftCode ?? this.giftCode,
        wonStarCount: wonStarCount ?? this.wonStarCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giveawayInfoCompleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
