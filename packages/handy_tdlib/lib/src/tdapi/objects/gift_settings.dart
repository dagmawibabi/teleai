part of '../tdapi.dart';

/// **GiftSettings** *(giftSettings)* - basic class
///
/// Contains settings for gift receiving for a user.
///
/// * [showGiftButton]: True, if a button for sending a gift to the user or by the user must always be shown in the input field.
/// * [acceptedGiftTypes]: Types of gifts accepted by the user; for Telegram Premium users only.
final class GiftSettings extends TdObject {
  /// **GiftSettings** *(giftSettings)* - basic class
  ///
  /// Contains settings for gift receiving for a user.
  ///
  /// * [showGiftButton]: True, if a button for sending a gift to the user or by the user must always be shown in the input field.
  /// * [acceptedGiftTypes]: Types of gifts accepted by the user; for Telegram Premium users only.
  const GiftSettings({
    required this.showGiftButton,
    required this.acceptedGiftTypes,
  });

  /// True, if a button for sending a gift to the user or by the user must always be shown in the input field
  final bool showGiftButton;

  /// Types of gifts accepted by the user; for Telegram Premium users only
  final AcceptedGiftTypes acceptedGiftTypes;

  /// Parse from a json
  factory GiftSettings.fromJson(Map<String, dynamic> json) => GiftSettings(
        showGiftButton: json['show_gift_button'],
        acceptedGiftTypes:
            AcceptedGiftTypes.fromJson(json['accepted_gift_types']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "show_gift_button": showGiftButton,
      "accepted_gift_types": acceptedGiftTypes.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [show_gift_button]: True, if a button for sending a gift to the user or by the user must always be shown in the input field
  /// * [accepted_gift_types]: Types of gifts accepted by the user; for Telegram Premium users only
  GiftSettings copyWith({
    bool? showGiftButton,
    AcceptedGiftTypes? acceptedGiftTypes,
  }) =>
      GiftSettings(
        showGiftButton: showGiftButton ?? this.showGiftButton,
        acceptedGiftTypes: acceptedGiftTypes ?? this.acceptedGiftTypes,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
