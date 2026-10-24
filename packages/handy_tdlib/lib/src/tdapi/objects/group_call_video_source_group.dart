part of '../tdapi.dart';

/// **GroupCallVideoSourceGroup** *(groupCallVideoSourceGroup)* - basic class
///
/// Describes a group of video synchronization source identifiers.
///
/// * [semantics]: The semantics of sources, one of "SIM" or "FgroupCallVideoSourceGroup".
/// * [sourceIds]: The list of synchronization source identifiers.
final class GroupCallVideoSourceGroup extends TdObject {
  /// **GroupCallVideoSourceGroup** *(groupCallVideoSourceGroup)* - basic class
  ///
  /// Describes a group of video synchronization source identifiers.
  ///
  /// * [semantics]: The semantics of sources, one of "SIM" or "FgroupCallVideoSourceGroup".
  /// * [sourceIds]: The list of synchronization source identifiers.
  const GroupCallVideoSourceGroup({
    required this.semantics,
    required this.sourceIds,
  });

  /// The semantics of sources, one of "SIM" or "FgroupCallVideoSourceGroup"
  final String semantics;

  /// The list of synchronization source identifiers
  final List<int> sourceIds;

  /// Parse from a json
  factory GroupCallVideoSourceGroup.fromJson(Map<String, dynamic> json) =>
      GroupCallVideoSourceGroup(
        semantics: json['semantics'],
        sourceIds: List<int>.from(
            (json['source_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "semantics": semantics,
      "source_ids": sourceIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [semantics]: The semantics of sources, one of "SIM" or "FgroupCallVideoSourceGroup"
  /// * [source_ids]: The list of synchronization source identifiers
  GroupCallVideoSourceGroup copyWith({
    String? semantics,
    List<int>? sourceIds,
  }) =>
      GroupCallVideoSourceGroup(
        semantics: semantics ?? this.semantics,
        sourceIds: sourceIds ?? this.sourceIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallVideoSourceGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
