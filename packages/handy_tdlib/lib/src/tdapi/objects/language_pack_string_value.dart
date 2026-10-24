part of '../tdapi.dart';

/// **LanguagePackStringValue** *(languagePackStringValue)* - parent
///
/// Represents the value of a string in a language pack.
sealed class LanguagePackStringValue extends TdObject {
  /// **LanguagePackStringValue** *(languagePackStringValue)* - parent
  ///
  /// Represents the value of a string in a language pack.
  const LanguagePackStringValue();

  /// a LanguagePackStringValue return type can be :
  /// * [LanguagePackStringValueOrdinary]
  /// * [LanguagePackStringValuePluralized]
  /// * [LanguagePackStringValueDeleted]
  factory LanguagePackStringValue.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case LanguagePackStringValueOrdinary.defaultObjectId:
        return LanguagePackStringValueOrdinary.fromJson(json);
      case LanguagePackStringValuePluralized.defaultObjectId:
        return LanguagePackStringValuePluralized.fromJson(json);
      case LanguagePackStringValueDeleted.defaultObjectId:
        return LanguagePackStringValueDeleted.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of LanguagePackStringValue)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  LanguagePackStringValue copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'languagePackStringValue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LanguagePackStringValueOrdinary** *(languagePackStringValueOrdinary)* - child of LanguagePackStringValue
///
/// An ordinary language pack string.
///
/// * [value]: String value.
final class LanguagePackStringValueOrdinary extends LanguagePackStringValue {
  /// **LanguagePackStringValueOrdinary** *(languagePackStringValueOrdinary)* - child of LanguagePackStringValue
  ///
  /// An ordinary language pack string.
  ///
  /// * [value]: String value.
  const LanguagePackStringValueOrdinary({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// String value
  final String value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LanguagePackStringValueOrdinary.fromJson(Map<String, dynamic> json) =>
      LanguagePackStringValueOrdinary(
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
  /// * [value]: String value
  @override
  LanguagePackStringValueOrdinary copyWith({
    String? value,
    dynamic extra,
    int? clientId,
  }) =>
      LanguagePackStringValueOrdinary(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'languagePackStringValueOrdinary';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LanguagePackStringValuePluralized** *(languagePackStringValuePluralized)* - child of LanguagePackStringValue
///
/// A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information.
///
/// * [zeroValue]: Value for zero objects.
/// * [oneValue]: Value for one object.
/// * [twoValue]: Value for two objects.
/// * [fewValue]: Value for few objects.
/// * [manyValue]: Value for many objects.
/// * [otherValue]: Default value.
final class LanguagePackStringValuePluralized extends LanguagePackStringValue {
  /// **LanguagePackStringValuePluralized** *(languagePackStringValuePluralized)* - child of LanguagePackStringValue
  ///
  /// A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information.
  ///
  /// * [zeroValue]: Value for zero objects.
  /// * [oneValue]: Value for one object.
  /// * [twoValue]: Value for two objects.
  /// * [fewValue]: Value for few objects.
  /// * [manyValue]: Value for many objects.
  /// * [otherValue]: Default value.
  const LanguagePackStringValuePluralized({
    required this.zeroValue,
    required this.oneValue,
    required this.twoValue,
    required this.fewValue,
    required this.manyValue,
    required this.otherValue,
    this.extra,
    this.clientId,
  });

  /// Value for zero objects
  final String zeroValue;

  /// Value for one object
  final String oneValue;

  /// Value for two objects
  final String twoValue;

  /// Value for few objects
  final String fewValue;

  /// Value for many objects
  final String manyValue;

  /// Default value
  final String otherValue;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LanguagePackStringValuePluralized.fromJson(
          Map<String, dynamic> json) =>
      LanguagePackStringValuePluralized(
        zeroValue: json['zero_value'],
        oneValue: json['one_value'],
        twoValue: json['two_value'],
        fewValue: json['few_value'],
        manyValue: json['many_value'],
        otherValue: json['other_value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "zero_value": zeroValue,
      "one_value": oneValue,
      "two_value": twoValue,
      "few_value": fewValue,
      "many_value": manyValue,
      "other_value": otherValue,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [zero_value]: Value for zero objects
  /// * [one_value]: Value for one object
  /// * [two_value]: Value for two objects
  /// * [few_value]: Value for few objects
  /// * [many_value]: Value for many objects
  /// * [other_value]: Default value
  @override
  LanguagePackStringValuePluralized copyWith({
    String? zeroValue,
    String? oneValue,
    String? twoValue,
    String? fewValue,
    String? manyValue,
    String? otherValue,
    dynamic extra,
    int? clientId,
  }) =>
      LanguagePackStringValuePluralized(
        zeroValue: zeroValue ?? this.zeroValue,
        oneValue: oneValue ?? this.oneValue,
        twoValue: twoValue ?? this.twoValue,
        fewValue: fewValue ?? this.fewValue,
        manyValue: manyValue ?? this.manyValue,
        otherValue: otherValue ?? this.otherValue,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'languagePackStringValuePluralized';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LanguagePackStringValueDeleted** *(languagePackStringValueDeleted)* - child of LanguagePackStringValue
///
/// A deleted language pack string, the value must be taken from the built-in English language pack.
final class LanguagePackStringValueDeleted extends LanguagePackStringValue {
  /// **LanguagePackStringValueDeleted** *(languagePackStringValueDeleted)* - child of LanguagePackStringValue
  ///
  /// A deleted language pack string, the value must be taken from the built-in English language pack.
  const LanguagePackStringValueDeleted({
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
  factory LanguagePackStringValueDeleted.fromJson(Map<String, dynamic> json) =>
      LanguagePackStringValueDeleted(
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
  LanguagePackStringValueDeleted copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      LanguagePackStringValueDeleted(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'languagePackStringValueDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
