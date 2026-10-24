part of '../tdapi.dart';

/// **ChatRevenueStatistics** *(chatRevenueStatistics)* - basic class
///
/// A detailed statistics about revenue earned from sponsored messages in a chat.
///
/// * [revenueByHourGraph]: A graph containing amount of revenue in a given hour.
/// * [revenueGraph]: A graph containing amount of revenue.
/// * [revenueAmount]: Amount of earned revenue.
/// * [usdRate]: Current exchange rate of the cryptocurrency in which revenue is calculated to USD.
final class ChatRevenueStatistics extends TdObject {
  /// **ChatRevenueStatistics** *(chatRevenueStatistics)* - basic class
  ///
  /// A detailed statistics about revenue earned from sponsored messages in a chat.
  ///
  /// * [revenueByHourGraph]: A graph containing amount of revenue in a given hour.
  /// * [revenueGraph]: A graph containing amount of revenue.
  /// * [revenueAmount]: Amount of earned revenue.
  /// * [usdRate]: Current exchange rate of the cryptocurrency in which revenue is calculated to USD.
  const ChatRevenueStatistics({
    required this.revenueByHourGraph,
    required this.revenueGraph,
    required this.revenueAmount,
    required this.usdRate,
    this.extra,
    this.clientId,
  });

  /// A graph containing amount of revenue in a given hour
  final StatisticalGraph revenueByHourGraph;

  /// A graph containing amount of revenue
  final StatisticalGraph revenueGraph;

  /// Amount of earned revenue
  final ChatRevenueAmount revenueAmount;

  /// Current exchange rate of the cryptocurrency in which revenue is calculated to USD
  final double usdRate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatRevenueStatistics.fromJson(Map<String, dynamic> json) =>
      ChatRevenueStatistics(
        revenueByHourGraph:
            StatisticalGraph.fromJson(json['revenue_by_hour_graph']),
        revenueGraph: StatisticalGraph.fromJson(json['revenue_graph']),
        revenueAmount: ChatRevenueAmount.fromJson(json['revenue_amount']),
        usdRate: json['usd_rate'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "revenue_by_hour_graph": revenueByHourGraph.toJson(),
      "revenue_graph": revenueGraph.toJson(),
      "revenue_amount": revenueAmount.toJson(),
      "usd_rate": usdRate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [revenue_by_hour_graph]: A graph containing amount of revenue in a given hour
  /// * [revenue_graph]: A graph containing amount of revenue
  /// * [revenue_amount]: Amount of earned revenue
  /// * [usd_rate]: Current exchange rate of the cryptocurrency in which revenue is calculated to USD
  ChatRevenueStatistics copyWith({
    StatisticalGraph? revenueByHourGraph,
    StatisticalGraph? revenueGraph,
    ChatRevenueAmount? revenueAmount,
    double? usdRate,
    dynamic extra,
    int? clientId,
  }) =>
      ChatRevenueStatistics(
        revenueByHourGraph: revenueByHourGraph ?? this.revenueByHourGraph,
        revenueGraph: revenueGraph ?? this.revenueGraph,
        revenueAmount: revenueAmount ?? this.revenueAmount,
        usdRate: usdRate ?? this.usdRate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
