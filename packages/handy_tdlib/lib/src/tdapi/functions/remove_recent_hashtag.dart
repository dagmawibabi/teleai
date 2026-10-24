part of '../tdapi.dart';

/// **RemoveRecentHashtag** *(removeRecentHashtag)* - TDLib function
///
/// Removes a hashtag from the list of recently used hashtags.
///
/// * [hashtag]: Hashtag to delete.
///
/// [Ok] is returned on completion.
final class RemoveRecentHashtag extends TdFunction {
  /// **RemoveRecentHashtag** *(removeRecentHashtag)* - TDLib function
  ///
  /// Removes a hashtag from the list of recently used hashtags.
  ///
  /// * [hashtag]: Hashtag to delete.
  ///
  /// [Ok] is returned on completion.
  const RemoveRecentHashtag({
    required this.hashtag,
  });

  /// Hashtag to delete
  final String hashtag;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "hashtag": hashtag,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [hashtag]: Hashtag to delete
  RemoveRecentHashtag copyWith({
    String? hashtag,
  }) =>
      RemoveRecentHashtag(
        hashtag: hashtag ?? this.hashtag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeRecentHashtag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
