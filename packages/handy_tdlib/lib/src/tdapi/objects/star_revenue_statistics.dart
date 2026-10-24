part of '../tdapi.dart';

/// **StarRevenueStatistics** *(starRevenueStatistics)* - basic class
///
/// A detailed statistics about Telegram Stars earned by a user or a chat.
///
/// * [revenueByDayGraph]: A graph containing amount of revenue in a given day.
/// * [status]: Telegram Star revenue status.
/// * [usdRate]: Current exchange rate of a Telegram Star to USD.
final class StarRevenueStatistics extends TdObject {
  /// **StarRevenueStatistics** *(starRevenueStatistics)* - basic class
  ///
  /// A detailed statistics about Telegram Stars earned by a user or a chat.
  ///
  /// * [revenueByDayGraph]: A graph containing amount of revenue in a given day.
  /// * [status]: Telegram Star revenue status.
  /// * [usdRate]: Current exchange rate of a Telegram Star to USD.
  const StarRevenueStatistics({
    required this.revenueByDayGraph,
    required this.status,
    required this.usdRate,
    this.extra,
    this.clientId,
  });

  /// A graph containing amount of revenue in a given day
  final StatisticalGraph revenueByDayGraph;

  /// Telegram Star revenue status
  final StarRevenueStatus status;

  /// Current exchange rate of a Telegram Star to USD
  final double usdRate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarRevenueStatistics.fromJson(Map<String, dynamic> json) =>
      StarRevenueStatistics(
        revenueByDayGraph:
            StatisticalGraph.fromJson(json['revenue_by_day_graph']),
        status: StarRevenueStatus.fromJson(json['status']),
        usdRate: json['usd_rate'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "revenue_by_day_graph": revenueByDayGraph.toJson(),
      "status": status.toJson(),
      "usd_rate": usdRate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [revenue_by_day_graph]: A graph containing amount of revenue in a given day
  /// * [status]: Telegram Star revenue status
  /// * [usd_rate]: Current exchange rate of a Telegram Star to USD
  StarRevenueStatistics copyWith({
    StatisticalGraph? revenueByDayGraph,
    StarRevenueStatus? status,
    double? usdRate,
    dynamic extra,
    int? clientId,
  }) =>
      StarRevenueStatistics(
        revenueByDayGraph: revenueByDayGraph ?? this.revenueByDayGraph,
        status: status ?? this.status,
        usdRate: usdRate ?? this.usdRate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
