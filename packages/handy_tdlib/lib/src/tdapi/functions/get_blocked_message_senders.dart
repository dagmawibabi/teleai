part of '../tdapi.dart';

/// **GetBlockedMessageSenders** *(getBlockedMessageSenders)* - TDLib function
///
/// Returns users and chats that were blocked by the current user.
///
/// * [blockList]: Block list from which to return users.
/// * [offset]: Number of users and chats to skip in the result; must be non-negative.
/// * [limit]: The maximum number of users and chats to return; up to 100.
///
/// [MessageSenders] is returned on completion.
final class GetBlockedMessageSenders extends TdFunction {
  /// **GetBlockedMessageSenders** *(getBlockedMessageSenders)* - TDLib function
  ///
  /// Returns users and chats that were blocked by the current user.
  ///
  /// * [blockList]: Block list from which to return users.
  /// * [offset]: Number of users and chats to skip in the result; must be non-negative.
  /// * [limit]: The maximum number of users and chats to return; up to 100.
  ///
  /// [MessageSenders] is returned on completion.
  const GetBlockedMessageSenders({
    required this.blockList,
    required this.offset,
    required this.limit,
  });

  /// Block list from which to return users
  final BlockList blockList;

  /// Number of users and chats to skip in the result; must be non-negative
  final int offset;

  /// The maximum number of users and chats to return; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "block_list": blockList.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [block_list]: Block list from which to return users
  /// * [offset]: Number of users and chats to skip in the result; must be non-negative
  /// * [limit]: The maximum number of users and chats to return; up to 100
  GetBlockedMessageSenders copyWith({
    BlockList? blockList,
    int? offset,
    int? limit,
  }) =>
      GetBlockedMessageSenders(
        blockList: blockList ?? this.blockList,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBlockedMessageSenders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
