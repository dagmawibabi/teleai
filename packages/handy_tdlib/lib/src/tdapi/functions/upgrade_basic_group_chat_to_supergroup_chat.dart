part of '../tdapi.dart';

/// **UpgradeBasicGroupChatToSupergroupChat** *(upgradeBasicGroupChatToSupergroupChat)* - TDLib function
///
/// Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires owner privileges.. Deactivates the original basic group.
///
/// * [chatId]: Identifier of the chat to upgrade.
///
/// [Chat] is returned on completion.
final class UpgradeBasicGroupChatToSupergroupChat extends TdFunction {
  /// **UpgradeBasicGroupChatToSupergroupChat** *(upgradeBasicGroupChatToSupergroupChat)* - TDLib function
  ///
  /// Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires owner privileges.. Deactivates the original basic group.
  ///
  /// * [chatId]: Identifier of the chat to upgrade.
  ///
  /// [Chat] is returned on completion.
  const UpgradeBasicGroupChatToSupergroupChat({
    required this.chatId,
  });

  /// Identifier of the chat to upgrade
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to upgrade
  UpgradeBasicGroupChatToSupergroupChat copyWith({
    int? chatId,
  }) =>
      UpgradeBasicGroupChatToSupergroupChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradeBasicGroupChatToSupergroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
