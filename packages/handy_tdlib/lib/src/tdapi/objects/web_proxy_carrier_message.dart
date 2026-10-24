part of '../tdapi.dart';

/// **WebProxyCarrierMessage** *(webProxyCarrierMessage)* - parent
///
/// Describes a message passed by the page of a web proxy carrier to postMessage of the bridge object.
sealed class WebProxyCarrierMessage extends TdObject {
  /// **WebProxyCarrierMessage** *(webProxyCarrierMessage)* - parent
  ///
  /// Describes a message passed by the page of a web proxy carrier to postMessage of the bridge object.
  const WebProxyCarrierMessage();

  /// a WebProxyCarrierMessage return type can be :
  /// * [WebProxyCarrierMessageText]
  /// * [WebProxyCarrierMessageBinary]
  factory WebProxyCarrierMessage.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case WebProxyCarrierMessageText.defaultObjectId:
        return WebProxyCarrierMessageText.fromJson(json);
      case WebProxyCarrierMessageBinary.defaultObjectId:
        return WebProxyCarrierMessageBinary.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of WebProxyCarrierMessage)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  WebProxyCarrierMessage copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierMessageText** *(webProxyCarrierMessageText)* - child of WebProxyCarrierMessage
///
/// A string message.
///
/// * [text]: The string.
final class WebProxyCarrierMessageText extends WebProxyCarrierMessage {
  /// **WebProxyCarrierMessageText** *(webProxyCarrierMessageText)* - child of WebProxyCarrierMessage
  ///
  /// A string message.
  ///
  /// * [text]: The string.
  const WebProxyCarrierMessageText({
    required this.text,
  });

  /// The string
  final String text;

  /// Parse from a json
  factory WebProxyCarrierMessageText.fromJson(Map<String, dynamic> json) =>
      WebProxyCarrierMessageText(
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The string
  @override
  WebProxyCarrierMessageText copyWith({
    String? text,
  }) =>
      WebProxyCarrierMessageText(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierMessageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebProxyCarrierMessageBinary** *(webProxyCarrierMessageBinary)* - child of WebProxyCarrierMessage
///
/// A binary message, passed as an ArrayBuffer or a typed array.
///
/// * [data]: Data of the message.
final class WebProxyCarrierMessageBinary extends WebProxyCarrierMessage {
  /// **WebProxyCarrierMessageBinary** *(webProxyCarrierMessageBinary)* - child of WebProxyCarrierMessage
  ///
  /// A binary message, passed as an ArrayBuffer or a typed array.
  ///
  /// * [data]: Data of the message.
  const WebProxyCarrierMessageBinary({
    required this.data,
  });

  /// Data of the message
  final String data;

  /// Parse from a json
  factory WebProxyCarrierMessageBinary.fromJson(Map<String, dynamic> json) =>
      WebProxyCarrierMessageBinary(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: Data of the message
  @override
  WebProxyCarrierMessageBinary copyWith({
    String? data,
  }) =>
      WebProxyCarrierMessageBinary(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webProxyCarrierMessageBinary';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
