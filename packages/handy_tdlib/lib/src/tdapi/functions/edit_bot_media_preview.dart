part of '../tdapi.dart';

/// **EditBotMediaPreview** *(editBotMediaPreview)* - TDLib function
///
/// Replaces media preview in the list of media previews of a bot. Returns the new preview after edit is completed server-side.
///
/// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
/// * [languageCode]: Language code of the media preview to edit.
/// * [fileId]: File identifier of the media to replace.
/// * [content]: Content of the new preview.
///
/// [BotMediaPreview] is returned on completion.
final class EditBotMediaPreview extends TdFunction {
  /// **EditBotMediaPreview** *(editBotMediaPreview)* - TDLib function
  ///
  /// Replaces media preview in the list of media previews of a bot. Returns the new preview after edit is completed server-side.
  ///
  /// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
  /// * [languageCode]: Language code of the media preview to edit.
  /// * [fileId]: File identifier of the media to replace.
  /// * [content]: Content of the new preview.
  ///
  /// [BotMediaPreview] is returned on completion.
  const EditBotMediaPreview({
    required this.botUserId,
    required this.languageCode,
    required this.fileId,
    required this.content,
  });

  /// Identifier of the target bot. The bot must be owned and must have the main Web App
  final int botUserId;

  /// Language code of the media preview to edit
  final String languageCode;

  /// File identifier of the media to replace
  final int fileId;

  /// Content of the new preview
  final InputStoryContent content;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "file_id": fileId,
      "content": content.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot. The bot must be owned and must have the main Web App
  /// * [language_code]: Language code of the media preview to edit
  /// * [file_id]: File identifier of the media to replace
  /// * [content]: Content of the new preview
  EditBotMediaPreview copyWith({
    int? botUserId,
    String? languageCode,
    int? fileId,
    InputStoryContent? content,
  }) =>
      EditBotMediaPreview(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        fileId: fileId ?? this.fileId,
        content: content ?? this.content,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBotMediaPreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
