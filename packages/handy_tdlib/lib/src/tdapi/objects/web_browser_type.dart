part of '../tdapi.dart';

/// **WebBrowserType** *(webBrowserType)* - parent
///
/// Describes the type of web browser.
sealed class WebBrowserType extends TdObject {
  /// **WebBrowserType** *(webBrowserType)* - parent
  ///
  /// Describes the type of web browser.
  const WebBrowserType();

  /// a WebBrowserType return type can be :
  /// * [WebBrowserTypeExternal]
  /// * [WebBrowserTypeInApp]
  factory WebBrowserType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case WebBrowserTypeExternal.defaultObjectId:
        return WebBrowserTypeExternal.fromJson(json);
      case WebBrowserTypeInApp.defaultObjectId:
        return WebBrowserTypeInApp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of WebBrowserType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  WebBrowserType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'webBrowserType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebBrowserTypeExternal** *(webBrowserTypeExternal)* - child of WebBrowserType
///
/// An external web browser.
final class WebBrowserTypeExternal extends WebBrowserType {
  /// **WebBrowserTypeExternal** *(webBrowserTypeExternal)* - child of WebBrowserType
  ///
  /// An external web browser.
  const WebBrowserTypeExternal({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory WebBrowserTypeExternal.fromJson(Map<String, dynamic> json) =>
      WebBrowserTypeExternal(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebBrowserTypeExternal copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      WebBrowserTypeExternal(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webBrowserTypeExternal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebBrowserTypeInApp** *(webBrowserTypeInApp)* - child of WebBrowserType
///
/// The in-app browser.
final class WebBrowserTypeInApp extends WebBrowserType {
  /// **WebBrowserTypeInApp** *(webBrowserTypeInApp)* - child of WebBrowserType
  ///
  /// The in-app browser.
  const WebBrowserTypeInApp({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory WebBrowserTypeInApp.fromJson(Map<String, dynamic> json) =>
      WebBrowserTypeInApp(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebBrowserTypeInApp copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      WebBrowserTypeInApp(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webBrowserTypeInApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
