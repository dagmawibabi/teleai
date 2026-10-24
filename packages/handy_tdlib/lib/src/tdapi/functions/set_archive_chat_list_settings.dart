part of '../tdapi.dart';

/// **SetArchiveChatListSettings** *(setArchiveChatListSettings)* - TDLib function
///
/// Changes settings for automatic moving of chats to and from the Archive chat lists.
///
/// * [settings]: New settings.
///
/// [Ok] is returned on completion.
final class SetArchiveChatListSettings extends TdFunction {
  /// **SetArchiveChatListSettings** *(setArchiveChatListSettings)* - TDLib function
  ///
  /// Changes settings for automatic moving of chats to and from the Archive chat lists.
  ///
  /// * [settings]: New settings.
  ///
  /// [Ok] is returned on completion.
  const SetArchiveChatListSettings({
    required this.settings,
  });

  /// New settings
  final ArchiveChatListSettings settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "settings": settings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [settings]: New settings
  SetArchiveChatListSettings copyWith({
    ArchiveChatListSettings? settings,
  }) =>
      SetArchiveChatListSettings(
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setArchiveChatListSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
