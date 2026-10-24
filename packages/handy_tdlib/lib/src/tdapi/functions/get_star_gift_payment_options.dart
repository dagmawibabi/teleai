part of '../tdapi.dart';

/// **GetStarGiftPaymentOptions** *(getStarGiftPaymentOptions)* - TDLib function
///
/// Returns available options for Telegram Stars gifting.
///
/// * [userId]: Identifier of the user who will receive Telegram Stars; pass 0 to get options for an unspecified user.
///
/// [StarPaymentOptions] is returned on completion.
final class GetStarGiftPaymentOptions extends TdFunction {
  /// **GetStarGiftPaymentOptions** *(getStarGiftPaymentOptions)* - TDLib function
  ///
  /// Returns available options for Telegram Stars gifting.
  ///
  /// * [userId]: Identifier of the user who will receive Telegram Stars; pass 0 to get options for an unspecified user.
  ///
  /// [StarPaymentOptions] is returned on completion.
  const GetStarGiftPaymentOptions({
    required this.userId,
  });

  /// Identifier of the user who will receive Telegram Stars; pass 0 to get options for an unspecified user
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who will receive Telegram Stars; pass 0 to get options for an unspecified user
  GetStarGiftPaymentOptions copyWith({
    int? userId,
  }) =>
      GetStarGiftPaymentOptions(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarGiftPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
