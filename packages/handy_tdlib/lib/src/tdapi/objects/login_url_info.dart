part of '../tdapi.dart';

/// **LoginUrlInfo** *(loginUrlInfo)* - parent
///
/// Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl or an external link.
sealed class LoginUrlInfo extends TdObject {
  /// **LoginUrlInfo** *(loginUrlInfo)* - parent
  ///
  /// Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl or an external link.
  const LoginUrlInfo();

  /// a LoginUrlInfo return type can be :
  /// * [LoginUrlInfoOpen]
  /// * [LoginUrlInfoRequestConfirmation]
  factory LoginUrlInfo.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case LoginUrlInfoOpen.defaultObjectId:
        return LoginUrlInfoOpen.fromJson(json);
      case LoginUrlInfoRequestConfirmation.defaultObjectId:
        return LoginUrlInfoRequestConfirmation.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of LoginUrlInfo)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  LoginUrlInfo copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'loginUrlInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LoginUrlInfoOpen** *(loginUrlInfoOpen)* - child of LoginUrlInfo
///
/// An HTTP URL needs to be open.
///
/// * [url]: The URL to open.
/// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation.
final class LoginUrlInfoOpen extends LoginUrlInfo {
  /// **LoginUrlInfoOpen** *(loginUrlInfoOpen)* - child of LoginUrlInfo
  ///
  /// An HTTP URL needs to be open.
  ///
  /// * [url]: The URL to open.
  /// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation.
  const LoginUrlInfoOpen({
    required this.url,
    required this.skipConfirmation,
    this.extra,
    this.clientId,
  });

  /// The URL to open
  final String url;

  /// True, if there is no need to show an ordinary open URL confirmation
  final bool skipConfirmation;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LoginUrlInfoOpen.fromJson(Map<String, dynamic> json) =>
      LoginUrlInfoOpen(
        url: json['url'],
        skipConfirmation: json['skip_confirmation'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "skip_confirmation": skipConfirmation,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The URL to open
  /// * [skip_confirmation]: True, if there is no need to show an ordinary open URL confirmation
  @override
  LoginUrlInfoOpen copyWith({
    String? url,
    bool? skipConfirmation,
    dynamic extra,
    int? clientId,
  }) =>
      LoginUrlInfoOpen(
        url: url ?? this.url,
        skipConfirmation: skipConfirmation ?? this.skipConfirmation,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loginUrlInfoOpen';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LoginUrlInfoRequestConfirmation** *(loginUrlInfoRequestConfirmation)* - child of LoginUrlInfo
///
/// An authorization confirmation dialog needs to be shown to the user.
///
/// * [url]: An HTTP URL to be opened.
/// * [domain]: A domain of the URL.
/// * [botUserId]: User identifier of a bot linked with the website.
/// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
final class LoginUrlInfoRequestConfirmation extends LoginUrlInfo {
  /// **LoginUrlInfoRequestConfirmation** *(loginUrlInfoRequestConfirmation)* - child of LoginUrlInfo
  ///
  /// An authorization confirmation dialog needs to be shown to the user.
  ///
  /// * [url]: An HTTP URL to be opened.
  /// * [domain]: A domain of the URL.
  /// * [botUserId]: User identifier of a bot linked with the website.
  /// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
  const LoginUrlInfoRequestConfirmation({
    required this.url,
    required this.domain,
    required this.botUserId,
    required this.requestWriteAccess,
    this.extra,
    this.clientId,
  });

  /// An HTTP URL to be opened
  final String url;

  /// A domain of the URL
  final String domain;

  /// User identifier of a bot linked with the website
  final int botUserId;

  /// True, if the user must be asked for the permission to the bot to send them messages
  final bool requestWriteAccess;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LoginUrlInfoRequestConfirmation.fromJson(Map<String, dynamic> json) =>
      LoginUrlInfoRequestConfirmation(
        url: json['url'],
        domain: json['domain'],
        botUserId: json['bot_user_id'],
        requestWriteAccess: json['request_write_access'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "domain": domain,
      "bot_user_id": botUserId,
      "request_write_access": requestWriteAccess,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: An HTTP URL to be opened
  /// * [domain]: A domain of the URL
  /// * [bot_user_id]: User identifier of a bot linked with the website
  /// * [request_write_access]: True, if the user must be asked for the permission to the bot to send them messages
  @override
  LoginUrlInfoRequestConfirmation copyWith({
    String? url,
    String? domain,
    int? botUserId,
    bool? requestWriteAccess,
    dynamic extra,
    int? clientId,
  }) =>
      LoginUrlInfoRequestConfirmation(
        url: url ?? this.url,
        domain: domain ?? this.domain,
        botUserId: botUserId ?? this.botUserId,
        requestWriteAccess: requestWriteAccess ?? this.requestWriteAccess,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loginUrlInfoRequestConfirmation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
