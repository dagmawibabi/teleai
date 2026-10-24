part of '../tdapi.dart';

/// **CanTransferOwnership** *(canTransferOwnership)* - TDLib function
///
/// Checks whether the current session can be used to transfer a chat ownership to another user.
///
/// [CanTransferOwnershipResult] is returned on completion.
final class CanTransferOwnership extends TdFunction {
  /// **CanTransferOwnership** *(canTransferOwnership)* - TDLib function
  ///
  /// Checks whether the current session can be used to transfer a chat ownership to another user.
  ///
  /// [CanTransferOwnershipResult] is returned on completion.
  const CanTransferOwnership();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  CanTransferOwnership copyWith() => const CanTransferOwnership();

  /// TDLib object type
  static const String defaultObjectId = 'canTransferOwnership';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
