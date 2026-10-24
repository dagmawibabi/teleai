part of '../tdapi.dart';

/// **BotVerificationParameters** *(botVerificationParameters)* - basic class
///
/// Describes parameters of verification that is provided by a bot.
///
/// * [iconCustomEmojiId]: Identifier of the custom emoji that is used as the verification sign.
/// * [organizationName]: Name of the organization that provides verification.
/// * [defaultCustomDescription]: Default custom description of verification reason to be used as placeholder in setMessageSenderBotVerification; may be null if none *(optional)*.
/// * [canSetCustomDescription]: True, if the bot is allowed to provide custom description for verified entities.
final class BotVerificationParameters extends TdObject {
  /// **BotVerificationParameters** *(botVerificationParameters)* - basic class
  ///
  /// Describes parameters of verification that is provided by a bot.
  ///
  /// * [iconCustomEmojiId]: Identifier of the custom emoji that is used as the verification sign.
  /// * [organizationName]: Name of the organization that provides verification.
  /// * [defaultCustomDescription]: Default custom description of verification reason to be used as placeholder in setMessageSenderBotVerification; may be null if none *(optional)*.
  /// * [canSetCustomDescription]: True, if the bot is allowed to provide custom description for verified entities.
  const BotVerificationParameters({
    required this.iconCustomEmojiId,
    required this.organizationName,
    this.defaultCustomDescription,
    required this.canSetCustomDescription,
  });

  /// Identifier of the custom emoji that is used as the verification sign
  final int iconCustomEmojiId;

  /// Name of the organization that provides verification
  final String organizationName;

  /// Default custom description of verification reason to be used as placeholder in setMessageSenderBotVerification; may be null if none
  final FormattedText? defaultCustomDescription;

  /// True, if the bot is allowed to provide custom description for verified entities
  final bool canSetCustomDescription;

  /// Parse from a json
  factory BotVerificationParameters.fromJson(Map<String, dynamic> json) =>
      BotVerificationParameters(
        iconCustomEmojiId: json['icon_custom_emoji_id'] is int
            ? json['icon_custom_emoji_id']
            : int.parse(json['icon_custom_emoji_id']),
        organizationName: json['organization_name'],
        defaultCustomDescription: json['default_custom_description'] == null
            ? null
            : FormattedText.fromJson(json['default_custom_description']),
        canSetCustomDescription: json['can_set_custom_description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "icon_custom_emoji_id": iconCustomEmojiId,
      "organization_name": organizationName,
      "default_custom_description": defaultCustomDescription?.toJson(),
      "can_set_custom_description": canSetCustomDescription,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [icon_custom_emoji_id]: Identifier of the custom emoji that is used as the verification sign
  /// * [organization_name]: Name of the organization that provides verification
  /// * [default_custom_description]: Default custom description of verification reason to be used as placeholder in setMessageSenderBotVerification; may be null if none
  /// * [can_set_custom_description]: True, if the bot is allowed to provide custom description for verified entities
  BotVerificationParameters copyWith({
    int? iconCustomEmojiId,
    String? organizationName,
    FormattedText? defaultCustomDescription,
    bool? canSetCustomDescription,
  }) =>
      BotVerificationParameters(
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
        organizationName: organizationName ?? this.organizationName,
        defaultCustomDescription:
            defaultCustomDescription ?? this.defaultCustomDescription,
        canSetCustomDescription:
            canSetCustomDescription ?? this.canSetCustomDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botVerificationParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
