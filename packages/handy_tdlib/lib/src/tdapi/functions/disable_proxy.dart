part of '../tdapi.dart';

/// **DisableProxy** *(disableProxy)* - TDLib function
///
/// Disables the currently enabled proxy. Can be called before authorization.
///
/// [Ok] is returned on completion.
final class DisableProxy extends TdFunction {
  /// **DisableProxy** *(disableProxy)* - TDLib function
  ///
  /// Disables the currently enabled proxy. Can be called before authorization.
  ///
  /// [Ok] is returned on completion.
  const DisableProxy();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  DisableProxy copyWith() => const DisableProxy();

  /// TDLib object type
  static const String defaultObjectId = 'disableProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
