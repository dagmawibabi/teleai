part of '../tdapi.dart';

/// **DeleteSavedOrderInfo** *(deleteSavedOrderInfo)* - TDLib function
///
/// Deletes saved order information.
///
/// [Ok] is returned on completion.
final class DeleteSavedOrderInfo extends TdFunction {
  /// **DeleteSavedOrderInfo** *(deleteSavedOrderInfo)* - TDLib function
  ///
  /// Deletes saved order information.
  ///
  /// [Ok] is returned on completion.
  const DeleteSavedOrderInfo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  DeleteSavedOrderInfo copyWith() => const DeleteSavedOrderInfo();

  /// TDLib object type
  static const String defaultObjectId = 'deleteSavedOrderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
