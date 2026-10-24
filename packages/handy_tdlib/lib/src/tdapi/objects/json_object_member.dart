part of '../tdapi.dart';

/// **JsonObjectMember** *(jsonObjectMember)* - basic class
///
/// Represents one member of a JSON object.
///
/// * [key]: Member's key.
/// * [value]: Member's value.
final class JsonObjectMember extends TdObject {
  /// **JsonObjectMember** *(jsonObjectMember)* - basic class
  ///
  /// Represents one member of a JSON object.
  ///
  /// * [key]: Member's key.
  /// * [value]: Member's value.
  const JsonObjectMember({
    required this.key,
    required this.value,
  });

  /// Member's key
  final String key;

  /// Member's value
  final JsonValue value;

  /// Parse from a json
  factory JsonObjectMember.fromJson(Map<String, dynamic> json) =>
      JsonObjectMember(
        key: json['key'],
        value: JsonValue.fromJson(json['value']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "key": key,
      "value": value.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [key]: Member's key
  /// * [value]: Member's value
  JsonObjectMember copyWith({
    String? key,
    JsonValue? value,
  }) =>
      JsonObjectMember(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonObjectMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
