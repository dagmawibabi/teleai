part of '../tdapi.dart';

/// **GetSavedAnimations** *(getSavedAnimations)* - TDLib function
///
/// Returns saved animations.
///
/// [Animations] is returned on completion.
final class GetSavedAnimations extends TdFunction {
  /// **GetSavedAnimations** *(getSavedAnimations)* - TDLib function
  ///
  /// Returns saved animations.
  ///
  /// [Animations] is returned on completion.
  const GetSavedAnimations();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSavedAnimations copyWith() => const GetSavedAnimations();

  /// TDLib object type
  static const String defaultObjectId = 'getSavedAnimations';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
