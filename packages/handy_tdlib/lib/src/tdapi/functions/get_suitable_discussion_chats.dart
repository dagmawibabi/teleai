part of '../tdapi.dart';

/// **GetSuitableDiscussionChats** *(getSuitableDiscussionChats)* - TDLib function
///
/// Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group.. To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first.
///
/// [Chats] is returned on completion.
final class GetSuitableDiscussionChats extends TdFunction {
  /// **GetSuitableDiscussionChats** *(getSuitableDiscussionChats)* - TDLib function
  ///
  /// Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group.. To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first.
  ///
  /// [Chats] is returned on completion.
  const GetSuitableDiscussionChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSuitableDiscussionChats copyWith() => const GetSuitableDiscussionChats();

  /// TDLib object type
  static const String defaultObjectId = 'getSuitableDiscussionChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
