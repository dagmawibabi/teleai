part of '../tdapi.dart';

/// **PollVoters** *(pollVoters)* - basic class
///
/// Represents a list of poll voters.
///
/// * [totalCount]: Approximate total number of poll voters found.
/// * [voters]: List of poll voters.
final class PollVoters extends TdObject {
  /// **PollVoters** *(pollVoters)* - basic class
  ///
  /// Represents a list of poll voters.
  ///
  /// * [totalCount]: Approximate total number of poll voters found.
  /// * [voters]: List of poll voters.
  const PollVoters({
    required this.totalCount,
    required this.voters,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of poll voters found
  final int totalCount;

  /// List of poll voters
  final List<PollVoter> voters;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PollVoters.fromJson(Map<String, dynamic> json) => PollVoters(
        totalCount: json['total_count'],
        voters: List<PollVoter>.from((json['voters'] ?? [])
            .map((item) => PollVoter.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "voters": voters.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of poll voters found
  /// * [voters]: List of poll voters
  PollVoters copyWith({
    int? totalCount,
    List<PollVoter>? voters,
    dynamic extra,
    int? clientId,
  }) =>
      PollVoters(
        totalCount: totalCount ?? this.totalCount,
        voters: voters ?? this.voters,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollVoters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
