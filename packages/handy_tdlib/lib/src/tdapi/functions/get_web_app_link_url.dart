part of '../tdapi.dart';

/// **GetWebAppLinkUrl** *(getWebAppLinkUrl)* - TDLib function
///
/// Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked.
///
/// * [chatId]: Identifier of the chat in which the link was clicked; pass 0 if none.
/// * [botUserId]: Identifier of the target bot.
/// * [webAppShortName]: Short name of the Web App.
/// * [startParameter]: Start parameter from internalLinkTypeWebApp.
/// * [allowWriteAccess]: Pass true if the current user allowed the bot to send them messages.
/// * [parameters]: Parameters to use to open the Web App.
///
/// [WebAppUrl] is returned on completion.
final class GetWebAppLinkUrl extends TdFunction {
  /// **GetWebAppLinkUrl** *(getWebAppLinkUrl)* - TDLib function
  ///
  /// Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked.
  ///
  /// * [chatId]: Identifier of the chat in which the link was clicked; pass 0 if none.
  /// * [botUserId]: Identifier of the target bot.
  /// * [webAppShortName]: Short name of the Web App.
  /// * [startParameter]: Start parameter from internalLinkTypeWebApp.
  /// * [allowWriteAccess]: Pass true if the current user allowed the bot to send them messages.
  /// * [parameters]: Parameters to use to open the Web App.
  ///
  /// [WebAppUrl] is returned on completion.
  const GetWebAppLinkUrl({
    required this.chatId,
    required this.botUserId,
    required this.webAppShortName,
    required this.startParameter,
    required this.allowWriteAccess,
    required this.parameters,
  });

  /// Identifier of the chat in which the link was clicked; pass 0 if none
  final int chatId;

  /// Identifier of the target bot
  final int botUserId;

  /// Short name of the Web App
  final String webAppShortName;

  /// Start parameter from internalLinkTypeWebApp
  final String startParameter;

  /// Pass true if the current user allowed the bot to send them messages
  final bool allowWriteAccess;

  /// Parameters to use to open the Web App
  final WebAppOpenParameters parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "bot_user_id": botUserId,
      "web_app_short_name": webAppShortName,
      "start_parameter": startParameter,
      "allow_write_access": allowWriteAccess,
      "parameters": parameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which the link was clicked; pass 0 if none
  /// * [bot_user_id]: Identifier of the target bot
  /// * [web_app_short_name]: Short name of the Web App
  /// * [start_parameter]: Start parameter from internalLinkTypeWebApp
  /// * [allow_write_access]: Pass true if the current user allowed the bot to send them messages
  /// * [parameters]: Parameters to use to open the Web App
  GetWebAppLinkUrl copyWith({
    int? chatId,
    int? botUserId,
    String? webAppShortName,
    String? startParameter,
    bool? allowWriteAccess,
    WebAppOpenParameters? parameters,
  }) =>
      GetWebAppLinkUrl(
        chatId: chatId ?? this.chatId,
        botUserId: botUserId ?? this.botUserId,
        webAppShortName: webAppShortName ?? this.webAppShortName,
        startParameter: startParameter ?? this.startParameter,
        allowWriteAccess: allowWriteAccess ?? this.allowWriteAccess,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getWebAppLinkUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
