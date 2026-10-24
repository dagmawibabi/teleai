part of '../tdapi.dart';

/// **GetGiftChatThemes** *(getGiftChatThemes)* - TDLib function
///
/// Returns available to the current user gift chat themes.
///
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of chat themes to return.
///
/// [GiftChatThemes] is returned on completion.
final class GetGiftChatThemes extends TdFunction {
  /// **GetGiftChatThemes** *(getGiftChatThemes)* - TDLib function
  ///
  /// Returns available to the current user gift chat themes.
  ///
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of chat themes to return.
  ///
  /// [GiftChatThemes] is returned on completion.
  const GetGiftChatThemes({
    required this.offset,
    required this.limit,
  });

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of chat themes to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of chat themes to return
  GetGiftChatThemes copyWith({
    String? offset,
    int? limit,
  }) =>
      GetGiftChatThemes(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftChatThemes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
