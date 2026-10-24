part of '../tdapi.dart';

/// **UpgradedGiftBackdropCount** *(upgradedGiftBackdropCount)* - basic class
///
/// Describes a backdrop of an upgraded gift.
///
/// * [backdrop]: The backdrop.
/// * [totalCount]: Total number of gifts with the backdrop.
final class UpgradedGiftBackdropCount extends TdObject {
  /// **UpgradedGiftBackdropCount** *(upgradedGiftBackdropCount)* - basic class
  ///
  /// Describes a backdrop of an upgraded gift.
  ///
  /// * [backdrop]: The backdrop.
  /// * [totalCount]: Total number of gifts with the backdrop.
  const UpgradedGiftBackdropCount({
    required this.backdrop,
    required this.totalCount,
  });

  /// The backdrop
  final UpgradedGiftBackdrop backdrop;

  /// Total number of gifts with the backdrop
  final int totalCount;

  /// Parse from a json
  factory UpgradedGiftBackdropCount.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftBackdropCount(
        backdrop: UpgradedGiftBackdrop.fromJson(json['backdrop']),
        totalCount: json['total_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "backdrop": backdrop.toJson(),
      "total_count": totalCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [backdrop]: The backdrop
  /// * [total_count]: Total number of gifts with the backdrop
  UpgradedGiftBackdropCount copyWith({
    UpgradedGiftBackdrop? backdrop,
    int? totalCount,
  }) =>
      UpgradedGiftBackdropCount(
        backdrop: backdrop ?? this.backdrop,
        totalCount: totalCount ?? this.totalCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftBackdropCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
