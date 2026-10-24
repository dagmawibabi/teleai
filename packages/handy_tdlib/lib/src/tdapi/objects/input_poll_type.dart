part of '../tdapi.dart';

/// **InputPollType** *(inputPollType)* - parent
///
/// Describes the type of poll to send.
sealed class InputPollType extends TdObject {
  /// **InputPollType** *(inputPollType)* - parent
  ///
  /// Describes the type of poll to send.
  const InputPollType();

  /// a InputPollType return type can be :
  /// * [InputPollTypeRegular]
  /// * [InputPollTypeQuiz]
  factory InputPollType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPollTypeRegular.defaultObjectId:
        return InputPollTypeRegular.fromJson(json);
      case InputPollTypeQuiz.defaultObjectId:
        return InputPollTypeQuiz.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPollType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPollType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPollType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollTypeRegular** *(inputPollTypeRegular)* - child of InputPollType
///
/// A regular poll.
///
/// * [allowAddingOptions]: True, if answer options can be added to the poll after creation; not supported in channel chats and for anonymous polls.
final class InputPollTypeRegular extends InputPollType {
  /// **InputPollTypeRegular** *(inputPollTypeRegular)* - child of InputPollType
  ///
  /// A regular poll.
  ///
  /// * [allowAddingOptions]: True, if answer options can be added to the poll after creation; not supported in channel chats and for anonymous polls.
  const InputPollTypeRegular({
    required this.allowAddingOptions,
  });

  /// True, if answer options can be added to the poll after creation; not supported in channel chats and for anonymous polls
  final bool allowAddingOptions;

  /// Parse from a json
  factory InputPollTypeRegular.fromJson(Map<String, dynamic> json) =>
      InputPollTypeRegular(
        allowAddingOptions: json['allow_adding_options'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "allow_adding_options": allowAddingOptions,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [allow_adding_options]: True, if answer options can be added to the poll after creation; not supported in channel chats and for anonymous polls
  @override
  InputPollTypeRegular copyWith({
    bool? allowAddingOptions,
  }) =>
      InputPollTypeRegular(
        allowAddingOptions: allowAddingOptions ?? this.allowAddingOptions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollTypeQuiz** *(inputPollTypeQuiz)* - child of InputPollType
///
/// A poll in quiz mode, which has predefined correct answers.
///
/// * [correctOptionIds]: Increasing list of 0-based identifiers of the correct answer options; must be non-empty.
/// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds.
/// * [explanationMedia]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
final class InputPollTypeQuiz extends InputPollType {
  /// **InputPollTypeQuiz** *(inputPollTypeQuiz)* - child of InputPollType
  ///
  /// A poll in quiz mode, which has predefined correct answers.
  ///
  /// * [correctOptionIds]: Increasing list of 0-based identifiers of the correct answer options; must be non-empty.
  /// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds.
  /// * [explanationMedia]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
  const InputPollTypeQuiz({
    required this.correctOptionIds,
    required this.explanation,
    this.explanationMedia,
  });

  /// Increasing list of 0-based identifiers of the correct answer options; must be non-empty
  final List<int> correctOptionIds;

  /// Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds
  final FormattedText explanation;

  /// Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption
  final InputPollMedia? explanationMedia;

  /// Parse from a json
  factory InputPollTypeQuiz.fromJson(Map<String, dynamic> json) =>
      InputPollTypeQuiz(
        correctOptionIds: List<int>.from(
            (json['correct_option_ids'] ?? []).map((item) => item).toList()),
        explanation: FormattedText.fromJson(json['explanation']),
        explanationMedia: json['explanation_media'] == null
            ? null
            : InputPollMedia.fromJson(json['explanation_media']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "correct_option_ids": correctOptionIds.map((i) => i).toList(),
      "explanation": explanation.toJson(),
      "explanation_media": explanationMedia?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [correct_option_ids]: Increasing list of 0-based identifiers of the correct answer options; must be non-empty
  /// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds
  /// * [explanation_media]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption
  @override
  InputPollTypeQuiz copyWith({
    List<int>? correctOptionIds,
    FormattedText? explanation,
    InputPollMedia? explanationMedia,
  }) =>
      InputPollTypeQuiz(
        correctOptionIds: correctOptionIds ?? this.correctOptionIds,
        explanation: explanation ?? this.explanation,
        explanationMedia: explanationMedia ?? this.explanationMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollTypeQuiz';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
