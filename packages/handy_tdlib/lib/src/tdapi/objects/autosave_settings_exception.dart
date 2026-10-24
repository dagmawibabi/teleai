part of '../tdapi.dart';

/// **AutosaveSettingsException** *(autosaveSettingsException)* - basic class
///
/// Contains autosave settings for a chat, which overrides default settings for the corresponding scope.
///
/// * [chatId]: Chat identifier.
/// * [settings]: Autosave settings for the chat.
final class AutosaveSettingsException extends TdObject {
  /// **AutosaveSettingsException** *(autosaveSettingsException)* - basic class
  ///
  /// Contains autosave settings for a chat, which overrides default settings for the corresponding scope.
  ///
  /// * [chatId]: Chat identifier.
  /// * [settings]: Autosave settings for the chat.
  const AutosaveSettingsException({
    required this.chatId,
    required this.settings,
  });

  /// Chat identifier
  final int chatId;

  /// Autosave settings for the chat
  final ScopeAutosaveSettings settings;

  /// Parse from a json
  factory AutosaveSettingsException.fromJson(Map<String, dynamic> json) =>
      AutosaveSettingsException(
        chatId: json['chat_id'],
        settings: ScopeAutosaveSettings.fromJson(json['settings']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "settings": settings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [settings]: Autosave settings for the chat
  AutosaveSettingsException copyWith({
    int? chatId,
    ScopeAutosaveSettings? settings,
  }) =>
      AutosaveSettingsException(
        chatId: chatId ?? this.chatId,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'autosaveSettingsException';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
