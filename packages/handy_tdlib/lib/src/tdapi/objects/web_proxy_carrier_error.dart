part of '../tdapi.dart';

/// **WebProxyCarrierError** *(webProxyCarrierError)* - parent
///
/// Describes the reason why a web proxy carrier failed.
sealed class WebProxyCarrierError extends TdObject {
  /// **WebProxyCarrierError** *(webProxyCarrierError)* - parent
  ///
  /// Describes the reason why a web proxy carrier failed.
  const WebProxyCarrierError();

  /// a WebProxyCarrierError return type can be :
  /// * [WebProxyCarrierErrorUnsupported]
  /// * [WebProxyCarrierErrorPaused]
  /// * [WebProxyCarrierErrorLoadFailed]
  /// * [WebProxyCarrierErrorTerminated]
  /// * [WebProxyCarrierErrorRefused]
  factory WebProxyCarrierError.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case WebProxyCarrierErrorUnsupported.defaultObjectId:
        return WebProxyCarrierErrorUnsupported.fromJson(json);
      case WebProxyCarrierErrorPaused.defaultObjectId:
        return WebProxyCarrierErrorPaused.fromJson(json);
      case WebProxyCarrierErrorLoadFailed.defaultObjectId:
        return WebProxyCarrierErrorLoadFailed.fromJson(json);
      case WebProxyCarrierErrorTerminated.defaultObjectId:
        return WebProxyCarrierErrorTerminated.fromJson(json);
      case WebProxyCarrierErrorRefused.defaultObjectId:
        return WebProxyCarrierErrorRefused.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of WebProxyCarrierError)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  WebProxyCarrierError copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierErrorUnsupported** *(webProxyCarrierErrorUnsupported)* - child of WebProxyCarrierError
///
/// The application can't open the carrier, because the platform can't create hidden web views or define the bridge object; TDLib will not retry until the proxy is enabled again.
final class WebProxyCarrierErrorUnsupported extends WebProxyCarrierError {
  /// **WebProxyCarrierErrorUnsupported** *(webProxyCarrierErrorUnsupported)* - child of WebProxyCarrierError
  ///
  /// The application can't open the carrier, because the platform can't create hidden web views or define the bridge object; TDLib will not retry until the proxy is enabled again.
  const WebProxyCarrierErrorUnsupported();

  /// Parse from a json
  factory WebProxyCarrierErrorUnsupported.fromJson(Map<String, dynamic> json) =>
      const WebProxyCarrierErrorUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebProxyCarrierErrorUnsupported copyWith() =>
      const WebProxyCarrierErrorUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierErrorUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierErrorPaused** *(webProxyCarrierErrorPaused)* - child of WebProxyCarrierError
///
/// The application can't open the carrier now, for example, because it is in the background; TDLib will request it again after the next call to setNetworkType or after a delay.
final class WebProxyCarrierErrorPaused extends WebProxyCarrierError {
  /// **WebProxyCarrierErrorPaused** *(webProxyCarrierErrorPaused)* - child of WebProxyCarrierError
  ///
  /// The application can't open the carrier now, for example, because it is in the background; TDLib will request it again after the next call to setNetworkType or after a delay.
  const WebProxyCarrierErrorPaused();

  /// Parse from a json
  factory WebProxyCarrierErrorPaused.fromJson(Map<String, dynamic> json) =>
      const WebProxyCarrierErrorPaused();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebProxyCarrierErrorPaused copyWith() => const WebProxyCarrierErrorPaused();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierErrorPaused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierErrorLoadFailed** *(webProxyCarrierErrorLoadFailed)* - child of WebProxyCarrierError
///
/// The page failed to load: a network, TLS, or HTTP error, or a forbidden navigation.
///
/// * [message]: The error to be logged; must not contain the URL.
final class WebProxyCarrierErrorLoadFailed extends WebProxyCarrierError {
  /// **WebProxyCarrierErrorLoadFailed** *(webProxyCarrierErrorLoadFailed)* - child of WebProxyCarrierError
  ///
  /// The page failed to load: a network, TLS, or HTTP error, or a forbidden navigation.
  ///
  /// * [message]: The error to be logged; must not contain the URL.
  const WebProxyCarrierErrorLoadFailed({
    required this.message,
  });

  /// The error to be logged; must not contain the URL
  final String message;

  /// Parse from a json
  factory WebProxyCarrierErrorLoadFailed.fromJson(Map<String, dynamic> json) =>
      WebProxyCarrierErrorLoadFailed(
        message: json['message'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The error to be logged; must not contain the URL
  @override
  WebProxyCarrierErrorLoadFailed copyWith({
    String? message,
  }) =>
      WebProxyCarrierErrorLoadFailed(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierErrorLoadFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierErrorTerminated** *(webProxyCarrierErrorTerminated)* - child of WebProxyCarrierError
///
/// The web view or its renderer process was terminated, or passing data between the application and the page failed.
final class WebProxyCarrierErrorTerminated extends WebProxyCarrierError {
  /// **WebProxyCarrierErrorTerminated** *(webProxyCarrierErrorTerminated)* - child of WebProxyCarrierError
  ///
  /// The web view or its renderer process was terminated, or passing data between the application and the page failed.
  const WebProxyCarrierErrorTerminated();

  /// Parse from a json
  factory WebProxyCarrierErrorTerminated.fromJson(Map<String, dynamic> json) =>
      const WebProxyCarrierErrorTerminated();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebProxyCarrierErrorTerminated copyWith() =>
      const WebProxyCarrierErrorTerminated();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierErrorTerminated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierErrorRefused** *(webProxyCarrierErrorRefused)* - child of WebProxyCarrierError
///
/// The application refused to open a temporary carrier.
final class WebProxyCarrierErrorRefused extends WebProxyCarrierError {
  /// **WebProxyCarrierErrorRefused** *(webProxyCarrierErrorRefused)* - child of WebProxyCarrierError
  ///
  /// The application refused to open a temporary carrier.
  const WebProxyCarrierErrorRefused();

  /// Parse from a json
  factory WebProxyCarrierErrorRefused.fromJson(Map<String, dynamic> json) =>
      const WebProxyCarrierErrorRefused();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebProxyCarrierErrorRefused copyWith() => const WebProxyCarrierErrorRefused();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierErrorRefused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
