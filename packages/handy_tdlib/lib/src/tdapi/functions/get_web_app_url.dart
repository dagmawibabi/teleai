part of '../tdapi.dart';

/// **GetWebAppUrl** *(getWebAppUrl)* - TDLib function
///
/// Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, or an inlineQueryResultsButtonTypeWebApp button.
///
/// * [botUserId]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method.
/// * [url]: The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, or an empty string when the bot is opened from the side menu.
/// * [parameters]: Parameters to use to open the Web App.
///
/// [WebAppUrl] is returned on completion.
final class GetWebAppUrl extends TdFunction {
  /// **GetWebAppUrl** *(getWebAppUrl)* - TDLib function
  ///
  /// Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, or an inlineQueryResultsButtonTypeWebApp button.
  ///
  /// * [botUserId]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method.
  /// * [url]: The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, or an empty string when the bot is opened from the side menu.
  /// * [parameters]: Parameters to use to open the Web App.
  ///
  /// [WebAppUrl] is returned on completion.
  const GetWebAppUrl({
    required this.botUserId,
    required this.url,
    required this.parameters,
  });

  /// Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method
  final int botUserId;

  /// The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, or an empty string when the bot is opened from the side menu
  final String url;

  /// Parameters to use to open the Web App
  final WebAppOpenParameters parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "url": url,
      "parameters": parameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method
  /// * [url]: The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, or an empty string when the bot is opened from the side menu
  /// * [parameters]: Parameters to use to open the Web App
  GetWebAppUrl copyWith({
    int? botUserId,
    String? url,
    WebAppOpenParameters? parameters,
  }) =>
      GetWebAppUrl(
        botUserId: botUserId ?? this.botUserId,
        url: url ?? this.url,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getWebAppUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
