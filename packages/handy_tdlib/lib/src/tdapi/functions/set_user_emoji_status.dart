part of '../tdapi.dart';

/// **SetUserEmojiStatus** *(setUserEmojiStatus)* - TDLib function
///
/// Changes the emoji status of a user; for bots only.
///
/// * [userId]: Identifier of the user.
/// * [emojiStatus]: New emoji status; pass null to switch to the default badge *(optional)*.
///
/// [Ok] is returned on completion.
final class SetUserEmojiStatus extends TdFunction {
  /// **SetUserEmojiStatus** *(setUserEmojiStatus)* - TDLib function
  ///
  /// Changes the emoji status of a user; for bots only.
  ///
  /// * [userId]: Identifier of the user.
  /// * [emojiStatus]: New emoji status; pass null to switch to the default badge *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetUserEmojiStatus({
    required this.userId,
    this.emojiStatus,
  });

  /// Identifier of the user
  final int userId;

  /// New emoji status; pass null to switch to the default badge
  final EmojiStatus? emojiStatus;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "emoji_status": emojiStatus?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [emoji_status]: New emoji status; pass null to switch to the default badge
  SetUserEmojiStatus copyWith({
    int? userId,
    EmojiStatus? emojiStatus,
  }) =>
      SetUserEmojiStatus(
        userId: userId ?? this.userId,
        emojiStatus: emojiStatus ?? this.emojiStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUserEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
