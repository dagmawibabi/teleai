part of '../tdapi.dart';

/// **WebProxyCarrier** *(webProxyCarrier)* - basic class
///
/// Describes a web proxy carrier: an HTTPS relay page, which carries traffic of a web proxy and must be loaded by the application as the top-level document of a hidden web view.. Before loading the page, the application must arrange for an object named carrier.bridge_object_name to be defined in the top-level document whenever its origin is exactly carrier.origin,. and in no other document or frame. The object must be read-only and must have two members:. a method postMessage(value), which passes an ArrayBuffer or a typed array to processWebProxyCarrierMessage as webProxyCarrierMessageBinary, passes a string as webProxyCarrierMessageText,. and rejects any other value; and a property onmessage, which the page sets to a function. The application delivers data to the page by calling that function with an object {data: value},. where value is an ArrayBuffer for binary data and a string for text. Each carrier needs its own web view.
///
/// * [id]: Unique identifier of the carrier.
/// * [proxyId]: Identifier of the added proxy that uses the carrier; 0 if the carrier is used by pingProxy or testProxy.
/// * [url]: The HTTPS URL to load. The URL contains the capability for the proxy and a fragment, which must be kept; the URL must never be logged or shown to the user.
/// * [origin]: Origin of the relay page, for example, "https://proxy.example.com". The web view must not be allowed to navigate to another origin.
/// * [pathPrefix]: The only path prefix on carrier.origin from which the page may load resources or to which it may send requests, for example, "/" or "/relay/".
/// * [bridgeObjectName]: Name of the object to define in the top-level document; currently, always "TelegramWebProxy".
/// * [isTemporary]: True, if the carrier is needed only to test the proxy and will be closed after the test.. The application may refuse to open such carriers, for example, to avoid creating a web view for every saved proxy.
final class WebProxyCarrier extends TdObject {
  /// **WebProxyCarrier** *(webProxyCarrier)* - basic class
  ///
  /// Describes a web proxy carrier: an HTTPS relay page, which carries traffic of a web proxy and must be loaded by the application as the top-level document of a hidden web view.. Before loading the page, the application must arrange for an object named carrier.bridge_object_name to be defined in the top-level document whenever its origin is exactly carrier.origin,. and in no other document or frame. The object must be read-only and must have two members:. a method postMessage(value), which passes an ArrayBuffer or a typed array to processWebProxyCarrierMessage as webProxyCarrierMessageBinary, passes a string as webProxyCarrierMessageText,. and rejects any other value; and a property onmessage, which the page sets to a function. The application delivers data to the page by calling that function with an object {data: value},. where value is an ArrayBuffer for binary data and a string for text. Each carrier needs its own web view.
  ///
  /// * [id]: Unique identifier of the carrier.
  /// * [proxyId]: Identifier of the added proxy that uses the carrier; 0 if the carrier is used by pingProxy or testProxy.
  /// * [url]: The HTTPS URL to load. The URL contains the capability for the proxy and a fragment, which must be kept; the URL must never be logged or shown to the user.
  /// * [origin]: Origin of the relay page, for example, "https://proxy.example.com". The web view must not be allowed to navigate to another origin.
  /// * [pathPrefix]: The only path prefix on carrier.origin from which the page may load resources or to which it may send requests, for example, "/" or "/relay/".
  /// * [bridgeObjectName]: Name of the object to define in the top-level document; currently, always "TelegramWebProxy".
  /// * [isTemporary]: True, if the carrier is needed only to test the proxy and will be closed after the test.. The application may refuse to open such carriers, for example, to avoid creating a web view for every saved proxy.
  const WebProxyCarrier({
    required this.id,
    required this.proxyId,
    required this.url,
    required this.origin,
    required this.pathPrefix,
    required this.bridgeObjectName,
    required this.isTemporary,
  });

  /// Unique identifier of the carrier
  final int id;

  /// Identifier of the added proxy that uses the carrier; 0 if the carrier is used by pingProxy or testProxy
  final int proxyId;

  /// The HTTPS URL to load. The URL contains the capability for the proxy and a fragment, which must be kept; the URL must never be logged or shown to the user
  final String url;

  /// Origin of the relay page, for example, "https://proxy.example.com". The web view must not be allowed to navigate to another origin
  final String origin;

  /// The only path prefix on carrier.origin from which the page may load resources or to which it may send requests, for example, "/" or "/relay/"
  final String pathPrefix;

  /// Name of the object to define in the top-level document; currently, always "TelegramWebProxy"
  final String bridgeObjectName;

  /// True, if the carrier is needed only to test the proxy and will be closed after the test.. The application may refuse to open such carriers, for example, to avoid creating a web view for every saved proxy
  final bool isTemporary;

  /// Parse from a json
  factory WebProxyCarrier.fromJson(Map<String, dynamic> json) =>
      WebProxyCarrier(
        id: json['id'],
        proxyId: json['proxy_id'],
        url: json['url'],
        origin: json['origin'],
        pathPrefix: json['path_prefix'],
        bridgeObjectName: json['bridge_object_name'],
        isTemporary: json['is_temporary'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "proxy_id": proxyId,
      "url": url,
      "origin": origin,
      "path_prefix": pathPrefix,
      "bridge_object_name": bridgeObjectName,
      "is_temporary": isTemporary,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the carrier
  /// * [proxy_id]: Identifier of the added proxy that uses the carrier; 0 if the carrier is used by pingProxy or testProxy
  /// * [url]: The HTTPS URL to load. The URL contains the capability for the proxy and a fragment, which must be kept; the URL must never be logged or shown to the user
  /// * [origin]: Origin of the relay page, for example, "https://proxy.example.com". The web view must not be allowed to navigate to another origin
  /// * [path_prefix]: The only path prefix on carrier.origin from which the page may load resources or to which it may send requests, for example, "/" or "/relay/"
  /// * [bridge_object_name]: Name of the object to define in the top-level document; currently, always "TelegramWebProxy"
  /// * [is_temporary]: True, if the carrier is needed only to test the proxy and will be closed after the test.. The application may refuse to open such carriers, for example, to avoid creating a web view for every saved proxy
  WebProxyCarrier copyWith({
    int? id,
    int? proxyId,
    String? url,
    String? origin,
    String? pathPrefix,
    String? bridgeObjectName,
    bool? isTemporary,
  }) =>
      WebProxyCarrier(
        id: id ?? this.id,
        proxyId: proxyId ?? this.proxyId,
        url: url ?? this.url,
        origin: origin ?? this.origin,
        pathPrefix: pathPrefix ?? this.pathPrefix,
        bridgeObjectName: bridgeObjectName ?? this.bridgeObjectName,
        isTemporary: isTemporary ?? this.isTemporary,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrier';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
