part of '../tdapi.dart';

/// **SpeechRecognitionResult** *(speechRecognitionResult)* - parent
///
/// Describes result of speech recognition in a voice note.
sealed class SpeechRecognitionResult extends TdObject {
  /// **SpeechRecognitionResult** *(speechRecognitionResult)* - parent
  ///
  /// Describes result of speech recognition in a voice note.
  const SpeechRecognitionResult();

  /// a SpeechRecognitionResult return type can be :
  /// * [SpeechRecognitionResultPending]
  /// * [SpeechRecognitionResultText]
  /// * [SpeechRecognitionResultError]
  factory SpeechRecognitionResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SpeechRecognitionResultPending.defaultObjectId:
        return SpeechRecognitionResultPending.fromJson(json);
      case SpeechRecognitionResultText.defaultObjectId:
        return SpeechRecognitionResultText.fromJson(json);
      case SpeechRecognitionResultError.defaultObjectId:
        return SpeechRecognitionResultError.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SpeechRecognitionResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SpeechRecognitionResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'speechRecognitionResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SpeechRecognitionResultPending** *(speechRecognitionResultPending)* - child of SpeechRecognitionResult
///
/// The speech recognition is ongoing.
///
/// * [partialText]: Partially recognized text.
final class SpeechRecognitionResultPending extends SpeechRecognitionResult {
  /// **SpeechRecognitionResultPending** *(speechRecognitionResultPending)* - child of SpeechRecognitionResult
  ///
  /// The speech recognition is ongoing.
  ///
  /// * [partialText]: Partially recognized text.
  const SpeechRecognitionResultPending({
    required this.partialText,
  });

  /// Partially recognized text
  final String partialText;

  /// Parse from a json
  factory SpeechRecognitionResultPending.fromJson(Map<String, dynamic> json) =>
      SpeechRecognitionResultPending(
        partialText: json['partial_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "partial_text": partialText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [partial_text]: Partially recognized text
  @override
  SpeechRecognitionResultPending copyWith({
    String? partialText,
  }) =>
      SpeechRecognitionResultPending(
        partialText: partialText ?? this.partialText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'speechRecognitionResultPending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SpeechRecognitionResultText** *(speechRecognitionResultText)* - child of SpeechRecognitionResult
///
/// The speech recognition successfully finished.
///
/// * [text]: Recognized text.
final class SpeechRecognitionResultText extends SpeechRecognitionResult {
  /// **SpeechRecognitionResultText** *(speechRecognitionResultText)* - child of SpeechRecognitionResult
  ///
  /// The speech recognition successfully finished.
  ///
  /// * [text]: Recognized text.
  const SpeechRecognitionResultText({
    required this.text,
  });

  /// Recognized text
  final String text;

  /// Parse from a json
  factory SpeechRecognitionResultText.fromJson(Map<String, dynamic> json) =>
      SpeechRecognitionResultText(
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Recognized text
  @override
  SpeechRecognitionResultText copyWith({
    String? text,
  }) =>
      SpeechRecognitionResultText(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'speechRecognitionResultText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SpeechRecognitionResultError** *(speechRecognitionResultError)* - child of SpeechRecognitionResult
///
/// The speech recognition failed.
///
/// * [error]: Recognition error. An error with a message "MSG_VOICE_TOO_LONG" is returned when media duration is too big to be recognized.
final class SpeechRecognitionResultError extends SpeechRecognitionResult {
  /// **SpeechRecognitionResultError** *(speechRecognitionResultError)* - child of SpeechRecognitionResult
  ///
  /// The speech recognition failed.
  ///
  /// * [error]: Recognition error. An error with a message "MSG_VOICE_TOO_LONG" is returned when media duration is too big to be recognized.
  const SpeechRecognitionResultError({
    required this.error,
  });

  /// Recognition error. An error with a message "MSG_VOICE_TOO_LONG" is returned when media duration is too big to be recognized
  final TdError error;

  /// Parse from a json
  factory SpeechRecognitionResultError.fromJson(Map<String, dynamic> json) =>
      SpeechRecognitionResultError(
        error: TdError.fromJson(json['error']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "error": error.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error]: Recognition error. An error with a message "MSG_VOICE_TOO_LONG" is returned when media duration is too big to be recognized
  @override
  SpeechRecognitionResultError copyWith({
    TdError? error,
  }) =>
      SpeechRecognitionResultError(
        error: error ?? this.error,
      );

  /// TDLib object type
  static const String defaultObjectId = 'speechRecognitionResultError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
