part of '../tdapi.dart';

/// **FoundAffiliatePrograms** *(foundAffiliatePrograms)* - basic class
///
/// Represents a list of found affiliate programs.
///
/// * [totalCount]: The total number of found affiliate programs.
/// * [programs]: The list of affiliate programs.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class FoundAffiliatePrograms extends TdObject {
  /// **FoundAffiliatePrograms** *(foundAffiliatePrograms)* - basic class
  ///
  /// Represents a list of found affiliate programs.
  ///
  /// * [totalCount]: The total number of found affiliate programs.
  /// * [programs]: The list of affiliate programs.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const FoundAffiliatePrograms({
    required this.totalCount,
    required this.programs,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total number of found affiliate programs
  final int totalCount;

  /// The list of affiliate programs
  final List<FoundAffiliateProgram> programs;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundAffiliatePrograms.fromJson(Map<String, dynamic> json) =>
      FoundAffiliatePrograms(
        totalCount: json['total_count'],
        programs: List<FoundAffiliateProgram>.from((json['programs'] ?? [])
            .map((item) => FoundAffiliateProgram.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "programs": programs.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: The total number of found affiliate programs
  /// * [programs]: The list of affiliate programs
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  FoundAffiliatePrograms copyWith({
    int? totalCount,
    List<FoundAffiliateProgram>? programs,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      FoundAffiliatePrograms(
        totalCount: totalCount ?? this.totalCount,
        programs: programs ?? this.programs,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundAffiliatePrograms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
