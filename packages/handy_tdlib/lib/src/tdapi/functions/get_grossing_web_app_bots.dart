part of '../tdapi.dart';

/// **GetGrossingWebAppBots** *(getGrossingWebAppBots)* - TDLib function
///
/// Returns the most grossing Web App bots.
///
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of bots to be returned; up to 100.
///
/// [FoundUsers] is returned on completion.
final class GetGrossingWebAppBots extends TdFunction {
  /// **GetGrossingWebAppBots** *(getGrossingWebAppBots)* - TDLib function
  ///
  /// Returns the most grossing Web App bots.
  ///
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of bots to be returned; up to 100.
  ///
  /// [FoundUsers] is returned on completion.
  const GetGrossingWebAppBots({
    required this.offset,
    required this.limit,
  });

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of bots to be returned; up to 100
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
  /// * [limit]: The maximum number of bots to be returned; up to 100
  GetGrossingWebAppBots copyWith({
    String? offset,
    int? limit,
  }) =>
      GetGrossingWebAppBots(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGrossingWebAppBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
