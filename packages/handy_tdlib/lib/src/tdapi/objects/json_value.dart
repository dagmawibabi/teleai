part of '../tdapi.dart';

/// **JsonValue** *(jsonValue)* - parent
///
/// Represents a JSON value.
sealed class JsonValue extends TdObject {
  /// **JsonValue** *(jsonValue)* - parent
  ///
  /// Represents a JSON value.
  const JsonValue();

  /// a JsonValue return type can be :
  /// * [JsonValueNull]
  /// * [JsonValueBoolean]
  /// * [JsonValueNumber]
  /// * [JsonValueString]
  /// * [JsonValueArray]
  /// * [JsonValueObject]
  factory JsonValue.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case JsonValueNull.defaultObjectId:
        return JsonValueNull.fromJson(json);
      case JsonValueBoolean.defaultObjectId:
        return JsonValueBoolean.fromJson(json);
      case JsonValueNumber.defaultObjectId:
        return JsonValueNumber.fromJson(json);
      case JsonValueString.defaultObjectId:
        return JsonValueString.fromJson(json);
      case JsonValueArray.defaultObjectId:
        return JsonValueArray.fromJson(json);
      case JsonValueObject.defaultObjectId:
        return JsonValueObject.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of JsonValue)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  JsonValue copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'jsonValue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueNull** *(jsonValueNull)* - child of JsonValue
///
/// Represents a null JSON value.
final class JsonValueNull extends JsonValue {
  /// **JsonValueNull** *(jsonValueNull)* - child of JsonValue
  ///
  /// Represents a null JSON value.
  const JsonValueNull({
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
  factory JsonValueNull.fromJson(Map<String, dynamic> json) => JsonValueNull(
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
  JsonValueNull copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueNull(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueNull';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueBoolean** *(jsonValueBoolean)* - child of JsonValue
///
/// Represents a boolean JSON value.
///
/// * [value]: The value.
final class JsonValueBoolean extends JsonValue {
  /// **JsonValueBoolean** *(jsonValueBoolean)* - child of JsonValue
  ///
  /// Represents a boolean JSON value.
  ///
  /// * [value]: The value.
  const JsonValueBoolean({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value
  final bool value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory JsonValueBoolean.fromJson(Map<String, dynamic> json) =>
      JsonValueBoolean(
        value: json['value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: The value
  @override
  JsonValueBoolean copyWith({
    bool? value,
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueBoolean(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueBoolean';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueNumber** *(jsonValueNumber)* - child of JsonValue
///
/// Represents a numeric JSON value.
///
/// * [value]: The value.
final class JsonValueNumber extends JsonValue {
  /// **JsonValueNumber** *(jsonValueNumber)* - child of JsonValue
  ///
  /// Represents a numeric JSON value.
  ///
  /// * [value]: The value.
  const JsonValueNumber({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value
  final double value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory JsonValueNumber.fromJson(Map<String, dynamic> json) =>
      JsonValueNumber(
        value: json['value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: The value
  @override
  JsonValueNumber copyWith({
    double? value,
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueNumber(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueString** *(jsonValueString)* - child of JsonValue
///
/// Represents a string JSON value.
///
/// * [value]: The value.
final class JsonValueString extends JsonValue {
  /// **JsonValueString** *(jsonValueString)* - child of JsonValue
  ///
  /// Represents a string JSON value.
  ///
  /// * [value]: The value.
  const JsonValueString({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value
  final String value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory JsonValueString.fromJson(Map<String, dynamic> json) =>
      JsonValueString(
        value: json['value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: The value
  @override
  JsonValueString copyWith({
    String? value,
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueString(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueArray** *(jsonValueArray)* - child of JsonValue
///
/// Represents a JSON array.
///
/// * [values]: The list of array elements.
final class JsonValueArray extends JsonValue {
  /// **JsonValueArray** *(jsonValueArray)* - child of JsonValue
  ///
  /// Represents a JSON array.
  ///
  /// * [values]: The list of array elements.
  const JsonValueArray({
    required this.values,
    this.extra,
    this.clientId,
  });

  /// The list of array elements
  final List<JsonValue> values;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory JsonValueArray.fromJson(Map<String, dynamic> json) => JsonValueArray(
        values: List<JsonValue>.from((json['values'] ?? [])
            .map((item) => JsonValue.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "values": values.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [values]: The list of array elements
  @override
  JsonValueArray copyWith({
    List<JsonValue>? values,
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueArray(
        values: values ?? this.values,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueArray';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **JsonValueObject** *(jsonValueObject)* - child of JsonValue
///
/// Represents a JSON object.
///
/// * [members]: The list of object members.
final class JsonValueObject extends JsonValue {
  /// **JsonValueObject** *(jsonValueObject)* - child of JsonValue
  ///
  /// Represents a JSON object.
  ///
  /// * [members]: The list of object members.
  const JsonValueObject({
    required this.members,
    this.extra,
    this.clientId,
  });

  /// The list of object members
  final List<JsonObjectMember> members;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory JsonValueObject.fromJson(Map<String, dynamic> json) =>
      JsonValueObject(
        members: List<JsonObjectMember>.from((json['members'] ?? [])
            .map((item) => JsonObjectMember.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "members": members.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [members]: The list of object members
  @override
  JsonValueObject copyWith({
    List<JsonObjectMember>? members,
    dynamic extra,
    int? clientId,
  }) =>
      JsonValueObject(
        members: members ?? this.members,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'jsonValueObject';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
