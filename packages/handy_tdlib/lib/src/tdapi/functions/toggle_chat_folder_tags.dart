part of '../tdapi.dart';

/// **ToggleChatFolderTags** *(toggleChatFolderTags)* - TDLib function
///
/// Toggles whether chat folder tags are enabled.
///
/// * [areTagsEnabled]: Pass true to enable folder tags; pass false to disable them.
///
/// [Ok] is returned on completion.
final class ToggleChatFolderTags extends TdFunction {
  /// **ToggleChatFolderTags** *(toggleChatFolderTags)* - TDLib function
  ///
  /// Toggles whether chat folder tags are enabled.
  ///
  /// * [areTagsEnabled]: Pass true to enable folder tags; pass false to disable them.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatFolderTags({
    required this.areTagsEnabled,
  });

  /// Pass true to enable folder tags; pass false to disable them
  final bool areTagsEnabled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "are_tags_enabled": areTagsEnabled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [are_tags_enabled]: Pass true to enable folder tags; pass false to disable them
  ToggleChatFolderTags copyWith({
    bool? areTagsEnabled,
  }) =>
      ToggleChatFolderTags(
        areTagsEnabled: areTagsEnabled ?? this.areTagsEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatFolderTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
