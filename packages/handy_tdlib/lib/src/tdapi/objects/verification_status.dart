part of '../tdapi.dart';

/// **VerificationStatus** *(verificationStatus)* - basic class
///
/// Contains information about verification status of a chat or a user.
///
/// * [isVerified]: True, if the chat or the user is verified by Telegram.
/// * [isScam]: True, if the chat or the user is marked as scam by Telegram.
/// * [isFake]: True, if the chat or the user is marked as fake by Telegram.
/// * [botVerificationIconCustomEmojiId]: Identifier of the custom emoji to be shown as verification sign provided by a bot for the user; 0 if none.
final class VerificationStatus extends TdObject {
  /// **VerificationStatus** *(verificationStatus)* - basic class
  ///
  /// Contains information about verification status of a chat or a user.
  ///
  /// * [isVerified]: True, if the chat or the user is verified by Telegram.
  /// * [isScam]: True, if the chat or the user is marked as scam by Telegram.
  /// * [isFake]: True, if the chat or the user is marked as fake by Telegram.
  /// * [botVerificationIconCustomEmojiId]: Identifier of the custom emoji to be shown as verification sign provided by a bot for the user; 0 if none.
  const VerificationStatus({
    required this.isVerified,
    required this.isScam,
    required this.isFake,
    required this.botVerificationIconCustomEmojiId,
  });

  /// True, if the chat or the user is verified by Telegram
  final bool isVerified;

  /// True, if the chat or the user is marked as scam by Telegram
  final bool isScam;

  /// True, if the chat or the user is marked as fake by Telegram
  final bool isFake;

  /// Identifier of the custom emoji to be shown as verification sign provided by a bot for the user; 0 if none
  final int botVerificationIconCustomEmojiId;

  /// Parse from a json
  factory VerificationStatus.fromJson(Map<String, dynamic> json) =>
      VerificationStatus(
        isVerified: json['is_verified'],
        isScam: json['is_scam'],
        isFake: json['is_fake'],
        botVerificationIconCustomEmojiId:
            json['bot_verification_icon_custom_emoji_id'] is int
                ? json['bot_verification_icon_custom_emoji_id']
                : int.tryParse(
                        json['bot_verification_icon_custom_emoji_id'] ?? "") ??
                    0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_verified": isVerified,
      "is_scam": isScam,
      "is_fake": isFake,
      "bot_verification_icon_custom_emoji_id": botVerificationIconCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_verified]: True, if the chat or the user is verified by Telegram
  /// * [is_scam]: True, if the chat or the user is marked as scam by Telegram
  /// * [is_fake]: True, if the chat or the user is marked as fake by Telegram
  /// * [bot_verification_icon_custom_emoji_id]: Identifier of the custom emoji to be shown as verification sign provided by a bot for the user; 0 if none
  VerificationStatus copyWith({
    bool? isVerified,
    bool? isScam,
    bool? isFake,
    int? botVerificationIconCustomEmojiId,
  }) =>
      VerificationStatus(
        isVerified: isVerified ?? this.isVerified,
        isScam: isScam ?? this.isScam,
        isFake: isFake ?? this.isFake,
        botVerificationIconCustomEmojiId: botVerificationIconCustomEmojiId ??
            this.botVerificationIconCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'verificationStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
