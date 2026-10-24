part of '../tdapi.dart';

/// **DeleteBotMediaPreviews** *(deleteBotMediaPreviews)* - TDLib function
///
/// Deletes media previews from the list of media previews of a bot.
///
/// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
/// * [languageCode]: Language code of the media previews to delete.
/// * [fileIds]: File identifiers of the media to delete.
///
/// [Ok] is returned on completion.
final class DeleteBotMediaPreviews extends TdFunction {
  /// **DeleteBotMediaPreviews** *(deleteBotMediaPreviews)* - TDLib function
  ///
  /// Deletes media previews from the list of media previews of a bot.
  ///
  /// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
  /// * [languageCode]: Language code of the media previews to delete.
  /// * [fileIds]: File identifiers of the media to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteBotMediaPreviews({
    required this.botUserId,
    required this.languageCode,
    required this.fileIds,
  });

  /// Identifier of the target bot. The bot must be owned and must have the main Web App
  final int botUserId;

  /// Language code of the media previews to delete
  final String languageCode;

  /// File identifiers of the media to delete
  final List<int> fileIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "file_ids": fileIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot. The bot must be owned and must have the main Web App
  /// * [language_code]: Language code of the media previews to delete
  /// * [file_ids]: File identifiers of the media to delete
  DeleteBotMediaPreviews copyWith({
    int? botUserId,
    String? languageCode,
    List<int>? fileIds,
  }) =>
      DeleteBotMediaPreviews(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        fileIds: fileIds ?? this.fileIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBotMediaPreviews';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
