part of '../tdapi.dart';

/// **RemoveSearchedForTag** *(removeSearchedForTag)* - TDLib function
///
/// Removes a hashtag or a cashtag from the list of recently searched for hashtags or cashtags.
///
/// * [tag]: Hashtag or cashtag to delete.
///
/// [Ok] is returned on completion.
final class RemoveSearchedForTag extends TdFunction {
  /// **RemoveSearchedForTag** *(removeSearchedForTag)* - TDLib function
  ///
  /// Removes a hashtag or a cashtag from the list of recently searched for hashtags or cashtags.
  ///
  /// * [tag]: Hashtag or cashtag to delete.
  ///
  /// [Ok] is returned on completion.
  const RemoveSearchedForTag({
    required this.tag,
  });

  /// Hashtag or cashtag to delete
  final String tag;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag": tag,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: Hashtag or cashtag to delete
  RemoveSearchedForTag copyWith({
    String? tag,
  }) =>
      RemoveSearchedForTag(
        tag: tag ?? this.tag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeSearchedForTag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
