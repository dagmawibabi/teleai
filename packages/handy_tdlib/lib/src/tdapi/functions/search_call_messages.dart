part of '../tdapi.dart';

/// **SearchCallMessages** *(searchCallMessages)* - TDLib function
///
/// Searches for call and group call messages. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib.
///
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
/// * [onlyMissed]: Pass true to search only for messages with missed/declined calls.
///
/// [FoundMessages] is returned on completion.
final class SearchCallMessages extends TdFunction {
  /// **SearchCallMessages** *(searchCallMessages)* - TDLib function
  ///
  /// Searches for call and group call messages. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib.
  ///
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  /// * [onlyMissed]: Pass true to search only for messages with missed/declined calls.
  ///
  /// [FoundMessages] is returned on completion.
  const SearchCallMessages({
    required this.offset,
    required this.limit,
    required this.onlyMissed,
  });

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Pass true to search only for messages with missed/declined calls
  final bool onlyMissed;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "offset": offset,
      "limit": limit,
      "only_missed": onlyMissed,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  /// * [only_missed]: Pass true to search only for messages with missed/declined calls
  SearchCallMessages copyWith({
    String? offset,
    int? limit,
    bool? onlyMissed,
  }) =>
      SearchCallMessages(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        onlyMissed: onlyMissed ?? this.onlyMissed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchCallMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
