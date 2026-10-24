part of '../tdapi.dart';

/// **GroupCallInfo** *(groupCallInfo)* - basic class
///
/// Contains information about a just created or just joined group call.
///
/// * [groupCallId]: Identifier of the group call.
/// * [joinPayload]: Join response payload for tgcalls; empty if the call isn't joined.
final class GroupCallInfo extends TdObject {
  /// **GroupCallInfo** *(groupCallInfo)* - basic class
  ///
  /// Contains information about a just created or just joined group call.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [joinPayload]: Join response payload for tgcalls; empty if the call isn't joined.
  const GroupCallInfo({
    required this.groupCallId,
    required this.joinPayload,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// Join response payload for tgcalls; empty if the call isn't joined
  final String joinPayload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GroupCallInfo.fromJson(Map<String, dynamic> json) => GroupCallInfo(
        groupCallId: json['group_call_id'],
        joinPayload: json['join_payload'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "join_payload": joinPayload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [join_payload]: Join response payload for tgcalls; empty if the call isn't joined
  GroupCallInfo copyWith({
    int? groupCallId,
    String? joinPayload,
    dynamic extra,
    int? clientId,
  }) =>
      GroupCallInfo(
        groupCallId: groupCallId ?? this.groupCallId,
        joinPayload: joinPayload ?? this.joinPayload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
