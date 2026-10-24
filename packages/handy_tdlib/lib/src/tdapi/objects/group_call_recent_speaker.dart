part of '../tdapi.dart';

/// **GroupCallRecentSpeaker** *(groupCallRecentSpeaker)* - basic class
///
/// Describes a recently speaking participant in a group call.
///
/// * [participantId]: Group call participant identifier.
/// * [isSpeaking]: True, if the user has spoken recently.
final class GroupCallRecentSpeaker extends TdObject {
  /// **GroupCallRecentSpeaker** *(groupCallRecentSpeaker)* - basic class
  ///
  /// Describes a recently speaking participant in a group call.
  ///
  /// * [participantId]: Group call participant identifier.
  /// * [isSpeaking]: True, if the user has spoken recently.
  const GroupCallRecentSpeaker({
    required this.participantId,
    required this.isSpeaking,
  });

  /// Group call participant identifier
  final MessageSender participantId;

  /// True, if the user has spoken recently
  final bool isSpeaking;

  /// Parse from a json
  factory GroupCallRecentSpeaker.fromJson(Map<String, dynamic> json) =>
      GroupCallRecentSpeaker(
        participantId: MessageSender.fromJson(json['participant_id']),
        isSpeaking: json['is_speaking'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "participant_id": participantId.toJson(),
      "is_speaking": isSpeaking,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [participant_id]: Group call participant identifier
  /// * [is_speaking]: True, if the user has spoken recently
  GroupCallRecentSpeaker copyWith({
    MessageSender? participantId,
    bool? isSpeaking,
  }) =>
      GroupCallRecentSpeaker(
        participantId: participantId ?? this.participantId,
        isSpeaking: isSpeaking ?? this.isSpeaking,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallRecentSpeaker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
