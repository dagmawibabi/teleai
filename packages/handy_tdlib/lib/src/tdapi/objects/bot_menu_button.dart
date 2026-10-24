part of '../tdapi.dart';

/// **BotMenuButton** *(botMenuButton)* - basic class
///
/// Describes a button to be shown instead of bot commands menu button.
///
/// * [text]: Text of the button.
/// * [url]: URL of a Web App to open when the button is pressed. If the link is of the type internalLinkTypeWebApp, then it must be processed accordingly. Otherwise, the link must be passed to openWebApp.
final class BotMenuButton extends TdObject {
  /// **BotMenuButton** *(botMenuButton)* - basic class
  ///
  /// Describes a button to be shown instead of bot commands menu button.
  ///
  /// * [text]: Text of the button.
  /// * [url]: URL of a Web App to open when the button is pressed. If the link is of the type internalLinkTypeWebApp, then it must be processed accordingly. Otherwise, the link must be passed to openWebApp.
  const BotMenuButton({
    required this.text,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// Text of the button
  final String text;

  /// URL of a Web App to open when the button is pressed. If the link is of the type internalLinkTypeWebApp, then it must be processed accordingly. Otherwise, the link must be passed to openWebApp
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BotMenuButton.fromJson(Map<String, dynamic> json) => BotMenuButton(
        text: json['text'],
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the button
  /// * [url]: URL of a Web App to open when the button is pressed. If the link is of the type internalLinkTypeWebApp, then it must be processed accordingly. Otherwise, the link must be passed to openWebApp
  BotMenuButton copyWith({
    String? text,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      BotMenuButton(
        text: text ?? this.text,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botMenuButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
