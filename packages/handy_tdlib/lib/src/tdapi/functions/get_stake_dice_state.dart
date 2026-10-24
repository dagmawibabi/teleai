part of '../tdapi.dart';

/// **GetStakeDiceState** *(getStakeDiceState)* - TDLib function
///
/// Returns the current state of stake dice.
///
/// [StakeDiceState] is returned on completion.
final class GetStakeDiceState extends TdFunction {
  /// **GetStakeDiceState** *(getStakeDiceState)* - TDLib function
  ///
  /// Returns the current state of stake dice.
  ///
  /// [StakeDiceState] is returned on completion.
  const GetStakeDiceState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetStakeDiceState copyWith() => const GetStakeDiceState();

  /// TDLib object type
  static const String defaultObjectId = 'getStakeDiceState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
