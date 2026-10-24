part of '../tdapi.dart';

/// **GetCurrentState** *(getCurrentState)* - TDLib function
///
/// Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/updateUser/updateNewChat and others.. This is especially useful if TDLib is run in a separate process. Can be called before initialization.
///
/// [Updates] is returned on completion.
final class GetCurrentState extends TdFunction {
  /// **GetCurrentState** *(getCurrentState)* - TDLib function
  ///
  /// Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/updateUser/updateNewChat and others.. This is especially useful if TDLib is run in a separate process. Can be called before initialization.
  ///
  /// [Updates] is returned on completion.
  const GetCurrentState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetCurrentState copyWith() => const GetCurrentState();

  /// TDLib object type
  static const String defaultObjectId = 'getCurrentState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
