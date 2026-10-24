part of '../tdapi.dart';

/// **ReportSponsoredResult** *(reportSponsoredResult)* - parent
///
/// Describes result of sponsored message or chat report.
sealed class ReportSponsoredResult extends TdObject {
  /// **ReportSponsoredResult** *(reportSponsoredResult)* - parent
  ///
  /// Describes result of sponsored message or chat report.
  const ReportSponsoredResult();

  /// a ReportSponsoredResult return type can be :
  /// * [ReportSponsoredResultOk]
  /// * [ReportSponsoredResultFailed]
  /// * [ReportSponsoredResultOptionRequired]
  /// * [ReportSponsoredResultAdsHidden]
  /// * [ReportSponsoredResultPremiumRequired]
  factory ReportSponsoredResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReportSponsoredResultOk.defaultObjectId:
        return ReportSponsoredResultOk.fromJson(json);
      case ReportSponsoredResultFailed.defaultObjectId:
        return ReportSponsoredResultFailed.fromJson(json);
      case ReportSponsoredResultOptionRequired.defaultObjectId:
        return ReportSponsoredResultOptionRequired.fromJson(json);
      case ReportSponsoredResultAdsHidden.defaultObjectId:
        return ReportSponsoredResultAdsHidden.fromJson(json);
      case ReportSponsoredResultPremiumRequired.defaultObjectId:
        return ReportSponsoredResultPremiumRequired.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReportSponsoredResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReportSponsoredResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportSponsoredResultOk** *(reportSponsoredResultOk)* - child of ReportSponsoredResult
///
/// The message was reported successfully.
final class ReportSponsoredResultOk extends ReportSponsoredResult {
  /// **ReportSponsoredResultOk** *(reportSponsoredResultOk)* - child of ReportSponsoredResult
  ///
  /// The message was reported successfully.
  const ReportSponsoredResultOk({
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
  factory ReportSponsoredResultOk.fromJson(Map<String, dynamic> json) =>
      ReportSponsoredResultOk(
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
  ReportSponsoredResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportSponsoredResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportSponsoredResultFailed** *(reportSponsoredResultFailed)* - child of ReportSponsoredResult
///
/// The sponsored message is too old or not found.
final class ReportSponsoredResultFailed extends ReportSponsoredResult {
  /// **ReportSponsoredResultFailed** *(reportSponsoredResultFailed)* - child of ReportSponsoredResult
  ///
  /// The sponsored message is too old or not found.
  const ReportSponsoredResultFailed({
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
  factory ReportSponsoredResultFailed.fromJson(Map<String, dynamic> json) =>
      ReportSponsoredResultFailed(
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
  ReportSponsoredResultFailed copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportSponsoredResultFailed(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResultFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportSponsoredResultOptionRequired** *(reportSponsoredResultOptionRequired)* - child of ReportSponsoredResult
///
/// The user must choose an option to report the message and repeat request with the chosen option.
///
/// * [title]: Title for the option choice.
/// * [options]: List of available options.
final class ReportSponsoredResultOptionRequired extends ReportSponsoredResult {
  /// **ReportSponsoredResultOptionRequired** *(reportSponsoredResultOptionRequired)* - child of ReportSponsoredResult
  ///
  /// The user must choose an option to report the message and repeat request with the chosen option.
  ///
  /// * [title]: Title for the option choice.
  /// * [options]: List of available options.
  const ReportSponsoredResultOptionRequired({
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
  factory ReportSponsoredResultOptionRequired.fromJson(
          Map<String, dynamic> json) =>
      ReportSponsoredResultOptionRequired(
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
  ReportSponsoredResultOptionRequired copyWith({
    String? title,
    List<ReportOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      ReportSponsoredResultOptionRequired(
        title: title ?? this.title,
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResultOptionRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportSponsoredResultAdsHidden** *(reportSponsoredResultAdsHidden)* - child of ReportSponsoredResult
///
/// Sponsored messages were hidden for the user in all chats.
final class ReportSponsoredResultAdsHidden extends ReportSponsoredResult {
  /// **ReportSponsoredResultAdsHidden** *(reportSponsoredResultAdsHidden)* - child of ReportSponsoredResult
  ///
  /// Sponsored messages were hidden for the user in all chats.
  const ReportSponsoredResultAdsHidden({
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
  factory ReportSponsoredResultAdsHidden.fromJson(Map<String, dynamic> json) =>
      ReportSponsoredResultAdsHidden(
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
  ReportSponsoredResultAdsHidden copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportSponsoredResultAdsHidden(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResultAdsHidden';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportSponsoredResultPremiumRequired** *(reportSponsoredResultPremiumRequired)* - child of ReportSponsoredResult
///
/// The user asked to hide sponsored messages, but Telegram Premium is required for this.
final class ReportSponsoredResultPremiumRequired extends ReportSponsoredResult {
  /// **ReportSponsoredResultPremiumRequired** *(reportSponsoredResultPremiumRequired)* - child of ReportSponsoredResult
  ///
  /// The user asked to hide sponsored messages, but Telegram Premium is required for this.
  const ReportSponsoredResultPremiumRequired({
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
  factory ReportSponsoredResultPremiumRequired.fromJson(
          Map<String, dynamic> json) =>
      ReportSponsoredResultPremiumRequired(
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
  ReportSponsoredResultPremiumRequired copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ReportSponsoredResultPremiumRequired(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredResultPremiumRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
