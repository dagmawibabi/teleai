part of '../tdapi.dart';

/// **BusinessRecipients** *(businessRecipients)* - basic class
///
/// Describes private chats chosen for automatic interaction with a business.
///
/// * [chatIds]: Identifiers of selected private chats.
/// * [excludedChatIds]: Identifiers of private chats that are always excluded; for businessConnectedBot only.
/// * [selectExistingChats]: True, if all existing private chats are selected.
/// * [selectNewChats]: True, if all new private chats are selected.
/// * [selectContacts]: True, if all private chats with contacts are selected.
/// * [selectNonContacts]: True, if all private chats with non-contacts are selected.
/// * [excludeSelected]: If true, then all private chats except the selected are chosen. Otherwise, only the selected chats are chosen.
final class BusinessRecipients extends TdObject {
  /// **BusinessRecipients** *(businessRecipients)* - basic class
  ///
  /// Describes private chats chosen for automatic interaction with a business.
  ///
  /// * [chatIds]: Identifiers of selected private chats.
  /// * [excludedChatIds]: Identifiers of private chats that are always excluded; for businessConnectedBot only.
  /// * [selectExistingChats]: True, if all existing private chats are selected.
  /// * [selectNewChats]: True, if all new private chats are selected.
  /// * [selectContacts]: True, if all private chats with contacts are selected.
  /// * [selectNonContacts]: True, if all private chats with non-contacts are selected.
  /// * [excludeSelected]: If true, then all private chats except the selected are chosen. Otherwise, only the selected chats are chosen.
  const BusinessRecipients({
    required this.chatIds,
    required this.excludedChatIds,
    required this.selectExistingChats,
    required this.selectNewChats,
    required this.selectContacts,
    required this.selectNonContacts,
    required this.excludeSelected,
  });

  /// Identifiers of selected private chats
  final List<int> chatIds;

  /// Identifiers of private chats that are always excluded; for businessConnectedBot only
  final List<int> excludedChatIds;

  /// True, if all existing private chats are selected
  final bool selectExistingChats;

  /// True, if all new private chats are selected
  final bool selectNewChats;

  /// True, if all private chats with contacts are selected
  final bool selectContacts;

  /// True, if all private chats with non-contacts are selected
  final bool selectNonContacts;

  /// If true, then all private chats except the selected are chosen. Otherwise, only the selected chats are chosen
  final bool excludeSelected;

  /// Parse from a json
  factory BusinessRecipients.fromJson(Map<String, dynamic> json) =>
      BusinessRecipients(
        chatIds: List<int>.from(
            (json['chat_ids'] ?? []).map((item) => item).toList()),
        excludedChatIds: List<int>.from(
            (json['excluded_chat_ids'] ?? []).map((item) => item).toList()),
        selectExistingChats: json['select_existing_chats'],
        selectNewChats: json['select_new_chats'],
        selectContacts: json['select_contacts'],
        selectNonContacts: json['select_non_contacts'],
        excludeSelected: json['exclude_selected'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_ids": chatIds.map((i) => i).toList(),
      "excluded_chat_ids": excludedChatIds.map((i) => i).toList(),
      "select_existing_chats": selectExistingChats,
      "select_new_chats": selectNewChats,
      "select_contacts": selectContacts,
      "select_non_contacts": selectNonContacts,
      "exclude_selected": excludeSelected,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_ids]: Identifiers of selected private chats
  /// * [excluded_chat_ids]: Identifiers of private chats that are always excluded; for businessConnectedBot only
  /// * [select_existing_chats]: True, if all existing private chats are selected
  /// * [select_new_chats]: True, if all new private chats are selected
  /// * [select_contacts]: True, if all private chats with contacts are selected
  /// * [select_non_contacts]: True, if all private chats with non-contacts are selected
  /// * [exclude_selected]: If true, then all private chats except the selected are chosen. Otherwise, only the selected chats are chosen
  BusinessRecipients copyWith({
    List<int>? chatIds,
    List<int>? excludedChatIds,
    bool? selectExistingChats,
    bool? selectNewChats,
    bool? selectContacts,
    bool? selectNonContacts,
    bool? excludeSelected,
  }) =>
      BusinessRecipients(
        chatIds: chatIds ?? this.chatIds,
        excludedChatIds: excludedChatIds ?? this.excludedChatIds,
        selectExistingChats: selectExistingChats ?? this.selectExistingChats,
        selectNewChats: selectNewChats ?? this.selectNewChats,
        selectContacts: selectContacts ?? this.selectContacts,
        selectNonContacts: selectNonContacts ?? this.selectNonContacts,
        excludeSelected: excludeSelected ?? this.excludeSelected,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessRecipients';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
