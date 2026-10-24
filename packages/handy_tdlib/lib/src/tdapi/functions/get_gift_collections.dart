part of '../tdapi.dart';

/// **GetGiftCollections** *(getGiftCollections)* - TDLib function
///
/// Returns collections of gifts owned by the given user or chat.
///
/// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
///
/// [GiftCollections] is returned on completion.
final class GetGiftCollections extends TdFunction {
  /// **GetGiftCollections** *(getGiftCollections)* - TDLib function
  ///
  /// Returns collections of gifts owned by the given user or chat.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
  ///
  /// [GiftCollections] is returned on completion.
  const GetGiftCollections({
    required this.ownerId,
  });

  /// Identifier of the user or the channel chat that received the gifts
  final MessageSender ownerId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that received the gifts
  GetGiftCollections copyWith({
    MessageSender? ownerId,
  }) =>
      GetGiftCollections(
        ownerId: ownerId ?? this.ownerId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftCollections';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
