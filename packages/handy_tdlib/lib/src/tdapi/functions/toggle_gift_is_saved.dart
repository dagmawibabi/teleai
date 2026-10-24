part of '../tdapi.dart';

/// **ToggleGiftIsSaved** *(toggleGiftIsSaved)* - TDLib function
///
/// Toggles whether a gift is shown on the current user's or the channel's profile page; requires can_post_messages administrator right in the channel chat.
///
/// * [receivedGiftId]: Identifier of the gift.
/// * [isSaved]: Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page.
///
/// [Ok] is returned on completion.
final class ToggleGiftIsSaved extends TdFunction {
  /// **ToggleGiftIsSaved** *(toggleGiftIsSaved)* - TDLib function
  ///
  /// Toggles whether a gift is shown on the current user's or the channel's profile page; requires can_post_messages administrator right in the channel chat.
  ///
  /// * [receivedGiftId]: Identifier of the gift.
  /// * [isSaved]: Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page.
  ///
  /// [Ok] is returned on completion.
  const ToggleGiftIsSaved({
    required this.receivedGiftId,
    required this.isSaved,
  });

  /// Identifier of the gift
  final String receivedGiftId;

  /// Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page
  final bool isSaved;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "is_saved": isSaved,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the gift
  /// * [is_saved]: Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page
  ToggleGiftIsSaved copyWith({
    String? receivedGiftId,
    bool? isSaved,
  }) =>
      ToggleGiftIsSaved(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        isSaved: isSaved ?? this.isSaved,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGiftIsSaved';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
