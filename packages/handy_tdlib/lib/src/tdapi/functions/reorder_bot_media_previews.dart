part of '../tdapi.dart';

/// **ReorderBotMediaPreviews** *(reorderBotMediaPreviews)* - TDLib function
///
/// Changes order of media previews in the list of media previews of a bot.
///
/// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
/// * [languageCode]: Language code of the media previews to reorder.
/// * [fileIds]: File identifiers of the media in the new order.
///
/// [Ok] is returned on completion.
final class ReorderBotMediaPreviews extends TdFunction {
  /// **ReorderBotMediaPreviews** *(reorderBotMediaPreviews)* - TDLib function
  ///
  /// Changes order of media previews in the list of media previews of a bot.
  ///
  /// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
  /// * [languageCode]: Language code of the media previews to reorder.
  /// * [fileIds]: File identifiers of the media in the new order.
  ///
  /// [Ok] is returned on completion.
  const ReorderBotMediaPreviews({
    required this.botUserId,
    required this.languageCode,
    required this.fileIds,
  });

  /// Identifier of the target bot. The bot must be owned and must have the main Web App
  final int botUserId;

  /// Language code of the media previews to reorder
  final String languageCode;

  /// File identifiers of the media in the new order
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
  /// * [language_code]: Language code of the media previews to reorder
  /// * [file_ids]: File identifiers of the media in the new order
  ReorderBotMediaPreviews copyWith({
    int? botUserId,
    String? languageCode,
    List<int>? fileIds,
  }) =>
      ReorderBotMediaPreviews(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        fileIds: fileIds ?? this.fileIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderBotMediaPreviews';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
