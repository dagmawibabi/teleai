part of '../tdapi.dart';

/// **SetPinnedGifts** *(setPinnedGifts)* - TDLib function
///
/// Changes the list of pinned gifts on the current user's or the channel's profile page; requires can_post_messages administrator right in the channel chat.
///
/// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
/// * [receivedGiftIds]: New list of pinned gifts. All gifts must be upgraded and saved on the profile page first. There can be up to getOption("pinned_gift_count_max") pinned gifts.
///
/// [Ok] is returned on completion.
final class SetPinnedGifts extends TdFunction {
  /// **SetPinnedGifts** *(setPinnedGifts)* - TDLib function
  ///
  /// Changes the list of pinned gifts on the current user's or the channel's profile page; requires can_post_messages administrator right in the channel chat.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
  /// * [receivedGiftIds]: New list of pinned gifts. All gifts must be upgraded and saved on the profile page first. There can be up to getOption("pinned_gift_count_max") pinned gifts.
  ///
  /// [Ok] is returned on completion.
  const SetPinnedGifts({
    required this.ownerId,
    required this.receivedGiftIds,
  });

  /// Identifier of the user or the channel chat that received the gifts
  final MessageSender ownerId;

  /// New list of pinned gifts. All gifts must be upgraded and saved on the profile page first. There can be up to getOption("pinned_gift_count_max") pinned gifts
  final List<String> receivedGiftIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "received_gift_ids": receivedGiftIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that received the gifts
  /// * [received_gift_ids]: New list of pinned gifts. All gifts must be upgraded and saved on the profile page first. There can be up to getOption("pinned_gift_count_max") pinned gifts
  SetPinnedGifts copyWith({
    MessageSender? ownerId,
    List<String>? receivedGiftIds,
  }) =>
      SetPinnedGifts(
        ownerId: ownerId ?? this.ownerId,
        receivedGiftIds: receivedGiftIds ?? this.receivedGiftIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPinnedGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
