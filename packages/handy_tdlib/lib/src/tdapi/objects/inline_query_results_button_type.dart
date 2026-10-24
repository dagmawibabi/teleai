part of '../tdapi.dart';

/// **InlineQueryResultsButtonType** *(inlineQueryResultsButtonType)* - parent
///
/// Represents type of button in results of inline query.
sealed class InlineQueryResultsButtonType extends TdObject {
  /// **InlineQueryResultsButtonType** *(inlineQueryResultsButtonType)* - parent
  ///
  /// Represents type of button in results of inline query.
  const InlineQueryResultsButtonType();

  /// a InlineQueryResultsButtonType return type can be :
  /// * [InlineQueryResultsButtonTypeStartBot]
  /// * [InlineQueryResultsButtonTypeWebApp]
  factory InlineQueryResultsButtonType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InlineQueryResultsButtonTypeStartBot.defaultObjectId:
        return InlineQueryResultsButtonTypeStartBot.fromJson(json);
      case InlineQueryResultsButtonTypeWebApp.defaultObjectId:
        return InlineQueryResultsButtonTypeWebApp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InlineQueryResultsButtonType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InlineQueryResultsButtonType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultsButtonType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultsButtonTypeStartBot** *(inlineQueryResultsButtonTypeStartBot)* - child of InlineQueryResultsButtonType
///
/// Describes the button that opens a private chat with the bot and sends a start message to the bot with the given parameter.
///
/// * [parameter]: The parameter for the bot start message.
final class InlineQueryResultsButtonTypeStartBot
    extends InlineQueryResultsButtonType {
  /// **InlineQueryResultsButtonTypeStartBot** *(inlineQueryResultsButtonTypeStartBot)* - child of InlineQueryResultsButtonType
  ///
  /// Describes the button that opens a private chat with the bot and sends a start message to the bot with the given parameter.
  ///
  /// * [parameter]: The parameter for the bot start message.
  const InlineQueryResultsButtonTypeStartBot({
    required this.parameter,
  });

  /// The parameter for the bot start message
  final String parameter;

  /// Parse from a json
  factory InlineQueryResultsButtonTypeStartBot.fromJson(
          Map<String, dynamic> json) =>
      InlineQueryResultsButtonTypeStartBot(
        parameter: json['parameter'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameter": parameter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameter]: The parameter for the bot start message
  @override
  InlineQueryResultsButtonTypeStartBot copyWith({
    String? parameter,
  }) =>
      InlineQueryResultsButtonTypeStartBot(
        parameter: parameter ?? this.parameter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultsButtonTypeStartBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultsButtonTypeWebApp** *(inlineQueryResultsButtonTypeWebApp)* - child of InlineQueryResultsButtonType
///
/// Describes the button that opens a Web App by calling getWebAppUrl.
///
/// * [url]: An HTTP URL to pass to getWebAppUrl.
final class InlineQueryResultsButtonTypeWebApp
    extends InlineQueryResultsButtonType {
  /// **InlineQueryResultsButtonTypeWebApp** *(inlineQueryResultsButtonTypeWebApp)* - child of InlineQueryResultsButtonType
  ///
  /// Describes the button that opens a Web App by calling getWebAppUrl.
  ///
  /// * [url]: An HTTP URL to pass to getWebAppUrl.
  const InlineQueryResultsButtonTypeWebApp({
    required this.url,
  });

  /// An HTTP URL to pass to getWebAppUrl
  final String url;

  /// Parse from a json
  factory InlineQueryResultsButtonTypeWebApp.fromJson(
          Map<String, dynamic> json) =>
      InlineQueryResultsButtonTypeWebApp(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: An HTTP URL to pass to getWebAppUrl
  @override
  InlineQueryResultsButtonTypeWebApp copyWith({
    String? url,
  }) =>
      InlineQueryResultsButtonTypeWebApp(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultsButtonTypeWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
