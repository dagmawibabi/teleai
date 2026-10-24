part of '../tdapi.dart';

/// **GetJsonString** *(getJsonString)* - TDLib function
///
/// Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously.
///
/// * [jsonValue]: The JsonValue object.
///
/// [Text] is returned on completion.
final class GetJsonString extends TdFunction {
  /// **GetJsonString** *(getJsonString)* - TDLib function
  ///
  /// Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously.
  ///
  /// * [jsonValue]: The JsonValue object.
  ///
  /// [Text] is returned on completion.
  const GetJsonString({
    required this.jsonValue,
  });

  /// The JsonValue object
  final JsonValue jsonValue;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "json_value": jsonValue.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [json_value]: The JsonValue object
  GetJsonString copyWith({
    JsonValue? jsonValue,
  }) =>
      GetJsonString(
        jsonValue: jsonValue ?? this.jsonValue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getJsonString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
