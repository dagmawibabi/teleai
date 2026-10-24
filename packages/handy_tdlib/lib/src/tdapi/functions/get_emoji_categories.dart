part of '../tdapi.dart';

/// **GetEmojiCategories** *(getEmojiCategories)* - TDLib function
///
/// Returns available emoji categories.
///
/// * [type]: Type of emoji categories to return; pass null to get default emoji categories *(optional)*.
///
/// [EmojiCategories] is returned on completion.
final class GetEmojiCategories extends TdFunction {
  /// **GetEmojiCategories** *(getEmojiCategories)* - TDLib function
  ///
  /// Returns available emoji categories.
  ///
  /// * [type]: Type of emoji categories to return; pass null to get default emoji categories *(optional)*.
  ///
  /// [EmojiCategories] is returned on completion.
  const GetEmojiCategories({
    this.type,
  });

  /// Type of emoji categories to return; pass null to get default emoji categories
  final EmojiCategoryType? type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of emoji categories to return; pass null to get default emoji categories
  GetEmojiCategories copyWith({
    EmojiCategoryType? type,
  }) =>
      GetEmojiCategories(
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getEmojiCategories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
