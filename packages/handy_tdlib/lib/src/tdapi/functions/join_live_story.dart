part of '../tdapi.dart';

/// **JoinLiveStory** *(joinLiveStory)* - TDLib function
///
/// Joins a group call of an active live story. Returns join response payload for tgcalls.
///
/// * [groupCallId]: Group call identifier.
/// * [joinParameters]: Parameters to join the call.
///
/// [Text] is returned on completion.
final class JoinLiveStory extends TdFunction {
  /// **JoinLiveStory** *(joinLiveStory)* - TDLib function
  ///
  /// Joins a group call of an active live story. Returns join response payload for tgcalls.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [joinParameters]: Parameters to join the call.
  ///
  /// [Text] is returned on completion.
  const JoinLiveStory({
    required this.groupCallId,
    required this.joinParameters,
  });

  /// Group call identifier
  final int groupCallId;

  /// Parameters to join the call
  final GroupCallJoinParameters joinParameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "join_parameters": joinParameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [join_parameters]: Parameters to join the call
  JoinLiveStory copyWith({
    int? groupCallId,
    GroupCallJoinParameters? joinParameters,
  }) =>
      JoinLiveStory(
        groupCallId: groupCallId ?? this.groupCallId,
        joinParameters: joinParameters ?? this.joinParameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'joinLiveStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
