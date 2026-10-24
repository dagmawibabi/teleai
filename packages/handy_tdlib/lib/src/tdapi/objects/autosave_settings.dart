part of '../tdapi.dart';

/// **AutosaveSettings** *(autosaveSettings)* - basic class
///
/// Describes autosave settings.
///
/// * [privateChatSettings]: Default autosave settings for private chats.
/// * [groupSettings]: Default autosave settings for basic group and supergroup chats.
/// * [channelSettings]: Default autosave settings for channel chats.
/// * [exceptions]: Autosave settings for specific chats.
final class AutosaveSettings extends TdObject {
  /// **AutosaveSettings** *(autosaveSettings)* - basic class
  ///
  /// Describes autosave settings.
  ///
  /// * [privateChatSettings]: Default autosave settings for private chats.
  /// * [groupSettings]: Default autosave settings for basic group and supergroup chats.
  /// * [channelSettings]: Default autosave settings for channel chats.
  /// * [exceptions]: Autosave settings for specific chats.
  const AutosaveSettings({
    required this.privateChatSettings,
    required this.groupSettings,
    required this.channelSettings,
    required this.exceptions,
    this.extra,
    this.clientId,
  });

  /// Default autosave settings for private chats
  final ScopeAutosaveSettings privateChatSettings;

  /// Default autosave settings for basic group and supergroup chats
  final ScopeAutosaveSettings groupSettings;

  /// Default autosave settings for channel chats
  final ScopeAutosaveSettings channelSettings;

  /// Autosave settings for specific chats
  final List<AutosaveSettingsException> exceptions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AutosaveSettings.fromJson(Map<String, dynamic> json) =>
      AutosaveSettings(
        privateChatSettings:
            ScopeAutosaveSettings.fromJson(json['private_chat_settings']),
        groupSettings: ScopeAutosaveSettings.fromJson(json['group_settings']),
        channelSettings:
            ScopeAutosaveSettings.fromJson(json['channel_settings']),
        exceptions: List<AutosaveSettingsException>.from(
            (json['exceptions'] ?? [])
                .map((item) => AutosaveSettingsException.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "private_chat_settings": privateChatSettings.toJson(),
      "group_settings": groupSettings.toJson(),
      "channel_settings": channelSettings.toJson(),
      "exceptions": exceptions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [private_chat_settings]: Default autosave settings for private chats
  /// * [group_settings]: Default autosave settings for basic group and supergroup chats
  /// * [channel_settings]: Default autosave settings for channel chats
  /// * [exceptions]: Autosave settings for specific chats
  AutosaveSettings copyWith({
    ScopeAutosaveSettings? privateChatSettings,
    ScopeAutosaveSettings? groupSettings,
    ScopeAutosaveSettings? channelSettings,
    List<AutosaveSettingsException>? exceptions,
    dynamic extra,
    int? clientId,
  }) =>
      AutosaveSettings(
        privateChatSettings: privateChatSettings ?? this.privateChatSettings,
        groupSettings: groupSettings ?? this.groupSettings,
        channelSettings: channelSettings ?? this.channelSettings,
        exceptions: exceptions ?? this.exceptions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'autosaveSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
