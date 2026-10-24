part of '../tdapi.dart';

/// **GetJsonValue** *(getJsonValue)* - TDLib function
///
/// Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously.
///
/// * [json]: The JSON-serialized string.
///
/// [JsonValue] is returned on completion.
final class GetJsonValue extends TdFunction {
  /// **GetJsonValue** *(getJsonValue)* - TDLib function
  ///
  /// Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously.
  ///
  /// * [json]: The JSON-serialized string.
  ///
  /// [JsonValue] is returned on completion.
  const GetJsonValue({
    required this.json,
  });

  /// The JSON-serialized string
  final String json;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "json": json,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [json]: The JSON-serialized string
  GetJsonValue copyWith({
    String? json,
  }) =>
      GetJsonValue(
        json: json ?? this.json,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getJsonValue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
