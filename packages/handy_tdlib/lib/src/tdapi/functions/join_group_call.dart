part of '../tdapi.dart';

/// **JoinGroupCall** *(joinGroupCall)* - TDLib function
///
/// Joins a regular group call that is not bound to a chat.
///
/// * [inputGroupCall]: The group call to join.
/// * [joinParameters]: Parameters to join the call.
///
/// [GroupCallInfo] is returned on completion.
final class JoinGroupCall extends TdFunction {
  /// **JoinGroupCall** *(joinGroupCall)* - TDLib function
  ///
  /// Joins a regular group call that is not bound to a chat.
  ///
  /// * [inputGroupCall]: The group call to join.
  /// * [joinParameters]: Parameters to join the call.
  ///
  /// [GroupCallInfo] is returned on completion.
  const JoinGroupCall({
    required this.inputGroupCall,
    required this.joinParameters,
  });

  /// The group call to join
  final InputGroupCall inputGroupCall;

  /// Parameters to join the call
  final GroupCallJoinParameters joinParameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "input_group_call": inputGroupCall.toJson(),
      "join_parameters": joinParameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [input_group_call]: The group call to join
  /// * [join_parameters]: Parameters to join the call
  JoinGroupCall copyWith({
    InputGroupCall? inputGroupCall,
    GroupCallJoinParameters? joinParameters,
  }) =>
      JoinGroupCall(
        inputGroupCall: inputGroupCall ?? this.inputGroupCall,
        joinParameters: joinParameters ?? this.joinParameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'joinGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
