part of '../tdapi.dart';

/// **GroupCallStreams** *(groupCallStreams)* - basic class
///
/// Represents a list of group call streams.
///
/// * [streams]: A list of group call streams.
final class GroupCallStreams extends TdObject {
  /// **GroupCallStreams** *(groupCallStreams)* - basic class
  ///
  /// Represents a list of group call streams.
  ///
  /// * [streams]: A list of group call streams.
  const GroupCallStreams({
    required this.streams,
    this.extra,
    this.clientId,
  });

  /// A list of group call streams
  final List<GroupCallStream> streams;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GroupCallStreams.fromJson(Map<String, dynamic> json) =>
      GroupCallStreams(
        streams: List<GroupCallStream>.from((json['streams'] ?? [])
            .map((item) => GroupCallStream.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "streams": streams.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [streams]: A list of group call streams
  GroupCallStreams copyWith({
    List<GroupCallStream>? streams,
    dynamic extra,
    int? clientId,
  }) =>
      GroupCallStreams(
        streams: streams ?? this.streams,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallStreams';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
