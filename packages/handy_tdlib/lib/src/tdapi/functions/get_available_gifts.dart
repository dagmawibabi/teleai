part of '../tdapi.dart';

/// **GetAvailableGifts** *(getAvailableGifts)* - TDLib function
///
/// Returns gifts that can be sent to other users and channel chats.
///
/// [AvailableGifts] is returned on completion.
final class GetAvailableGifts extends TdFunction {
  /// **GetAvailableGifts** *(getAvailableGifts)* - TDLib function
  ///
  /// Returns gifts that can be sent to other users and channel chats.
  ///
  /// [AvailableGifts] is returned on completion.
  const GetAvailableGifts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAvailableGifts copyWith() => const GetAvailableGifts();

  /// TDLib object type
  static const String defaultObjectId = 'getAvailableGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
