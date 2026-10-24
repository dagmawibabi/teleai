part of '../tdapi.dart';

/// **GetStarRevenueStatistics** *(getStarRevenueStatistics)* - TDLib function
///
/// Returns detailed Telegram Star revenue statistics.
///
/// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [StarRevenueStatistics] is returned on completion.
final class GetStarRevenueStatistics extends TdFunction {
  /// **GetStarRevenueStatistics** *(getStarRevenueStatistics)* - TDLib function
  ///
  /// Returns detailed Telegram Star revenue statistics.
  ///
  /// * [ownerId]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [StarRevenueStatistics] is returned on completion.
  const GetStarRevenueStatistics({
    required this.ownerId,
    required this.isDark,
  });

  /// Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
  final MessageSender ownerId;

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the owner of the Telegram Stars; can be identifier of the current user, an owned bot, or a supergroup or a channel chat with supergroupFullInfo.can_get_star_revenue_statistics == true
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetStarRevenueStatistics copyWith({
    MessageSender? ownerId,
    bool? isDark,
  }) =>
      GetStarRevenueStatistics(
        ownerId: ownerId ?? this.ownerId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
