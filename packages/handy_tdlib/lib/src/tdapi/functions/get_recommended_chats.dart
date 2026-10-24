part of '../tdapi.dart';

/// **GetRecommendedChats** *(getRecommendedChats)* - TDLib function
///
/// Returns a list of channel chats recommended to the current user.
///
/// [Chats] is returned on completion.
final class GetRecommendedChats extends TdFunction {
  /// **GetRecommendedChats** *(getRecommendedChats)* - TDLib function
  ///
  /// Returns a list of channel chats recommended to the current user.
  ///
  /// [Chats] is returned on completion.
  const GetRecommendedChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetRecommendedChats copyWith() => const GetRecommendedChats();

  /// TDLib object type
  static const String defaultObjectId = 'getRecommendedChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
