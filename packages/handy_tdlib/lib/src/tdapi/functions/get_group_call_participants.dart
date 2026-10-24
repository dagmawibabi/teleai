part of '../tdapi.dart';

/// **GetGroupCallParticipants** *(getGroupCallParticipants)* - TDLib function
///
/// Returns information about participants of a non-joined group call that is not bound to a chat.
///
/// * [inputGroupCall]: The group call which participants will be returned.
/// * [limit]: The maximum number of participants to return; must be positive.
///
/// [GroupCallParticipants] is returned on completion.
final class GetGroupCallParticipants extends TdFunction {
  /// **GetGroupCallParticipants** *(getGroupCallParticipants)* - TDLib function
  ///
  /// Returns information about participants of a non-joined group call that is not bound to a chat.
  ///
  /// * [inputGroupCall]: The group call which participants will be returned.
  /// * [limit]: The maximum number of participants to return; must be positive.
  ///
  /// [GroupCallParticipants] is returned on completion.
  const GetGroupCallParticipants({
    required this.inputGroupCall,
    required this.limit,
  });

  /// The group call which participants will be returned
  final InputGroupCall inputGroupCall;

  /// The maximum number of participants to return; must be positive
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "input_group_call": inputGroupCall.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [input_group_call]: The group call which participants will be returned
  /// * [limit]: The maximum number of participants to return; must be positive
  GetGroupCallParticipants copyWith({
    InputGroupCall? inputGroupCall,
    int? limit,
  }) =>
      GetGroupCallParticipants(
        inputGroupCall: inputGroupCall ?? this.inputGroupCall,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGroupCallParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
