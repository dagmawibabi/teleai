part of '../tdapi.dart';

/// **FixTextWithAi** *(fixTextWithAi)* - TDLib function
///
/// Fixes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
///
/// * [text]: The original text.
///
/// [FixedText] is returned on completion.
final class FixTextWithAi extends TdFunction {
  /// **FixTextWithAi** *(fixTextWithAi)* - TDLib function
  ///
  /// Fixes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
  ///
  /// * [text]: The original text.
  ///
  /// [FixedText] is returned on completion.
  const FixTextWithAi({
    required this.text,
  });

  /// The original text
  final FormattedText text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The original text
  FixTextWithAi copyWith({
    FormattedText? text,
  }) =>
      FixTextWithAi(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'fixTextWithAi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
