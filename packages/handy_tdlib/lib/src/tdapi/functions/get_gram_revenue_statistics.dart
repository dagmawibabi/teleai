part of '../tdapi.dart';

/// **GetGramRevenueStatistics** *(getGramRevenueStatistics)* - TDLib function
///
/// Returns detailed TON Gram revenue statistics of the current user.
///
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [GramRevenueStatistics] is returned on completion.
final class GetGramRevenueStatistics extends TdFunction {
  /// **GetGramRevenueStatistics** *(getGramRevenueStatistics)* - TDLib function
  ///
  /// Returns detailed TON Gram revenue statistics of the current user.
  ///
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [GramRevenueStatistics] is returned on completion.
  const GetGramRevenueStatistics({
    required this.isDark,
  });

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetGramRevenueStatistics copyWith({
    bool? isDark,
  }) =>
      GetGramRevenueStatistics(
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGramRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
