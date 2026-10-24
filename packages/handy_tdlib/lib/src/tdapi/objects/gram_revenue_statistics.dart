part of '../tdapi.dart';

/// **GramRevenueStatistics** *(gramRevenueStatistics)* - basic class
///
/// A detailed statistics about TON Grams earned by the current user.
///
/// * [revenueByDayGraph]: A graph containing amount of revenue in a given day.
/// * [status]: Amount of earned revenue.
/// * [usdRate]: Current exchange rate of nanogram to USD cents.
final class GramRevenueStatistics extends TdObject {
  /// **GramRevenueStatistics** *(gramRevenueStatistics)* - basic class
  ///
  /// A detailed statistics about TON Grams earned by the current user.
  ///
  /// * [revenueByDayGraph]: A graph containing amount of revenue in a given day.
  /// * [status]: Amount of earned revenue.
  /// * [usdRate]: Current exchange rate of nanogram to USD cents.
  const GramRevenueStatistics({
    required this.revenueByDayGraph,
    required this.status,
    required this.usdRate,
    this.extra,
    this.clientId,
  });

  /// A graph containing amount of revenue in a given day
  final StatisticalGraph revenueByDayGraph;

  /// Amount of earned revenue
  final GramRevenueStatus status;

  /// Current exchange rate of nanogram to USD cents
  final double usdRate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GramRevenueStatistics.fromJson(Map<String, dynamic> json) =>
      GramRevenueStatistics(
        revenueByDayGraph:
            StatisticalGraph.fromJson(json['revenue_by_day_graph']),
        status: GramRevenueStatus.fromJson(json['status']),
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
  /// * [status]: Amount of earned revenue
  /// * [usd_rate]: Current exchange rate of nanogram to USD cents
  GramRevenueStatistics copyWith({
    StatisticalGraph? revenueByDayGraph,
    GramRevenueStatus? status,
    double? usdRate,
    dynamic extra,
    int? clientId,
  }) =>
      GramRevenueStatistics(
        revenueByDayGraph: revenueByDayGraph ?? this.revenueByDayGraph,
        status: status ?? this.status,
        usdRate: usdRate ?? this.usdRate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'gramRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
