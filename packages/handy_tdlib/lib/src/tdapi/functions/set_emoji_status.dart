part of '../tdapi.dart';

/// **SetEmojiStatus** *(setEmojiStatus)* - TDLib function
///
/// Changes the emoji status of the current user; for Telegram Premium users only.
///
/// * [emojiStatus]: New emoji status; pass null to switch to the default badge *(optional)*.
///
/// [Ok] is returned on completion.
final class SetEmojiStatus extends TdFunction {
  /// **SetEmojiStatus** *(setEmojiStatus)* - TDLib function
  ///
  /// Changes the emoji status of the current user; for Telegram Premium users only.
  ///
  /// * [emojiStatus]: New emoji status; pass null to switch to the default badge *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetEmojiStatus({
    this.emojiStatus,
  });

  /// New emoji status; pass null to switch to the default badge
  final EmojiStatus? emojiStatus;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "emoji_status": emojiStatus?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji_status]: New emoji status; pass null to switch to the default badge
  SetEmojiStatus copyWith({
    EmojiStatus? emojiStatus,
  }) =>
      SetEmojiStatus(
        emojiStatus: emojiStatus ?? this.emojiStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
