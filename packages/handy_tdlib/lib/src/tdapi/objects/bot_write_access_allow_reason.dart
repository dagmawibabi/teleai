part of '../tdapi.dart';

/// **BotWriteAccessAllowReason** *(botWriteAccessAllowReason)* - parent
///
/// Describes a reason why a bot was allowed to write messages to the current user.
sealed class BotWriteAccessAllowReason extends TdObject {
  /// **BotWriteAccessAllowReason** *(botWriteAccessAllowReason)* - parent
  ///
  /// Describes a reason why a bot was allowed to write messages to the current user.
  const BotWriteAccessAllowReason();

  /// a BotWriteAccessAllowReason return type can be :
  /// * [BotWriteAccessAllowReasonConnectedWebsite]
  /// * [BotWriteAccessAllowReasonAddedToAttachmentMenu]
  /// * [BotWriteAccessAllowReasonLaunchedWebApp]
  /// * [BotWriteAccessAllowReasonAcceptedRequest]
  factory BotWriteAccessAllowReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BotWriteAccessAllowReasonConnectedWebsite.defaultObjectId:
        return BotWriteAccessAllowReasonConnectedWebsite.fromJson(json);
      case BotWriteAccessAllowReasonAddedToAttachmentMenu.defaultObjectId:
        return BotWriteAccessAllowReasonAddedToAttachmentMenu.fromJson(json);
      case BotWriteAccessAllowReasonLaunchedWebApp.defaultObjectId:
        return BotWriteAccessAllowReasonLaunchedWebApp.fromJson(json);
      case BotWriteAccessAllowReasonAcceptedRequest.defaultObjectId:
        return BotWriteAccessAllowReasonAcceptedRequest.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BotWriteAccessAllowReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BotWriteAccessAllowReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'botWriteAccessAllowReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BotWriteAccessAllowReasonConnectedWebsite** *(botWriteAccessAllowReasonConnectedWebsite)* - child of BotWriteAccessAllowReason
///
/// The user connected a website by logging in using Telegram Login Widget on it.
///
/// * [domainName]: Domain name of the connected website.
final class BotWriteAccessAllowReasonConnectedWebsite
    extends BotWriteAccessAllowReason {
  /// **BotWriteAccessAllowReasonConnectedWebsite** *(botWriteAccessAllowReasonConnectedWebsite)* - child of BotWriteAccessAllowReason
  ///
  /// The user connected a website by logging in using Telegram Login Widget on it.
  ///
  /// * [domainName]: Domain name of the connected website.
  const BotWriteAccessAllowReasonConnectedWebsite({
    required this.domainName,
  });

  /// Domain name of the connected website
  final String domainName;

  /// Parse from a json
  factory BotWriteAccessAllowReasonConnectedWebsite.fromJson(
          Map<String, dynamic> json) =>
      BotWriteAccessAllowReasonConnectedWebsite(
        domainName: json['domain_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "domain_name": domainName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [domain_name]: Domain name of the connected website
  @override
  BotWriteAccessAllowReasonConnectedWebsite copyWith({
    String? domainName,
  }) =>
      BotWriteAccessAllowReasonConnectedWebsite(
        domainName: domainName ?? this.domainName,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'botWriteAccessAllowReasonConnectedWebsite';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BotWriteAccessAllowReasonAddedToAttachmentMenu** *(botWriteAccessAllowReasonAddedToAttachmentMenu)* - child of BotWriteAccessAllowReason
///
/// The user added the bot to attachment or side menu using toggleBotIsAddedToAttachmentMenu.
final class BotWriteAccessAllowReasonAddedToAttachmentMenu
    extends BotWriteAccessAllowReason {
  /// **BotWriteAccessAllowReasonAddedToAttachmentMenu** *(botWriteAccessAllowReasonAddedToAttachmentMenu)* - child of BotWriteAccessAllowReason
  ///
  /// The user added the bot to attachment or side menu using toggleBotIsAddedToAttachmentMenu.
  const BotWriteAccessAllowReasonAddedToAttachmentMenu();

  /// Parse from a json
  factory BotWriteAccessAllowReasonAddedToAttachmentMenu.fromJson(
          Map<String, dynamic> json) =>
      const BotWriteAccessAllowReasonAddedToAttachmentMenu();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BotWriteAccessAllowReasonAddedToAttachmentMenu copyWith() =>
      const BotWriteAccessAllowReasonAddedToAttachmentMenu();

  /// TDLib object type
  static const String defaultObjectId =
      'botWriteAccessAllowReasonAddedToAttachmentMenu';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BotWriteAccessAllowReasonLaunchedWebApp** *(botWriteAccessAllowReasonLaunchedWebApp)* - child of BotWriteAccessAllowReason
///
/// The user launched a Web App using getWebAppLinkUrl.
///
/// * [webApp]: Information about the Web App.
final class BotWriteAccessAllowReasonLaunchedWebApp
    extends BotWriteAccessAllowReason {
  /// **BotWriteAccessAllowReasonLaunchedWebApp** *(botWriteAccessAllowReasonLaunchedWebApp)* - child of BotWriteAccessAllowReason
  ///
  /// The user launched a Web App using getWebAppLinkUrl.
  ///
  /// * [webApp]: Information about the Web App.
  const BotWriteAccessAllowReasonLaunchedWebApp({
    required this.webApp,
  });

  /// Information about the Web App
  final WebApp webApp;

  /// Parse from a json
  factory BotWriteAccessAllowReasonLaunchedWebApp.fromJson(
          Map<String, dynamic> json) =>
      BotWriteAccessAllowReasonLaunchedWebApp(
        webApp: WebApp.fromJson(json['web_app']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "web_app": webApp.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [web_app]: Information about the Web App
  @override
  BotWriteAccessAllowReasonLaunchedWebApp copyWith({
    WebApp? webApp,
  }) =>
      BotWriteAccessAllowReasonLaunchedWebApp(
        webApp: webApp ?? this.webApp,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'botWriteAccessAllowReasonLaunchedWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BotWriteAccessAllowReasonAcceptedRequest** *(botWriteAccessAllowReasonAcceptedRequest)* - child of BotWriteAccessAllowReason
///
/// The user accepted bot's request to send messages with allowBotToSendMessages.
final class BotWriteAccessAllowReasonAcceptedRequest
    extends BotWriteAccessAllowReason {
  /// **BotWriteAccessAllowReasonAcceptedRequest** *(botWriteAccessAllowReasonAcceptedRequest)* - child of BotWriteAccessAllowReason
  ///
  /// The user accepted bot's request to send messages with allowBotToSendMessages.
  const BotWriteAccessAllowReasonAcceptedRequest();

  /// Parse from a json
  factory BotWriteAccessAllowReasonAcceptedRequest.fromJson(
          Map<String, dynamic> json) =>
      const BotWriteAccessAllowReasonAcceptedRequest();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BotWriteAccessAllowReasonAcceptedRequest copyWith() =>
      const BotWriteAccessAllowReasonAcceptedRequest();

  /// TDLib object type
  static const String defaultObjectId =
      'botWriteAccessAllowReasonAcceptedRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
