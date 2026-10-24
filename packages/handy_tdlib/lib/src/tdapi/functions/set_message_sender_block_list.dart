part of '../tdapi.dart';

/// **SetMessageSenderBlockList** *(setMessageSenderBlockList)* - TDLib function
///
/// Changes the block list of a message sender. Currently, only users and supergroup chats can be blocked.
///
/// * [senderId]: Identifier of a message sender to block/unblock.
/// * [blockList]: New block list for the message sender; pass null to unblock the message sender *(optional)*.
///
/// [Ok] is returned on completion.
final class SetMessageSenderBlockList extends TdFunction {
  /// **SetMessageSenderBlockList** *(setMessageSenderBlockList)* - TDLib function
  ///
  /// Changes the block list of a message sender. Currently, only users and supergroup chats can be blocked.
  ///
  /// * [senderId]: Identifier of a message sender to block/unblock.
  /// * [blockList]: New block list for the message sender; pass null to unblock the message sender *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetMessageSenderBlockList({
    required this.senderId,
    this.blockList,
  });

  /// Identifier of a message sender to block/unblock
  final MessageSender senderId;

  /// New block list for the message sender; pass null to unblock the message sender
  final BlockList? blockList;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId.toJson(),
      "block_list": blockList?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of a message sender to block/unblock
  /// * [block_list]: New block list for the message sender; pass null to unblock the message sender
  SetMessageSenderBlockList copyWith({
    MessageSender? senderId,
    BlockList? blockList,
  }) =>
      SetMessageSenderBlockList(
        senderId: senderId ?? this.senderId,
        blockList: blockList ?? this.blockList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMessageSenderBlockList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
