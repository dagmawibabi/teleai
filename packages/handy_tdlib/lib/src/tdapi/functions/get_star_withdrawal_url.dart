part of '../tdapi.dart';

/// **GetStarWithdrawalUrl** *(getStarWithdrawalUrl)* - TDLib function
///
/// Returns a URL for Telegram Star withdrawal.
///
/// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or an owned supergroup or channel chat.
/// * [starCount]: The number of Telegram Stars to withdraw; must be between getOption("star_withdrawal_count_min") and getOption("star_withdrawal_count_max").
/// * [password]: The 2-step verification password of the current user.
///
/// [HttpUrl] is returned on completion.
final class GetStarWithdrawalUrl extends TdFunction {
  /// **GetStarWithdrawalUrl** *(getStarWithdrawalUrl)* - TDLib function
  ///
  /// Returns a URL for Telegram Star withdrawal.
  ///
  /// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or an owned supergroup or channel chat.
  /// * [starCount]: The number of Telegram Stars to withdraw; must be between getOption("star_withdrawal_count_min") and getOption("star_withdrawal_count_max").
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [HttpUrl] is returned on completion.
  const GetStarWithdrawalUrl({
    required this.ownerId,
    required this.starCount,
    required this.password,
  });

  /// Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or an owned supergroup or channel chat
  final MessageSender ownerId;

  /// The number of Telegram Stars to withdraw; must be between getOption("star_withdrawal_count_min") and getOption("star_withdrawal_count_max")
  final int starCount;

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "star_count": starCount,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or an owned supergroup or channel chat
  /// * [star_count]: The number of Telegram Stars to withdraw; must be between getOption("star_withdrawal_count_min") and getOption("star_withdrawal_count_max")
  /// * [password]: The 2-step verification password of the current user
  GetStarWithdrawalUrl copyWith({
    MessageSender? ownerId,
    int? starCount,
    String? password,
  }) =>
      GetStarWithdrawalUrl(
        ownerId: ownerId ?? this.ownerId,
        starCount: starCount ?? this.starCount,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarWithdrawalUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
