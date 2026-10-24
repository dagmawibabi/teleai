part of '../tdapi.dart';

/// **SetBotProfilePhoto** *(setBotProfilePhoto)* - TDLib function
///
/// Changes a profile photo for a bot.
///
/// * [botUserId]: Identifier of the target bot.
/// * [photo]: Profile photo to set; pass null to delete the chat photo *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBotProfilePhoto extends TdFunction {
  /// **SetBotProfilePhoto** *(setBotProfilePhoto)* - TDLib function
  ///
  /// Changes a profile photo for a bot.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [photo]: Profile photo to set; pass null to delete the chat photo *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBotProfilePhoto({
    required this.botUserId,
    this.photo,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// Profile photo to set; pass null to delete the chat photo
  final InputChatPhoto? photo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "photo": photo?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [photo]: Profile photo to set; pass null to delete the chat photo
  SetBotProfilePhoto copyWith({
    int? botUserId,
    InputChatPhoto? photo,
  }) =>
      SetBotProfilePhoto(
        botUserId: botUserId ?? this.botUserId,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBotProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
