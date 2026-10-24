part of '../tdapi.dart';

/// **UpgradedGiftModelCount** *(upgradedGiftModelCount)* - basic class
///
/// Describes a model of an upgraded gift with the number of gifts found.
///
/// * [model]: The model.
/// * [totalCount]: Total number of gifts with the model.
final class UpgradedGiftModelCount extends TdObject {
  /// **UpgradedGiftModelCount** *(upgradedGiftModelCount)* - basic class
  ///
  /// Describes a model of an upgraded gift with the number of gifts found.
  ///
  /// * [model]: The model.
  /// * [totalCount]: Total number of gifts with the model.
  const UpgradedGiftModelCount({
    required this.model,
    required this.totalCount,
  });

  /// The model
  final UpgradedGiftModel model;

  /// Total number of gifts with the model
  final int totalCount;

  /// Parse from a json
  factory UpgradedGiftModelCount.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftModelCount(
        model: UpgradedGiftModel.fromJson(json['model']),
        totalCount: json['total_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "model": model.toJson(),
      "total_count": totalCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [model]: The model
  /// * [total_count]: Total number of gifts with the model
  UpgradedGiftModelCount copyWith({
    UpgradedGiftModel? model,
    int? totalCount,
  }) =>
      UpgradedGiftModelCount(
        model: model ?? this.model,
        totalCount: totalCount ?? this.totalCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftModelCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
