part of '../tdapi.dart';

/// **TransferBusinessAccountStars** *(transferBusinessAccountStars)* - TDLib function
///
/// Transfers Telegram Stars from the business account to the business bot; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [starCount]: Number of Telegram Stars to transfer.
///
/// [Ok] is returned on completion.
final class TransferBusinessAccountStars extends TdFunction {
  /// **TransferBusinessAccountStars** *(transferBusinessAccountStars)* - TDLib function
  ///
  /// Transfers Telegram Stars from the business account to the business bot; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [starCount]: Number of Telegram Stars to transfer.
  ///
  /// [Ok] is returned on completion.
  const TransferBusinessAccountStars({
    required this.businessConnectionId,
    required this.starCount,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// Number of Telegram Stars to transfer
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [star_count]: Number of Telegram Stars to transfer
  TransferBusinessAccountStars copyWith({
    String? businessConnectionId,
    int? starCount,
  }) =>
      TransferBusinessAccountStars(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'transferBusinessAccountStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
