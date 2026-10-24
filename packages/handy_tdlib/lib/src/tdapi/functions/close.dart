part of '../tdapi.dart';

/// **Close** *(close)* - TDLib function
///
/// Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization.
///
/// [Ok] is returned on completion.
final class Close extends TdFunction {
  /// **Close** *(close)* - TDLib function
  ///
  /// Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization.
  ///
  /// [Ok] is returned on completion.
  const Close();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  Close copyWith() => const Close();

  /// TDLib object type
  static const String defaultObjectId = 'close';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
