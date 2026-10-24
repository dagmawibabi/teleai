part of '../tdapi.dart';

/// **AffiliateProgramParameters** *(affiliateProgramParameters)* - basic class
///
/// Describes parameters of an affiliate program.
///
/// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner;. getOption("affiliate_program_commission_per_mille_min")-getOption("affiliate_program_commission_per_mille_max").
/// * [monthCount]: Number of months the program will be active; 0-36. If 0, then the program is eternal.
final class AffiliateProgramParameters extends TdObject {
  /// **AffiliateProgramParameters** *(affiliateProgramParameters)* - basic class
  ///
  /// Describes parameters of an affiliate program.
  ///
  /// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner;. getOption("affiliate_program_commission_per_mille_min")-getOption("affiliate_program_commission_per_mille_max").
  /// * [monthCount]: Number of months the program will be active; 0-36. If 0, then the program is eternal.
  const AffiliateProgramParameters({
    required this.commissionPerMille,
    required this.monthCount,
  });

  /// The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner;. getOption("affiliate_program_commission_per_mille_min")-getOption("affiliate_program_commission_per_mille_max")
  final int commissionPerMille;

  /// Number of months the program will be active; 0-36. If 0, then the program is eternal
  final int monthCount;

  /// Parse from a json
  factory AffiliateProgramParameters.fromJson(Map<String, dynamic> json) =>
      AffiliateProgramParameters(
        commissionPerMille: json['commission_per_mille'],
        monthCount: json['month_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "commission_per_mille": commissionPerMille,
      "month_count": monthCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [commission_per_mille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner;. getOption("affiliate_program_commission_per_mille_min")-getOption("affiliate_program_commission_per_mille_max")
  /// * [month_count]: Number of months the program will be active; 0-36. If 0, then the program is eternal
  AffiliateProgramParameters copyWith({
    int? commissionPerMille,
    int? monthCount,
  }) =>
      AffiliateProgramParameters(
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        monthCount: monthCount ?? this.monthCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'affiliateProgramParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
