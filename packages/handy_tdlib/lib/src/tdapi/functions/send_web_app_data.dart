part of '../tdapi.dart';

/// **SendWebAppData** *(sendWebAppData)* - TDLib function
///
/// Sends data received from a keyboardButtonTypeWebApp Web App to a bot.
///
/// * [botUserId]: Identifier of the target bot.
/// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
/// * [data]: The data.
///
/// [Ok] is returned on completion.
final class SendWebAppData extends TdFunction {
  /// **SendWebAppData** *(sendWebAppData)* - TDLib function
  ///
  /// Sends data received from a keyboardButtonTypeWebApp Web App to a bot.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
  /// * [data]: The data.
  ///
  /// [Ok] is returned on completion.
  const SendWebAppData({
    required this.botUserId,
    required this.buttonText,
    required this.data,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// Text of the keyboardButtonTypeWebApp button, which opened the Web App
  final String buttonText;

  /// The data
  final String data;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "button_text": buttonText,
      "data": data,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [button_text]: Text of the keyboardButtonTypeWebApp button, which opened the Web App
  /// * [data]: The data
  SendWebAppData copyWith({
    int? botUserId,
    String? buttonText,
    String? data,
  }) =>
      SendWebAppData(
        botUserId: botUserId ?? this.botUserId,
        buttonText: buttonText ?? this.buttonText,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendWebAppData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
