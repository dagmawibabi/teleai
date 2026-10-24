part of '../tdapi.dart';

/// **StickerSets** *(stickerSets)* - basic class
///
/// Represents a list of sticker sets.
///
/// * [totalCount]: Approximate total number of sticker sets found.
/// * [sets]: List of sticker sets.
final class StickerSets extends TdObject {
  /// **StickerSets** *(stickerSets)* - basic class
  ///
  /// Represents a list of sticker sets.
  ///
  /// * [totalCount]: Approximate total number of sticker sets found.
  /// * [sets]: List of sticker sets.
  const StickerSets({
    required this.totalCount,
    required this.sets,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of sticker sets found
  final int totalCount;

  /// List of sticker sets
  final List<StickerSetInfo> sets;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StickerSets.fromJson(Map<String, dynamic> json) => StickerSets(
        totalCount: json['total_count'],
        sets: List<StickerSetInfo>.from((json['sets'] ?? [])
            .map((item) => StickerSetInfo.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "sets": sets.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of sticker sets found
  /// * [sets]: List of sticker sets
  StickerSets copyWith({
    int? totalCount,
    List<StickerSetInfo>? sets,
    dynamic extra,
    int? clientId,
  }) =>
      StickerSets(
        totalCount: totalCount ?? this.totalCount,
        sets: sets ?? this.sets,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
