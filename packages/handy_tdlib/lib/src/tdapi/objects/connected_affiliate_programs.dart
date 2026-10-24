part of '../tdapi.dart';

/// **ConnectedAffiliatePrograms** *(connectedAffiliatePrograms)* - basic class
///
/// Represents a list of affiliate programs that were connected to an affiliate.
///
/// * [totalCount]: The total number of affiliate programs that were connected to the affiliate.
/// * [programs]: The list of connected affiliate programs.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class ConnectedAffiliatePrograms extends TdObject {
  /// **ConnectedAffiliatePrograms** *(connectedAffiliatePrograms)* - basic class
  ///
  /// Represents a list of affiliate programs that were connected to an affiliate.
  ///
  /// * [totalCount]: The total number of affiliate programs that were connected to the affiliate.
  /// * [programs]: The list of connected affiliate programs.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const ConnectedAffiliatePrograms({
    required this.totalCount,
    required this.programs,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total number of affiliate programs that were connected to the affiliate
  final int totalCount;

  /// The list of connected affiliate programs
  final List<ConnectedAffiliateProgram> programs;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ConnectedAffiliatePrograms.fromJson(Map<String, dynamic> json) =>
      ConnectedAffiliatePrograms(
        totalCount: json['total_count'],
        programs: List<ConnectedAffiliateProgram>.from((json['programs'] ?? [])
            .map((item) => ConnectedAffiliateProgram.fromJson(item))
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
  /// * [total_count]: The total number of affiliate programs that were connected to the affiliate
  /// * [programs]: The list of connected affiliate programs
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  ConnectedAffiliatePrograms copyWith({
    int? totalCount,
    List<ConnectedAffiliateProgram>? programs,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      ConnectedAffiliatePrograms(
        totalCount: totalCount ?? this.totalCount,
        programs: programs ?? this.programs,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'connectedAffiliatePrograms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
