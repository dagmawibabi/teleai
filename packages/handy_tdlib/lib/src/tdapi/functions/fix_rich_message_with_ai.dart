part of '../tdapi.dart';

/// **FixRichMessageWithAi** *(fixRichMessageWithAi)* - TDLib function
///
/// Fixes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
///
/// * [message]: The original message.
///
/// [RichMessage] is returned on completion.
final class FixRichMessageWithAi extends TdFunction {
  /// **FixRichMessageWithAi** *(fixRichMessageWithAi)* - TDLib function
  ///
  /// Fixes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
  ///
  /// * [message]: The original message.
  ///
  /// [RichMessage] is returned on completion.
  const FixRichMessageWithAi({
    required this.message,
  });

  /// The original message
  final InputRichMessage message;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The original message
  FixRichMessageWithAi copyWith({
    InputRichMessage? message,
  }) =>
      FixRichMessageWithAi(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'fixRichMessageWithAi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
