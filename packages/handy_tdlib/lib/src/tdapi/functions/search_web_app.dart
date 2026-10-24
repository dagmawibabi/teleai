part of '../tdapi.dart';

/// **SearchWebApp** *(searchWebApp)* - TDLib function
///
/// Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found.
///
/// * [botUserId]: Identifier of the target bot.
/// * [webAppShortName]: Short name of the Web App.
///
/// [FoundWebApp] is returned on completion.
final class SearchWebApp extends TdFunction {
  /// **SearchWebApp** *(searchWebApp)* - TDLib function
  ///
  /// Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [webAppShortName]: Short name of the Web App.
  ///
  /// [FoundWebApp] is returned on completion.
  const SearchWebApp({
    required this.botUserId,
    required this.webAppShortName,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// Short name of the Web App
  final String webAppShortName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "web_app_short_name": webAppShortName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [web_app_short_name]: Short name of the Web App
  SearchWebApp copyWith({
    int? botUserId,
    String? webAppShortName,
  }) =>
      SearchWebApp(
        botUserId: botUserId ?? this.botUserId,
        webAppShortName: webAppShortName ?? this.webAppShortName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
