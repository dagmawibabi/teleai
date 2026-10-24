part of '../tdapi.dart';

/// **SendWebAppCustomRequest** *(sendWebAppCustomRequest)* - TDLib function
///
/// Sends a custom request from a Web App.
///
/// * [botUserId]: Identifier of the bot.
/// * [method]: The method name.
/// * [parameters]: JSON-serialized method parameters.
///
/// [CustomRequestResult] is returned on completion.
final class SendWebAppCustomRequest extends TdFunction {
  /// **SendWebAppCustomRequest** *(sendWebAppCustomRequest)* - TDLib function
  ///
  /// Sends a custom request from a Web App.
  ///
  /// * [botUserId]: Identifier of the bot.
  /// * [method]: The method name.
  /// * [parameters]: JSON-serialized method parameters.
  ///
  /// [CustomRequestResult] is returned on completion.
  const SendWebAppCustomRequest({
    required this.botUserId,
    required this.method,
    required this.parameters,
  });

  /// Identifier of the bot
  final int botUserId;

  /// The method name
  final String method;

  /// JSON-serialized method parameters
  final String parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "method": method,
      "parameters": parameters,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot
  /// * [method]: The method name
  /// * [parameters]: JSON-serialized method parameters
  SendWebAppCustomRequest copyWith({
    int? botUserId,
    String? method,
    String? parameters,
  }) =>
      SendWebAppCustomRequest(
        botUserId: botUserId ?? this.botUserId,
        method: method ?? this.method,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendWebAppCustomRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
