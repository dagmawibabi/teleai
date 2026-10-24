part of '../tdapi.dart';

/// **ClearAllDraftMessages** *(clearAllDraftMessages)* - TDLib function
///
/// Clears message drafts in all chats.
///
/// * [excludeSecretChats]: Pass true to keep local message drafts in secret chats.
///
/// [Ok] is returned on completion.
final class ClearAllDraftMessages extends TdFunction {
  /// **ClearAllDraftMessages** *(clearAllDraftMessages)* - TDLib function
  ///
  /// Clears message drafts in all chats.
  ///
  /// * [excludeSecretChats]: Pass true to keep local message drafts in secret chats.
  ///
  /// [Ok] is returned on completion.
  const ClearAllDraftMessages({
    required this.excludeSecretChats,
  });

  /// Pass true to keep local message drafts in secret chats
  final bool excludeSecretChats;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "exclude_secret_chats": excludeSecretChats,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [exclude_secret_chats]: Pass true to keep local message drafts in secret chats
  ClearAllDraftMessages copyWith({
    bool? excludeSecretChats,
  }) =>
      ClearAllDraftMessages(
        excludeSecretChats: excludeSecretChats ?? this.excludeSecretChats,
      );

  /// TDLib object type
  static const String defaultObjectId = 'clearAllDraftMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
