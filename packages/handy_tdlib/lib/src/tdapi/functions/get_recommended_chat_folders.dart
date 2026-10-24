part of '../tdapi.dart';

/// **GetRecommendedChatFolders** *(getRecommendedChatFolders)* - TDLib function
///
/// Returns recommended chat folders for the current user.
///
/// [RecommendedChatFolders] is returned on completion.
final class GetRecommendedChatFolders extends TdFunction {
  /// **GetRecommendedChatFolders** *(getRecommendedChatFolders)* - TDLib function
  ///
  /// Returns recommended chat folders for the current user.
  ///
  /// [RecommendedChatFolders] is returned on completion.
  const GetRecommendedChatFolders();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetRecommendedChatFolders copyWith() => const GetRecommendedChatFolders();

  /// TDLib object type
  static const String defaultObjectId = 'getRecommendedChatFolders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
