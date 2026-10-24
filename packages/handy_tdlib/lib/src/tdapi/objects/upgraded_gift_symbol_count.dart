part of '../tdapi.dart';

/// **UpgradedGiftSymbolCount** *(upgradedGiftSymbolCount)* - basic class
///
/// Describes a symbol shown on the pattern of an upgraded gift.
///
/// * [symbol]: The symbol.
/// * [totalCount]: Total number of gifts with the symbol.
final class UpgradedGiftSymbolCount extends TdObject {
  /// **UpgradedGiftSymbolCount** *(upgradedGiftSymbolCount)* - basic class
  ///
  /// Describes a symbol shown on the pattern of an upgraded gift.
  ///
  /// * [symbol]: The symbol.
  /// * [totalCount]: Total number of gifts with the symbol.
  const UpgradedGiftSymbolCount({
    required this.symbol,
    required this.totalCount,
  });

  /// The symbol
  final UpgradedGiftSymbol symbol;

  /// Total number of gifts with the symbol
  final int totalCount;

  /// Parse from a json
  factory UpgradedGiftSymbolCount.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftSymbolCount(
        symbol: UpgradedGiftSymbol.fromJson(json['symbol']),
        totalCount: json['total_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "symbol": symbol.toJson(),
      "total_count": totalCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [symbol]: The symbol
  /// * [total_count]: Total number of gifts with the symbol
  UpgradedGiftSymbolCount copyWith({
    UpgradedGiftSymbol? symbol,
    int? totalCount,
  }) =>
      UpgradedGiftSymbolCount(
        symbol: symbol ?? this.symbol,
        totalCount: totalCount ?? this.totalCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftSymbolCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
