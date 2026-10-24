part of '../tdapi.dart';

/// **SearchPublicChat** *(searchPublicChat)* - TDLib function
///
/// Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise, an error is returned.
///
/// * [username]: Username to be resolved.
///
/// [Chat] is returned on completion.
final class SearchPublicChat extends TdFunction {
  /// **SearchPublicChat** *(searchPublicChat)* - TDLib function
  ///
  /// Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise, an error is returned.
  ///
  /// * [username]: Username to be resolved.
  ///
  /// [Chat] is returned on completion.
  const SearchPublicChat({
    required this.username,
  });

  /// Username to be resolved
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: Username to be resolved
  SearchPublicChat copyWith({
    String? username,
  }) =>
      SearchPublicChat(
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
