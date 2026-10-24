part of '../tdapi.dart';

/// **GetMainWebApp** *(getMainWebApp)* - TDLib function
///
/// Returns information needed to open the main Web App of a bot.
///
/// * [chatId]: Identifier of the chat in which the Web App is opened; pass 0 if none.
/// * [botUserId]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method.
/// * [startParameter]: Start parameter from internalLinkTypeMainWebApp.
/// * [parameters]: Parameters to use to open the Web App.
///
/// [MainWebApp] is returned on completion.
final class GetMainWebApp extends TdFunction {
  /// **GetMainWebApp** *(getMainWebApp)* - TDLib function
  ///
  /// Returns information needed to open the main Web App of a bot.
  ///
  /// * [chatId]: Identifier of the chat in which the Web App is opened; pass 0 if none.
  /// * [botUserId]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method.
  /// * [startParameter]: Start parameter from internalLinkTypeMainWebApp.
  /// * [parameters]: Parameters to use to open the Web App.
  ///
  /// [MainWebApp] is returned on completion.
  const GetMainWebApp({
    required this.chatId,
    required this.botUserId,
    required this.startParameter,
    required this.parameters,
  });

  /// Identifier of the chat in which the Web App is opened; pass 0 if none
  final int chatId;

  /// Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method
  final int botUserId;

  /// Start parameter from internalLinkTypeMainWebApp
  final String startParameter;

  /// Parameters to use to open the Web App
  final WebAppOpenParameters parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "bot_user_id": botUserId,
      "start_parameter": startParameter,
      "parameters": parameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which the Web App is opened; pass 0 if none
  /// * [bot_user_id]: Identifier of the target bot. If the bot is restricted for the current user, then show an error instead of calling the method
  /// * [start_parameter]: Start parameter from internalLinkTypeMainWebApp
  /// * [parameters]: Parameters to use to open the Web App
  GetMainWebApp copyWith({
    int? chatId,
    int? botUserId,
    String? startParameter,
    WebAppOpenParameters? parameters,
  }) =>
      GetMainWebApp(
        chatId: chatId ?? this.chatId,
        botUserId: botUserId ?? this.botUserId,
        startParameter: startParameter ?? this.startParameter,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMainWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
