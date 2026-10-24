part of '../tdapi.dart';

/// **ViewTrendingStickerSets** *(viewTrendingStickerSets)* - TDLib function
///
/// Informs the server that some trending sticker sets have been viewed by the user.
///
/// * [stickerSetIds]: Identifiers of viewed trending sticker sets.
///
/// [Ok] is returned on completion.
final class ViewTrendingStickerSets extends TdFunction {
  /// **ViewTrendingStickerSets** *(viewTrendingStickerSets)* - TDLib function
  ///
  /// Informs the server that some trending sticker sets have been viewed by the user.
  ///
  /// * [stickerSetIds]: Identifiers of viewed trending sticker sets.
  ///
  /// [Ok] is returned on completion.
  const ViewTrendingStickerSets({
    required this.stickerSetIds,
  });

  /// Identifiers of viewed trending sticker sets
  final List<int> stickerSetIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_set_ids": stickerSetIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_set_ids]: Identifiers of viewed trending sticker sets
  ViewTrendingStickerSets copyWith({
    List<int>? stickerSetIds,
  }) =>
      ViewTrendingStickerSets(
        stickerSetIds: stickerSetIds ?? this.stickerSetIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'viewTrendingStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
