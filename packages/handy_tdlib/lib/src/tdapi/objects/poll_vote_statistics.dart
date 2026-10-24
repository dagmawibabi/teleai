part of '../tdapi.dart';

/// **PollVoteStatistics** *(pollVoteStatistics)* - basic class
///
/// A detailed statistics about poll votes.
///
/// * [voteGraph]: A graph containing distribution of votes in the poll.
final class PollVoteStatistics extends TdObject {
  /// **PollVoteStatistics** *(pollVoteStatistics)* - basic class
  ///
  /// A detailed statistics about poll votes.
  ///
  /// * [voteGraph]: A graph containing distribution of votes in the poll.
  const PollVoteStatistics({
    required this.voteGraph,
    this.extra,
    this.clientId,
  });

  /// A graph containing distribution of votes in the poll
  final StatisticalGraph voteGraph;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PollVoteStatistics.fromJson(Map<String, dynamic> json) =>
      PollVoteStatistics(
        voteGraph: StatisticalGraph.fromJson(json['vote_graph']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "vote_graph": voteGraph.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [vote_graph]: A graph containing distribution of votes in the poll
  PollVoteStatistics copyWith({
    StatisticalGraph? voteGraph,
    dynamic extra,
    int? clientId,
  }) =>
      PollVoteStatistics(
        voteGraph: voteGraph ?? this.voteGraph,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
