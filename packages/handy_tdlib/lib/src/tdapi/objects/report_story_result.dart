part of '../tdapi.dart';

/// **ReportStoryResult** *(reportStoryResult)* - parent
///
/// Describes result of story report.
sealed class ReportStoryResult extends TdObject {
  /// **ReportStoryResult** *(reportStoryResult)* - parent
  ///
  /// Describes result of story report.
  const ReportStoryResult();

  /// a ReportStoryResult return type can be :
  /// * [ReportStoryResultOk]
  /// * [ReportStoryResultOptionRequired]
  /// * [ReportStoryResultTextRequired]
  factory ReportStoryResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReportStoryResultOk.defaultObjectId:
        return ReportStoryResultOk.fromJson(json);
      case ReportStoryResultOptionRequired.defaultObjectId:
        return ReportStoryResultOptionRequired.fromJson(json);
      case ReportStoryResultTextRequired.defaultObjectId:
        return ReportStoryResultTextRequired.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReportStoryResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReportStoryResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reportStoryResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportStoryResultOk** *(reportStoryResultOk)* - child of ReportStoryResult
///
/// The story was reported successfully.
final class ReportStoryResultOk extends ReportStoryResult {
  /// **ReportStoryResultOk** *(reportStoryResultOk)* - child of ReportStoryResult
  ///
  /// The story was reported successfully.
  const ReportStoryResultOk({
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
  factory ReportStoryResultOk.fromJson(Map<String, dynamic> json) =>
      ReportStoryResultOk(
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
  ReportStoryResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportStoryResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportStoryResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportStoryResultOptionRequired** *(reportStoryResultOptionRequired)* - child of ReportStoryResult
///
/// The user must choose an option to report the story and repeat request with the chosen option.
///
/// * [title]: Title for the option choice.
/// * [options]: List of available options.
final class ReportStoryResultOptionRequired extends ReportStoryResult {
  /// **ReportStoryResultOptionRequired** *(reportStoryResultOptionRequired)* - child of ReportStoryResult
  ///
  /// The user must choose an option to report the story and repeat request with the chosen option.
  ///
  /// * [title]: Title for the option choice.
  /// * [options]: List of available options.
  const ReportStoryResultOptionRequired({
    required this.title,
    required this.options,
    this.extra,
    this.clientId,
  });

  /// Title for the option choice
  final String title;

  /// List of available options
  final List<ReportOption> options;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ReportStoryResultOptionRequired.fromJson(Map<String, dynamic> json) =>
      ReportStoryResultOptionRequired(
        title: json['title'],
        options: List<ReportOption>.from((json['options'] ?? [])
            .map((item) => ReportOption.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "options": options.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title for the option choice
  /// * [options]: List of available options
  @override
  ReportStoryResultOptionRequired copyWith({
    String? title,
    List<ReportOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      ReportStoryResultOptionRequired(
        title: title ?? this.title,
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportStoryResultOptionRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportStoryResultTextRequired** *(reportStoryResultTextRequired)* - child of ReportStoryResult
///
/// The user must add additional text details to the report.
///
/// * [optionId]: Option identifier for the next reportStory request.
/// * [isOptional]: True, if the user can skip text adding.
final class ReportStoryResultTextRequired extends ReportStoryResult {
  /// **ReportStoryResultTextRequired** *(reportStoryResultTextRequired)* - child of ReportStoryResult
  ///
  /// The user must add additional text details to the report.
  ///
  /// * [optionId]: Option identifier for the next reportStory request.
  /// * [isOptional]: True, if the user can skip text adding.
  const ReportStoryResultTextRequired({
    required this.optionId,
    required this.isOptional,
    this.extra,
    this.clientId,
  });

  /// Option identifier for the next reportStory request
  final String optionId;

  /// True, if the user can skip text adding
  final bool isOptional;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ReportStoryResultTextRequired.fromJson(Map<String, dynamic> json) =>
      ReportStoryResultTextRequired(
        optionId: json['option_id'],
        isOptional: json['is_optional'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "option_id": optionId,
      "is_optional": isOptional,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [option_id]: Option identifier for the next reportStory request
  /// * [is_optional]: True, if the user can skip text adding
  @override
  ReportStoryResultTextRequired copyWith({
    String? optionId,
    bool? isOptional,
    dynamic extra,
    int? clientId,
  }) =>
      ReportStoryResultTextRequired(
        optionId: optionId ?? this.optionId,
        isOptional: isOptional ?? this.isOptional,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportStoryResultTextRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
