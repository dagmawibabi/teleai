part of '../tdapi.dart';

/// **CancelPasswordReset** *(cancelPasswordReset)* - TDLib function
///
/// Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date.
///
/// [Ok] is returned on completion.
final class CancelPasswordReset extends TdFunction {
  /// **CancelPasswordReset** *(cancelPasswordReset)* - TDLib function
  ///
  /// Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date.
  ///
  /// [Ok] is returned on completion.
  const CancelPasswordReset();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  CancelPasswordReset copyWith() => const CancelPasswordReset();

  /// TDLib object type
  static const String defaultObjectId = 'cancelPasswordReset';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
