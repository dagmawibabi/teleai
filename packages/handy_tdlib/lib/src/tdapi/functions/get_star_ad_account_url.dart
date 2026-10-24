part of '../tdapi.dart';

/// **GetStarAdAccountUrl** *(getStarAdAccountUrl)* - TDLib function
///
/// Returns a URL for a Telegram Ad platform account that can be used to set up advertisements for the chat paid in the owned Telegram Stars.
///
/// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat.
///
/// [HttpUrl] is returned on completion.
final class GetStarAdAccountUrl extends TdFunction {
  /// **GetStarAdAccountUrl** *(getStarAdAccountUrl)* - TDLib function
  ///
  /// Returns a URL for a Telegram Ad platform account that can be used to set up advertisements for the chat paid in the owned Telegram Stars.
  ///
  /// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat.
  ///
  /// [HttpUrl] is returned on completion.
  const GetStarAdAccountUrl({
    required this.ownerId,
  });

  /// Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat
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
  /// * [owner_id]: Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat
  GetStarAdAccountUrl copyWith({
    MessageSender? ownerId,
  }) =>
      GetStarAdAccountUrl(
        ownerId: ownerId ?? this.ownerId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarAdAccountUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
