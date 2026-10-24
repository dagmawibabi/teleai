part of '../tdapi.dart';

/// **AuctionRound** *(auctionRound)* - basic class
///
/// Describes a round of an auction.
///
/// * [number]: 1-based number of the round.
/// * [duration]: Duration of the round, in seconds.
/// * [extendTime]: The number of seconds for which the round will be extended if there are changes in the top winners.
/// * [topWinnerCount]: The number of top winners who trigger round extension if changed.
final class AuctionRound extends TdObject {
  /// **AuctionRound** *(auctionRound)* - basic class
  ///
  /// Describes a round of an auction.
  ///
  /// * [number]: 1-based number of the round.
  /// * [duration]: Duration of the round, in seconds.
  /// * [extendTime]: The number of seconds for which the round will be extended if there are changes in the top winners.
  /// * [topWinnerCount]: The number of top winners who trigger round extension if changed.
  const AuctionRound({
    required this.number,
    required this.duration,
    required this.extendTime,
    required this.topWinnerCount,
  });

  /// 1-based number of the round
  final int number;

  /// Duration of the round, in seconds
  final int duration;

  /// The number of seconds for which the round will be extended if there are changes in the top winners
  final int extendTime;

  /// The number of top winners who trigger round extension if changed
  final int topWinnerCount;

  /// Parse from a json
  factory AuctionRound.fromJson(Map<String, dynamic> json) => AuctionRound(
        number: json['number'],
        duration: json['duration'],
        extendTime: json['extend_time'],
        topWinnerCount: json['top_winner_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "number": number,
      "duration": duration,
      "extend_time": extendTime,
      "top_winner_count": topWinnerCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [number]: 1-based number of the round
  /// * [duration]: Duration of the round, in seconds
  /// * [extend_time]: The number of seconds for which the round will be extended if there are changes in the top winners
  /// * [top_winner_count]: The number of top winners who trigger round extension if changed
  AuctionRound copyWith({
    int? number,
    int? duration,
    int? extendTime,
    int? topWinnerCount,
  }) =>
      AuctionRound(
        number: number ?? this.number,
        duration: duration ?? this.duration,
        extendTime: extendTime ?? this.extendTime,
        topWinnerCount: topWinnerCount ?? this.topWinnerCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'auctionRound';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
