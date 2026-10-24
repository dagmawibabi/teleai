part of '../tdapi.dart';

/// **ChangeStickerSet** *(changeStickerSet)* - TDLib function
///
/// Installs/uninstalls or activates/archives a sticker set.
///
/// * [setId]: Identifier of the sticker set.
/// * [isInstalled]: The new value of is_installed.
/// * [isArchived]: The new value of is_archived. A sticker set can't be installed and archived simultaneously.
///
/// [Ok] is returned on completion.
final class ChangeStickerSet extends TdFunction {
  /// **ChangeStickerSet** *(changeStickerSet)* - TDLib function
  ///
  /// Installs/uninstalls or activates/archives a sticker set.
  ///
  /// * [setId]: Identifier of the sticker set.
  /// * [isInstalled]: The new value of is_installed.
  /// * [isArchived]: The new value of is_archived. A sticker set can't be installed and archived simultaneously.
  ///
  /// [Ok] is returned on completion.
  const ChangeStickerSet({
    required this.setId,
    required this.isInstalled,
    required this.isArchived,
  });

  /// Identifier of the sticker set
  final int setId;

  /// The new value of is_installed
  final bool isInstalled;

  /// The new value of is_archived. A sticker set can't be installed and archived simultaneously
  final bool isArchived;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "set_id": setId,
      "is_installed": isInstalled,
      "is_archived": isArchived,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [set_id]: Identifier of the sticker set
  /// * [is_installed]: The new value of is_installed
  /// * [is_archived]: The new value of is_archived. A sticker set can't be installed and archived simultaneously
  ChangeStickerSet copyWith({
    int? setId,
    bool? isInstalled,
    bool? isArchived,
  }) =>
      ChangeStickerSet(
        setId: setId ?? this.setId,
        isInstalled: isInstalled ?? this.isInstalled,
        isArchived: isArchived ?? this.isArchived,
      );

  /// TDLib object type
  static const String defaultObjectId = 'changeStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
