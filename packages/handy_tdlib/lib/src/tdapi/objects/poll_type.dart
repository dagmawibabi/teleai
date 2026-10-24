part of '../tdapi.dart';

/// **PollType** *(pollType)* - parent
///
/// Describes the type of poll.
sealed class PollType extends TdObject {
  /// **PollType** *(pollType)* - parent
  ///
  /// Describes the type of poll.
  const PollType();

  /// a PollType return type can be :
  /// * [PollTypeRegular]
  /// * [PollTypeQuiz]
  factory PollType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PollTypeRegular.defaultObjectId:
        return PollTypeRegular.fromJson(json);
      case PollTypeQuiz.defaultObjectId:
        return PollTypeQuiz.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PollType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PollType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pollType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollTypeRegular** *(pollTypeRegular)* - child of PollType
///
/// A regular poll.
final class PollTypeRegular extends PollType {
  /// **PollTypeRegular** *(pollTypeRegular)* - child of PollType
  ///
  /// A regular poll.
  const PollTypeRegular();

  /// Parse from a json
  factory PollTypeRegular.fromJson(Map<String, dynamic> json) =>
      const PollTypeRegular();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PollTypeRegular copyWith() => const PollTypeRegular();

  /// TDLib object type
  static const String defaultObjectId = 'pollTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollTypeQuiz** *(pollTypeQuiz)* - child of PollType
///
/// A poll in quiz mode, which has predefined correct answers.
///
/// * [correctOptionIds]: Increasing list of 0-based identifiers of the correct answer options; empty for a yet unanswered poll.
/// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; empty for a yet unanswered poll.
/// * [explanationMedia]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; may be null if none or the poll is unanswered yet.. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo *(optional)*.
final class PollTypeQuiz extends PollType {
  /// **PollTypeQuiz** *(pollTypeQuiz)* - child of PollType
  ///
  /// A poll in quiz mode, which has predefined correct answers.
  ///
  /// * [correctOptionIds]: Increasing list of 0-based identifiers of the correct answer options; empty for a yet unanswered poll.
  /// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; empty for a yet unanswered poll.
  /// * [explanationMedia]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; may be null if none or the poll is unanswered yet.. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo *(optional)*.
  const PollTypeQuiz({
    required this.correctOptionIds,
    required this.explanation,
    this.explanationMedia,
  });

  /// Increasing list of 0-based identifiers of the correct answer options; empty for a yet unanswered poll
  final List<int> correctOptionIds;

  /// Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; empty for a yet unanswered poll
  final FormattedText explanation;

  /// Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; may be null if none or the poll is unanswered yet.. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo
  final PollMedia? explanationMedia;

  /// Parse from a json
  factory PollTypeQuiz.fromJson(Map<String, dynamic> json) => PollTypeQuiz(
        correctOptionIds: List<int>.from(
            (json['correct_option_ids'] ?? []).map((item) => item).toList()),
        explanation: FormattedText.fromJson(json['explanation']),
        explanationMedia: json['explanation_media'] == null
            ? null
            : PollMedia.fromJson(json['explanation_media']),
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
  /// * [correct_option_ids]: Increasing list of 0-based identifiers of the correct answer options; empty for a yet unanswered poll
  /// * [explanation]: Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; empty for a yet unanswered poll
  /// * [explanation_media]: Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; may be null if none or the poll is unanswered yet.. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo
  @override
  PollTypeQuiz copyWith({
    List<int>? correctOptionIds,
    FormattedText? explanation,
    PollMedia? explanationMedia,
  }) =>
      PollTypeQuiz(
        correctOptionIds: correctOptionIds ?? this.correctOptionIds,
        explanation: explanation ?? this.explanation,
        explanationMedia: explanationMedia ?? this.explanationMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollTypeQuiz';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
