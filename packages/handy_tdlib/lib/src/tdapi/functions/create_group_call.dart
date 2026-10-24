part of '../tdapi.dart';

/// **CreateGroupCall** *(createGroupCall)* - TDLib function
///
/// Creates a new group call that isn't bound to a chat.
///
/// * [joinParameters]: Parameters to join the call; pass null to only create call link without joining the call *(optional)*.
///
/// [GroupCallInfo] is returned on completion.
final class CreateGroupCall extends TdFunction {
  /// **CreateGroupCall** *(createGroupCall)* - TDLib function
  ///
  /// Creates a new group call that isn't bound to a chat.
  ///
  /// * [joinParameters]: Parameters to join the call; pass null to only create call link without joining the call *(optional)*.
  ///
  /// [GroupCallInfo] is returned on completion.
  const CreateGroupCall({
    this.joinParameters,
  });

  /// Parameters to join the call; pass null to only create call link without joining the call
  final GroupCallJoinParameters? joinParameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "join_parameters": joinParameters?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [join_parameters]: Parameters to join the call; pass null to only create call link without joining the call
  CreateGroupCall copyWith({
    GroupCallJoinParameters? joinParameters,
  }) =>
      CreateGroupCall(
        joinParameters: joinParameters ?? this.joinParameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
