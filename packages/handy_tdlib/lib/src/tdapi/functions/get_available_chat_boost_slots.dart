part of '../tdapi.dart';

/// **GetAvailableChatBoostSlots** *(getAvailableChatBoostSlots)* - TDLib function
///
/// Returns the list of available chat boost slots for the current user.
///
/// [ChatBoostSlots] is returned on completion.
final class GetAvailableChatBoostSlots extends TdFunction {
  /// **GetAvailableChatBoostSlots** *(getAvailableChatBoostSlots)* - TDLib function
  ///
  /// Returns the list of available chat boost slots for the current user.
  ///
  /// [ChatBoostSlots] is returned on completion.
  const GetAvailableChatBoostSlots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAvailableChatBoostSlots copyWith() => const GetAvailableChatBoostSlots();

  /// TDLib object type
  static const String defaultObjectId = 'getAvailableChatBoostSlots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
