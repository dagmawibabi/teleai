part of '../tdapi.dart';

/// **TonCenterApiRequestType** *(tonCenterApiRequestType)* - parent
///
/// Describes a type of request to the TON Center API.
sealed class TonCenterApiRequestType extends TdObject {
  /// **TonCenterApiRequestType** *(tonCenterApiRequestType)* - parent
  ///
  /// Describes a type of request to the TON Center API.
  const TonCenterApiRequestType();

  /// a TonCenterApiRequestType return type can be :
  /// * [TonCenterApiRequestTypeGet]
  /// * [TonCenterApiRequestTypePost]
  factory TonCenterApiRequestType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonCenterApiRequestTypeGet.defaultObjectId:
        return TonCenterApiRequestTypeGet.fromJson(json);
      case TonCenterApiRequestTypePost.defaultObjectId:
        return TonCenterApiRequestTypePost.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonCenterApiRequestType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonCenterApiRequestType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonCenterApiRequestType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonCenterApiRequestTypeGet** *(tonCenterApiRequestTypeGet)* - child of TonCenterApiRequestType
///
/// A GET request.
///
/// * [query]: URL-encoded query of the request.
final class TonCenterApiRequestTypeGet extends TonCenterApiRequestType {
  /// **TonCenterApiRequestTypeGet** *(tonCenterApiRequestTypeGet)* - child of TonCenterApiRequestType
  ///
  /// A GET request.
  ///
  /// * [query]: URL-encoded query of the request.
  const TonCenterApiRequestTypeGet({
    required this.query,
  });

  /// URL-encoded query of the request
  final String query;

  /// Parse from a json
  factory TonCenterApiRequestTypeGet.fromJson(Map<String, dynamic> json) =>
      TonCenterApiRequestTypeGet(
        query: json['query'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: URL-encoded query of the request
  @override
  TonCenterApiRequestTypeGet copyWith({
    String? query,
  }) =>
      TonCenterApiRequestTypeGet(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonCenterApiRequestTypeGet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonCenterApiRequestTypePost** *(tonCenterApiRequestTypePost)* - child of TonCenterApiRequestType
///
/// A POST request.
///
/// * [payload]: Payload of the request.
final class TonCenterApiRequestTypePost extends TonCenterApiRequestType {
  /// **TonCenterApiRequestTypePost** *(tonCenterApiRequestTypePost)* - child of TonCenterApiRequestType
  ///
  /// A POST request.
  ///
  /// * [payload]: Payload of the request.
  const TonCenterApiRequestTypePost({
    required this.payload,
  });

  /// Payload of the request
  final String payload;

  /// Parse from a json
  factory TonCenterApiRequestTypePost.fromJson(Map<String, dynamic> json) =>
      TonCenterApiRequestTypePost(
        payload: json['payload'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payload": payload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payload]: Payload of the request
  @override
  TonCenterApiRequestTypePost copyWith({
    String? payload,
  }) =>
      TonCenterApiRequestTypePost(
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonCenterApiRequestTypePost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
