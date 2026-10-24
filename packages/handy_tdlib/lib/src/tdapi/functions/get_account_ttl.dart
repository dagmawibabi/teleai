part of '../tdapi.dart';

/// **GetAccountTtl** *(getAccountTtl)* - TDLib function
///
/// Returns the period of inactivity after which the account of the current user will automatically be deleted.
///
/// [AccountTtl] is returned on completion.
final class GetAccountTtl extends TdFunction {
  /// **GetAccountTtl** *(getAccountTtl)* - TDLib function
  ///
  /// Returns the period of inactivity after which the account of the current user will automatically be deleted.
  ///
  /// [AccountTtl] is returned on completion.
  const GetAccountTtl();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAccountTtl copyWith() => const GetAccountTtl();

  /// TDLib object type
  static const String defaultObjectId = 'getAccountTtl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
