part of '../tdapi.dart';

/// **FoundWebApp** *(foundWebApp)* - basic class
///
/// Contains information about a Web App found by its short name.
///
/// * [webApp]: The Web App.
/// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
/// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden.
final class FoundWebApp extends TdObject {
  /// **FoundWebApp** *(foundWebApp)* - basic class
  ///
  /// Contains information about a Web App found by its short name.
  ///
  /// * [webApp]: The Web App.
  /// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
  /// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden.
  const FoundWebApp({
    required this.webApp,
    required this.requestWriteAccess,
    required this.skipConfirmation,
    this.extra,
    this.clientId,
  });

  /// The Web App
  final WebApp webApp;

  /// True, if the user must be asked for the permission to the bot to send them messages
  final bool requestWriteAccess;

  /// True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden
  final bool skipConfirmation;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundWebApp.fromJson(Map<String, dynamic> json) => FoundWebApp(
        webApp: WebApp.fromJson(json['web_app']),
        requestWriteAccess: json['request_write_access'],
        skipConfirmation: json['skip_confirmation'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "web_app": webApp.toJson(),
      "request_write_access": requestWriteAccess,
      "skip_confirmation": skipConfirmation,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [web_app]: The Web App
  /// * [request_write_access]: True, if the user must be asked for the permission to the bot to send them messages
  /// * [skip_confirmation]: True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden
  FoundWebApp copyWith({
    WebApp? webApp,
    bool? requestWriteAccess,
    bool? skipConfirmation,
    dynamic extra,
    int? clientId,
  }) =>
      FoundWebApp(
        webApp: webApp ?? this.webApp,
        requestWriteAccess: requestWriteAccess ?? this.requestWriteAccess,
        skipConfirmation: skipConfirmation ?? this.skipConfirmation,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
