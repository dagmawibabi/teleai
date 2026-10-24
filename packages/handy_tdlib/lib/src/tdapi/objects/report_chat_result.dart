part of '../tdapi.dart';

/// **ReportChatResult** *(reportChatResult)* - parent
///
/// Describes result of chat report.
sealed class ReportChatResult extends TdObject {
  /// **ReportChatResult** *(reportChatResult)* - parent
  ///
  /// Describes result of chat report.
  const ReportChatResult();

  /// a ReportChatResult return type can be :
  /// * [ReportChatResultOk]
  /// * [ReportChatResultOptionRequired]
  /// * [ReportChatResultTextRequired]
  /// * [ReportChatResultMessagesRequired]
  factory ReportChatResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReportChatResultOk.defaultObjectId:
        return ReportChatResultOk.fromJson(json);
      case ReportChatResultOptionRequired.defaultObjectId:
        return ReportChatResultOptionRequired.fromJson(json);
      case ReportChatResultTextRequired.defaultObjectId:
        return ReportChatResultTextRequired.fromJson(json);
      case ReportChatResultMessagesRequired.defaultObjectId:
        return ReportChatResultMessagesRequired.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReportChatResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReportChatResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reportChatResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportChatResultOk** *(reportChatResultOk)* - child of ReportChatResult
///
/// The chat was reported successfully.
final class ReportChatResultOk extends ReportChatResult {
  /// **ReportChatResultOk** *(reportChatResultOk)* - child of ReportChatResult
  ///
  /// The chat was reported successfully.
  const ReportChatResultOk({
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
  factory ReportChatResultOk.fromJson(Map<String, dynamic> json) =>
      ReportChatResultOk(
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
  ReportChatResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportChatResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportChatResultOptionRequired** *(reportChatResultOptionRequired)* - child of ReportChatResult
///
/// The user must choose an option to report the chat and repeat request with the chosen option.
///
/// * [title]: Title for the option choice.
/// * [options]: List of available options.
final class ReportChatResultOptionRequired extends ReportChatResult {
  /// **ReportChatResultOptionRequired** *(reportChatResultOptionRequired)* - child of ReportChatResult
  ///
  /// The user must choose an option to report the chat and repeat request with the chosen option.
  ///
  /// * [title]: Title for the option choice.
  /// * [options]: List of available options.
  const ReportChatResultOptionRequired({
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
  factory ReportChatResultOptionRequired.fromJson(Map<String, dynamic> json) =>
      ReportChatResultOptionRequired(
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
  ReportChatResultOptionRequired copyWith({
    String? title,
    List<ReportOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      ReportChatResultOptionRequired(
        title: title ?? this.title,
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatResultOptionRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportChatResultTextRequired** *(reportChatResultTextRequired)* - child of ReportChatResult
///
/// The user must add additional text details to the report.
///
/// * [optionId]: Option identifier for the next reportChat request.
/// * [isOptional]: True, if the user can skip text adding.
final class ReportChatResultTextRequired extends ReportChatResult {
  /// **ReportChatResultTextRequired** *(reportChatResultTextRequired)* - child of ReportChatResult
  ///
  /// The user must add additional text details to the report.
  ///
  /// * [optionId]: Option identifier for the next reportChat request.
  /// * [isOptional]: True, if the user can skip text adding.
  const ReportChatResultTextRequired({
    required this.optionId,
    required this.isOptional,
    this.extra,
    this.clientId,
  });

  /// Option identifier for the next reportChat request
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
  factory ReportChatResultTextRequired.fromJson(Map<String, dynamic> json) =>
      ReportChatResultTextRequired(
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
  /// * [option_id]: Option identifier for the next reportChat request
  /// * [is_optional]: True, if the user can skip text adding
  @override
  ReportChatResultTextRequired copyWith({
    String? optionId,
    bool? isOptional,
    dynamic extra,
    int? clientId,
  }) =>
      ReportChatResultTextRequired(
        optionId: optionId ?? this.optionId,
        isOptional: isOptional ?? this.isOptional,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatResultTextRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportChatResultMessagesRequired** *(reportChatResultMessagesRequired)* - child of ReportChatResult
///
/// The user must choose messages to report and repeat the reportChat request with the chosen messages.
final class ReportChatResultMessagesRequired extends ReportChatResult {
  /// **ReportChatResultMessagesRequired** *(reportChatResultMessagesRequired)* - child of ReportChatResult
  ///
  /// The user must choose messages to report and repeat the reportChat request with the chosen messages.
  const ReportChatResultMessagesRequired({
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
  factory ReportChatResultMessagesRequired.fromJson(
          Map<String, dynamic> json) =>
      ReportChatResultMessagesRequired(
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
  ReportChatResultMessagesRequired copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportChatResultMessagesRequired(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatResultMessagesRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
