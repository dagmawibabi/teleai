part of '../tdapi.dart';

/// **GetArchiveChatListSettings** *(getArchiveChatListSettings)* - TDLib function
///
/// Returns settings for automatic moving of chats to and from the Archive chat lists.
///
/// [ArchiveChatListSettings] is returned on completion.
final class GetArchiveChatListSettings extends TdFunction {
  /// **GetArchiveChatListSettings** *(getArchiveChatListSettings)* - TDLib function
  ///
  /// Returns settings for automatic moving of chats to and from the Archive chat lists.
  ///
  /// [ArchiveChatListSettings] is returned on completion.
  const GetArchiveChatListSettings();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetArchiveChatListSettings copyWith() => const GetArchiveChatListSettings();

  /// TDLib object type
  static const String defaultObjectId = 'getArchiveChatListSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
