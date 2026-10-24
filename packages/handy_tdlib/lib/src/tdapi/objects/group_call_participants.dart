part of '../tdapi.dart';

/// **GroupCallParticipants** *(groupCallParticipants)* - basic class
///
/// Contains identifiers of group call participants.
///
/// * [totalCount]: Total number of group call participants.
/// * [participantIds]: Identifiers of the participants.
final class GroupCallParticipants extends TdObject {
  /// **GroupCallParticipants** *(groupCallParticipants)* - basic class
  ///
  /// Contains identifiers of group call participants.
  ///
  /// * [totalCount]: Total number of group call participants.
  /// * [participantIds]: Identifiers of the participants.
  const GroupCallParticipants({
    required this.totalCount,
    required this.participantIds,
    this.extra,
    this.clientId,
  });

  /// Total number of group call participants
  final int totalCount;

  /// Identifiers of the participants
  final List<MessageSender> participantIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GroupCallParticipants.fromJson(Map<String, dynamic> json) =>
      GroupCallParticipants(
        totalCount: json['total_count'],
        participantIds: List<MessageSender>.from((json['participant_ids'] ?? [])
            .map((item) => MessageSender.fromJson(item))
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
      "participant_ids": participantIds.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of group call participants
  /// * [participant_ids]: Identifiers of the participants
  GroupCallParticipants copyWith({
    int? totalCount,
    List<MessageSender>? participantIds,
    dynamic extra,
    int? clientId,
  }) =>
      GroupCallParticipants(
        totalCount: totalCount ?? this.totalCount,
        participantIds: participantIds ?? this.participantIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
