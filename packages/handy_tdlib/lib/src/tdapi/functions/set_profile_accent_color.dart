part of '../tdapi.dart';

/// **SetProfileAccentColor** *(setProfileAccentColor)* - TDLib function
///
/// Changes accent color and background custom emoji for profile of the current user; for Telegram Premium users only.
///
/// * [profileAccentColorId]: Identifier of the accent color to use for profile; pass -1 if none.
/// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none.
///
/// [Ok] is returned on completion.
final class SetProfileAccentColor extends TdFunction {
  /// **SetProfileAccentColor** *(setProfileAccentColor)* - TDLib function
  ///
  /// Changes accent color and background custom emoji for profile of the current user; for Telegram Premium users only.
  ///
  /// * [profileAccentColorId]: Identifier of the accent color to use for profile; pass -1 if none.
  /// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none.
  ///
  /// [Ok] is returned on completion.
  const SetProfileAccentColor({
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
  });

  /// Identifier of the accent color to use for profile; pass -1 if none
  final int profileAccentColorId;

  /// Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none
  final int profileBackgroundCustomEmojiId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "profile_accent_color_id": profileAccentColorId,
      "profile_background_custom_emoji_id": profileBackgroundCustomEmojiId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [profile_accent_color_id]: Identifier of the accent color to use for profile; pass -1 if none
  /// * [profile_background_custom_emoji_id]: Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none
  SetProfileAccentColor copyWith({
    int? profileAccentColorId,
    int? profileBackgroundCustomEmojiId,
  }) =>
      SetProfileAccentColor(
        profileAccentColorId: profileAccentColorId ?? this.profileAccentColorId,
        profileBackgroundCustomEmojiId: profileBackgroundCustomEmojiId ??
            this.profileBackgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setProfileAccentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
