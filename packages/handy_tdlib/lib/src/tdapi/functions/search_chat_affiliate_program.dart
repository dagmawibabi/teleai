part of '../tdapi.dart';

/// **SearchChatAffiliateProgram** *(searchChatAffiliateProgram)* - TDLib function
///
/// Searches a chat with an affiliate program. Returns the chat if found and the program is active.
///
/// * [username]: Username of the chat.
/// * [referrer]: The referrer from an internalLinkTypeChatAffiliateProgram link.
///
/// [Chat] is returned on completion.
final class SearchChatAffiliateProgram extends TdFunction {
  /// **SearchChatAffiliateProgram** *(searchChatAffiliateProgram)* - TDLib function
  ///
  /// Searches a chat with an affiliate program. Returns the chat if found and the program is active.
  ///
  /// * [username]: Username of the chat.
  /// * [referrer]: The referrer from an internalLinkTypeChatAffiliateProgram link.
  ///
  /// [Chat] is returned on completion.
  const SearchChatAffiliateProgram({
    required this.username,
    required this.referrer,
  });

  /// Username of the chat
  final String username;

  /// The referrer from an internalLinkTypeChatAffiliateProgram link
  final String referrer;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "username": username,
      "referrer": referrer,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: Username of the chat
  /// * [referrer]: The referrer from an internalLinkTypeChatAffiliateProgram link
  SearchChatAffiliateProgram copyWith({
    String? username,
    String? referrer,
  }) =>
      SearchChatAffiliateProgram(
        username: username ?? this.username,
        referrer: referrer ?? this.referrer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchChatAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
