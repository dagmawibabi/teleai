part of '../tdapi.dart';

/// **GetPremiumState** *(getPremiumState)* - TDLib function
///
/// Returns state of Telegram Premium subscription and promotion videos for Premium features.
///
/// [PremiumState] is returned on completion.
final class GetPremiumState extends TdFunction {
  /// **GetPremiumState** *(getPremiumState)* - TDLib function
  ///
  /// Returns state of Telegram Premium subscription and promotion videos for Premium features.
  ///
  /// [PremiumState] is returned on completion.
  const GetPremiumState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetPremiumState copyWith() => const GetPremiumState();

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
