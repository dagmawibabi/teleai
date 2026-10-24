part of '../tdapi.dart';

/// **CheckStickerSetName** *(checkStickerSetName)* - TDLib function
///
/// Checks whether a name can be used for a new sticker set.
///
/// * [name]: Name to be checked.
///
/// [CheckStickerSetNameResult] is returned on completion.
final class CheckStickerSetName extends TdFunction {
  /// **CheckStickerSetName** *(checkStickerSetName)* - TDLib function
  ///
  /// Checks whether a name can be used for a new sticker set.
  ///
  /// * [name]: Name to be checked.
  ///
  /// [CheckStickerSetNameResult] is returned on completion.
  const CheckStickerSetName({
    required this.name,
  });

  /// Name to be checked
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name to be checked
  CheckStickerSetName copyWith({
    String? name,
  }) =>
      CheckStickerSetName(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkStickerSetName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
