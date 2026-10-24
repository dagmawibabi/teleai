part of '../tdapi.dart';

/// **GetSavedOrderInfo** *(getSavedOrderInfo)* - TDLib function
///
/// Returns saved order information. Returns a 404 error if there is no saved order information.
///
/// [OrderInfo] is returned on completion.
final class GetSavedOrderInfo extends TdFunction {
  /// **GetSavedOrderInfo** *(getSavedOrderInfo)* - TDLib function
  ///
  /// Returns saved order information. Returns a 404 error if there is no saved order information.
  ///
  /// [OrderInfo] is returned on completion.
  const GetSavedOrderInfo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSavedOrderInfo copyWith() => const GetSavedOrderInfo();

  /// TDLib object type
  static const String defaultObjectId = 'getSavedOrderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
