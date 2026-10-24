part of '../tdapi.dart';

/// **GetTopChats** *(getTopChats)* - TDLib function
///
/// Returns a list of frequently used chats.
///
/// * [category]: Category of chats to be returned.
/// * [limit]: The maximum number of chats to be returned; up to 30.
///
/// [Chats] is returned on completion.
final class GetTopChats extends TdFunction {
  /// **GetTopChats** *(getTopChats)* - TDLib function
  ///
  /// Returns a list of frequently used chats.
  ///
  /// * [category]: Category of chats to be returned.
  /// * [limit]: The maximum number of chats to be returned; up to 30.
  ///
  /// [Chats] is returned on completion.
  const GetTopChats({
    required this.category,
    required this.limit,
  });

  /// Category of chats to be returned
  final TopChatCategory category;

  /// The maximum number of chats to be returned; up to 30
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "category": category.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [category]: Category of chats to be returned
  /// * [limit]: The maximum number of chats to be returned; up to 30
  GetTopChats copyWith({
    TopChatCategory? category,
    int? limit,
  }) =>
      GetTopChats(
        category: category ?? this.category,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTopChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
