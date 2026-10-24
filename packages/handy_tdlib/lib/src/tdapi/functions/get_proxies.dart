part of '../tdapi.dart';

/// **GetProxies** *(getProxies)* - TDLib function
///
/// Returns the list of proxies that are currently set up. Can be called before authorization.
///
/// [AddedProxies] is returned on completion.
final class GetProxies extends TdFunction {
  /// **GetProxies** *(getProxies)* - TDLib function
  ///
  /// Returns the list of proxies that are currently set up. Can be called before authorization.
  ///
  /// [AddedProxies] is returned on completion.
  const GetProxies();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetProxies copyWith() => const GetProxies();

  /// TDLib object type
  static const String defaultObjectId = 'getProxies';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
