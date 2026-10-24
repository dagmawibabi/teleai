part of '../tdapi.dart';

/// **LiveStoryDonors** *(liveStoryDonors)* - basic class
///
/// Contains a list of users and chats that spend most money on paid messages and reactions in a live story.
///
/// * [totalStarCount]: Total amount of spent Telegram Stars.
/// * [topDonors]: List of top donors in the live story.
final class LiveStoryDonors extends TdObject {
  /// **LiveStoryDonors** *(liveStoryDonors)* - basic class
  ///
  /// Contains a list of users and chats that spend most money on paid messages and reactions in a live story.
  ///
  /// * [totalStarCount]: Total amount of spent Telegram Stars.
  /// * [topDonors]: List of top donors in the live story.
  const LiveStoryDonors({
    required this.totalStarCount,
    required this.topDonors,
    this.extra,
    this.clientId,
  });

  /// Total amount of spent Telegram Stars
  final int totalStarCount;

  /// List of top donors in the live story
  final List<PaidReactor> topDonors;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LiveStoryDonors.fromJson(Map<String, dynamic> json) =>
      LiveStoryDonors(
        totalStarCount: json['total_star_count'],
        topDonors: List<PaidReactor>.from((json['top_donors'] ?? [])
            .map((item) => PaidReactor.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_star_count": totalStarCount,
      "top_donors": topDonors.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_star_count]: Total amount of spent Telegram Stars
  /// * [top_donors]: List of top donors in the live story
  LiveStoryDonors copyWith({
    int? totalStarCount,
    List<PaidReactor>? topDonors,
    dynamic extra,
    int? clientId,
  }) =>
      LiveStoryDonors(
        totalStarCount: totalStarCount ?? this.totalStarCount,
        topDonors: topDonors ?? this.topDonors,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'liveStoryDonors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
