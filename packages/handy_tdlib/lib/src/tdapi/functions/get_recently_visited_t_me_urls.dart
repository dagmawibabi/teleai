part of '../tdapi.dart';

/// **GetRecentlyVisitedTMeUrls** *(getRecentlyVisitedTMeUrls)* - TDLib function
///
/// Returns t.me URLs recently visited by a newly registered user.
///
/// * [referrer]: Google Play referrer to identify the user.
///
/// [TMeUrls] is returned on completion.
final class GetRecentlyVisitedTMeUrls extends TdFunction {
  /// **GetRecentlyVisitedTMeUrls** *(getRecentlyVisitedTMeUrls)* - TDLib function
  ///
  /// Returns t.me URLs recently visited by a newly registered user.
  ///
  /// * [referrer]: Google Play referrer to identify the user.
  ///
  /// [TMeUrls] is returned on completion.
  const GetRecentlyVisitedTMeUrls({
    required this.referrer,
  });

  /// Google Play referrer to identify the user
  final String referrer;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "referrer": referrer,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [referrer]: Google Play referrer to identify the user
  GetRecentlyVisitedTMeUrls copyWith({
    String? referrer,
  }) =>
      GetRecentlyVisitedTMeUrls(
        referrer: referrer ?? this.referrer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getRecentlyVisitedTMeUrls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
