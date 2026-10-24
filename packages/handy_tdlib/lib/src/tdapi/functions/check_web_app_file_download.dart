part of '../tdapi.dart';

/// **CheckWebAppFileDownload** *(checkWebAppFileDownload)* - TDLib function
///
/// Checks whether a file can be downloaded and saved locally by Web App request.
///
/// * [botUserId]: Identifier of the bot, providing the Web App.
/// * [fileName]: Name of the file.
/// * [url]: URL of the file.
///
/// [Ok] is returned on completion.
final class CheckWebAppFileDownload extends TdFunction {
  /// **CheckWebAppFileDownload** *(checkWebAppFileDownload)* - TDLib function
  ///
  /// Checks whether a file can be downloaded and saved locally by Web App request.
  ///
  /// * [botUserId]: Identifier of the bot, providing the Web App.
  /// * [fileName]: Name of the file.
  /// * [url]: URL of the file.
  ///
  /// [Ok] is returned on completion.
  const CheckWebAppFileDownload({
    required this.botUserId,
    required this.fileName,
    required this.url,
  });

  /// Identifier of the bot, providing the Web App
  final int botUserId;

  /// Name of the file
  final String fileName;

  /// URL of the file
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "file_name": fileName,
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot, providing the Web App
  /// * [file_name]: Name of the file
  /// * [url]: URL of the file
  CheckWebAppFileDownload copyWith({
    int? botUserId,
    String? fileName,
    String? url,
  }) =>
      CheckWebAppFileDownload(
        botUserId: botUserId ?? this.botUserId,
        fileName: fileName ?? this.fileName,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkWebAppFileDownload';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
