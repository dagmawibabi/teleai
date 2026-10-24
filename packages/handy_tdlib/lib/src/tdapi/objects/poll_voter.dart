part of '../tdapi.dart';

/// **PollVoter** *(pollVoter)* - basic class
///
/// Represents a poll voter.
///
/// * [voterId]: The voter identifier.
/// * [date]: Point in time (Unix timestamp) when the vote was added.
final class PollVoter extends TdObject {
  /// **PollVoter** *(pollVoter)* - basic class
  ///
  /// Represents a poll voter.
  ///
  /// * [voterId]: The voter identifier.
  /// * [date]: Point in time (Unix timestamp) when the vote was added.
  const PollVoter({
    required this.voterId,
    required this.date,
  });

  /// The voter identifier
  final MessageSender voterId;

  /// Point in time (Unix timestamp) when the vote was added
  final int date;

  /// Parse from a json
  factory PollVoter.fromJson(Map<String, dynamic> json) => PollVoter(
        voterId: MessageSender.fromJson(json['voter_id']),
        date: json['date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voter_id": voterId.toJson(),
      "date": date,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voter_id]: The voter identifier
  /// * [date]: Point in time (Unix timestamp) when the vote was added
  PollVoter copyWith({
    MessageSender? voterId,
    int? date,
  }) =>
      PollVoter(
        voterId: voterId ?? this.voterId,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollVoter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
