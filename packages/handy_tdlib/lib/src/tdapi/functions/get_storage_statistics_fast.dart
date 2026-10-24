part of '../tdapi.dart';

/// **GetStorageStatisticsFast** *(getStorageStatisticsFast)* - TDLib function
///
/// Quickly returns approximate storage usage statistics. Can be called before authorization.
///
/// [StorageStatisticsFast] is returned on completion.
final class GetStorageStatisticsFast extends TdFunction {
  /// **GetStorageStatisticsFast** *(getStorageStatisticsFast)* - TDLib function
  ///
  /// Quickly returns approximate storage usage statistics. Can be called before authorization.
  ///
  /// [StorageStatisticsFast] is returned on completion.
  const GetStorageStatisticsFast();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetStorageStatisticsFast copyWith() => const GetStorageStatisticsFast();

  /// TDLib object type
  static const String defaultObjectId = 'getStorageStatisticsFast';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
