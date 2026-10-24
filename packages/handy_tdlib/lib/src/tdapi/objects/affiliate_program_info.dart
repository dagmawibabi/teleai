part of '../tdapi.dart';

/// **AffiliateProgramInfo** *(affiliateProgramInfo)* - basic class
///
/// Contains information about an active affiliate program.
///
/// * [parameters]: Parameters of the affiliate program.
/// * [endDate]: Point in time (Unix timestamp) when the affiliate program will be closed; 0 if the affiliate program isn't scheduled to be closed.. If positive, then the program can't be connected using connectAffiliateProgram, but active connections will work until the date.
/// * [dailyRevenuePerUserAmount]: The amount of daily revenue per user in Telegram Stars of the bot that created the affiliate program.
final class AffiliateProgramInfo extends TdObject {
  /// **AffiliateProgramInfo** *(affiliateProgramInfo)* - basic class
  ///
  /// Contains information about an active affiliate program.
  ///
  /// * [parameters]: Parameters of the affiliate program.
  /// * [endDate]: Point in time (Unix timestamp) when the affiliate program will be closed; 0 if the affiliate program isn't scheduled to be closed.. If positive, then the program can't be connected using connectAffiliateProgram, but active connections will work until the date.
  /// * [dailyRevenuePerUserAmount]: The amount of daily revenue per user in Telegram Stars of the bot that created the affiliate program.
  const AffiliateProgramInfo({
    required this.parameters,
    required this.endDate,
    required this.dailyRevenuePerUserAmount,
  });

  /// Parameters of the affiliate program
  final AffiliateProgramParameters parameters;

  /// Point in time (Unix timestamp) when the affiliate program will be closed; 0 if the affiliate program isn't scheduled to be closed.. If positive, then the program can't be connected using connectAffiliateProgram, but active connections will work until the date
  final int endDate;

  /// The amount of daily revenue per user in Telegram Stars of the bot that created the affiliate program
  final StarAmount dailyRevenuePerUserAmount;

  /// Parse from a json
  factory AffiliateProgramInfo.fromJson(Map<String, dynamic> json) =>
      AffiliateProgramInfo(
        parameters: AffiliateProgramParameters.fromJson(json['parameters']),
        endDate: json['end_date'],
        dailyRevenuePerUserAmount:
            StarAmount.fromJson(json['daily_revenue_per_user_amount']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters.toJson(),
      "end_date": endDate,
      "daily_revenue_per_user_amount": dailyRevenuePerUserAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Parameters of the affiliate program
  /// * [end_date]: Point in time (Unix timestamp) when the affiliate program will be closed; 0 if the affiliate program isn't scheduled to be closed.. If positive, then the program can't be connected using connectAffiliateProgram, but active connections will work until the date
  /// * [daily_revenue_per_user_amount]: The amount of daily revenue per user in Telegram Stars of the bot that created the affiliate program
  AffiliateProgramInfo copyWith({
    AffiliateProgramParameters? parameters,
    int? endDate,
    StarAmount? dailyRevenuePerUserAmount,
  }) =>
      AffiliateProgramInfo(
        parameters: parameters ?? this.parameters,
        endDate: endDate ?? this.endDate,
        dailyRevenuePerUserAmount:
            dailyRevenuePerUserAmount ?? this.dailyRevenuePerUserAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'affiliateProgramInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
