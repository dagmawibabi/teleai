part of '../tdapi.dart';

/// **OptionValue** *(optionValue)* - parent
///
/// Represents the value of an option.
sealed class OptionValue extends TdObject {
  /// **OptionValue** *(optionValue)* - parent
  ///
  /// Represents the value of an option.
  const OptionValue();

  /// a OptionValue return type can be :
  /// * [OptionValueBoolean]
  /// * [OptionValueEmpty]
  /// * [OptionValueInteger]
  /// * [OptionValueString]
  factory OptionValue.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case OptionValueBoolean.defaultObjectId:
        return OptionValueBoolean.fromJson(json);
      case OptionValueEmpty.defaultObjectId:
        return OptionValueEmpty.fromJson(json);
      case OptionValueInteger.defaultObjectId:
        return OptionValueInteger.fromJson(json);
      case OptionValueString.defaultObjectId:
        return OptionValueString.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of OptionValue)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  OptionValue copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'optionValue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **OptionValueBoolean** *(optionValueBoolean)* - child of OptionValue
///
/// Represents a boolean option.
///
/// * [value]: The value of the option.
final class OptionValueBoolean extends OptionValue {
  /// **OptionValueBoolean** *(optionValueBoolean)* - child of OptionValue
  ///
  /// Represents a boolean option.
  ///
  /// * [value]: The value of the option.
  const OptionValueBoolean({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value of the option
  final bool value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OptionValueBoolean.fromJson(Map<String, dynamic> json) =>
      OptionValueBoolean(
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
  /// * [value]: The value of the option
  @override
  OptionValueBoolean copyWith({
    bool? value,
    dynamic extra,
    int? clientId,
  }) =>
      OptionValueBoolean(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'optionValueBoolean';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **OptionValueEmpty** *(optionValueEmpty)* - child of OptionValue
///
/// Represents an unknown option or an option which has a default value.
final class OptionValueEmpty extends OptionValue {
  /// **OptionValueEmpty** *(optionValueEmpty)* - child of OptionValue
  ///
  /// Represents an unknown option or an option which has a default value.
  const OptionValueEmpty({
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
  factory OptionValueEmpty.fromJson(Map<String, dynamic> json) =>
      OptionValueEmpty(
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
  OptionValueEmpty copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      OptionValueEmpty(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'optionValueEmpty';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **OptionValueInteger** *(optionValueInteger)* - child of OptionValue
///
/// Represents an integer option.
///
/// * [value]: The value of the option.
final class OptionValueInteger extends OptionValue {
  /// **OptionValueInteger** *(optionValueInteger)* - child of OptionValue
  ///
  /// Represents an integer option.
  ///
  /// * [value]: The value of the option.
  const OptionValueInteger({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value of the option
  final int value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OptionValueInteger.fromJson(Map<String, dynamic> json) =>
      OptionValueInteger(
        value: json['value'] is int ? json['value'] : int.parse(json['value']),
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
  /// * [value]: The value of the option
  @override
  OptionValueInteger copyWith({
    int? value,
    dynamic extra,
    int? clientId,
  }) =>
      OptionValueInteger(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'optionValueInteger';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **OptionValueString** *(optionValueString)* - child of OptionValue
///
/// Represents a string option.
///
/// * [value]: The value of the option.
final class OptionValueString extends OptionValue {
  /// **OptionValueString** *(optionValueString)* - child of OptionValue
  ///
  /// Represents a string option.
  ///
  /// * [value]: The value of the option.
  const OptionValueString({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The value of the option
  final String value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OptionValueString.fromJson(Map<String, dynamic> json) =>
      OptionValueString(
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
  /// * [value]: The value of the option
  @override
  OptionValueString copyWith({
    String? value,
    dynamic extra,
    int? clientId,
  }) =>
      OptionValueString(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'optionValueString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
