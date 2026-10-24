part of '../tdapi.dart';

/// **AddLogMessage** *(addLogMessage)* - TDLib function
///
/// Adds a message to TDLib internal log. Can be called synchronously.
///
/// * [verbosityLevel]: The minimum verbosity level needed for the message to be logged; 0-1023.
/// * [text]: Text of a message to log.
///
/// [Ok] is returned on completion.
final class AddLogMessage extends TdFunction {
  /// **AddLogMessage** *(addLogMessage)* - TDLib function
  ///
  /// Adds a message to TDLib internal log. Can be called synchronously.
  ///
  /// * [verbosityLevel]: The minimum verbosity level needed for the message to be logged; 0-1023.
  /// * [text]: Text of a message to log.
  ///
  /// [Ok] is returned on completion.
  const AddLogMessage({
    required this.verbosityLevel,
    required this.text,
  });

  /// The minimum verbosity level needed for the message to be logged; 0-1023
  final int verbosityLevel;

  /// Text of a message to log
  final String text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "verbosity_level": verbosityLevel,
      "text": text,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [verbosity_level]: The minimum verbosity level needed for the message to be logged; 0-1023
  /// * [text]: Text of a message to log
  AddLogMessage copyWith({
    int? verbosityLevel,
    String? text,
  }) =>
      AddLogMessage(
        verbosityLevel: verbosityLevel ?? this.verbosityLevel,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addLogMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
