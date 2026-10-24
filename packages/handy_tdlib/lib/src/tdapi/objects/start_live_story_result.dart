part of '../tdapi.dart';

/// **StartLiveStoryResult** *(startLiveStoryResult)* - parent
///
/// Represents result of starting a live story.
sealed class StartLiveStoryResult extends TdObject {
  /// **StartLiveStoryResult** *(startLiveStoryResult)* - parent
  ///
  /// Represents result of starting a live story.
  const StartLiveStoryResult();

  /// a StartLiveStoryResult return type can be :
  /// * [StartLiveStoryResultOk]
  /// * [StartLiveStoryResultFail]
  factory StartLiveStoryResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StartLiveStoryResultOk.defaultObjectId:
        return StartLiveStoryResultOk.fromJson(json);
      case StartLiveStoryResultFail.defaultObjectId:
        return StartLiveStoryResultFail.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StartLiveStoryResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StartLiveStoryResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'startLiveStoryResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StartLiveStoryResultOk** *(startLiveStoryResultOk)* - child of StartLiveStoryResult
///
/// The live story was successfully posted.
///
/// * [story]: The live story.
final class StartLiveStoryResultOk extends StartLiveStoryResult {
  /// **StartLiveStoryResultOk** *(startLiveStoryResultOk)* - child of StartLiveStoryResult
  ///
  /// The live story was successfully posted.
  ///
  /// * [story]: The live story.
  const StartLiveStoryResultOk({
    required this.story,
    this.extra,
    this.clientId,
  });

  /// The live story
  final Story story;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StartLiveStoryResultOk.fromJson(Map<String, dynamic> json) =>
      StartLiveStoryResultOk(
        story: Story.fromJson(json['story']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story": story.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story]: The live story
  @override
  StartLiveStoryResultOk copyWith({
    Story? story,
    dynamic extra,
    int? clientId,
  }) =>
      StartLiveStoryResultOk(
        story: story ?? this.story,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startLiveStoryResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StartLiveStoryResultFail** *(startLiveStoryResultFail)* - child of StartLiveStoryResult
///
/// The live story failed to post with an error to be handled.
///
/// * [errorType]: Type of the error; other error types may be returned as regular errors.
final class StartLiveStoryResultFail extends StartLiveStoryResult {
  /// **StartLiveStoryResultFail** *(startLiveStoryResultFail)* - child of StartLiveStoryResult
  ///
  /// The live story failed to post with an error to be handled.
  ///
  /// * [errorType]: Type of the error; other error types may be returned as regular errors.
  const StartLiveStoryResultFail({
    required this.errorType,
    this.extra,
    this.clientId,
  });

  /// Type of the error; other error types may be returned as regular errors
  final CanPostStoryResult errorType;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StartLiveStoryResultFail.fromJson(Map<String, dynamic> json) =>
      StartLiveStoryResultFail(
        errorType: CanPostStoryResult.fromJson(json['error_type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "error_type": errorType.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error_type]: Type of the error; other error types may be returned as regular errors
  @override
  StartLiveStoryResultFail copyWith({
    CanPostStoryResult? errorType,
    dynamic extra,
    int? clientId,
  }) =>
      StartLiveStoryResultFail(
        errorType: errorType ?? this.errorType,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startLiveStoryResultFail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
