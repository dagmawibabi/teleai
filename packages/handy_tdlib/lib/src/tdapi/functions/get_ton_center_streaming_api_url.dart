part of '../tdapi.dart';

/// **GetTonCenterStreamingApiUrl** *(getTonCenterStreamingApiUrl)* - TDLib function
///
/// Returns a URL for TON Center Streaming API.
///
/// [TonCenterStreamingApiUrl] is returned on completion.
final class GetTonCenterStreamingApiUrl extends TdFunction {
  /// **GetTonCenterStreamingApiUrl** *(getTonCenterStreamingApiUrl)* - TDLib function
  ///
  /// Returns a URL for TON Center Streaming API.
  ///
  /// [TonCenterStreamingApiUrl] is returned on completion.
  const GetTonCenterStreamingApiUrl();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTonCenterStreamingApiUrl copyWith() => const GetTonCenterStreamingApiUrl();

  /// TDLib object type
  static const String defaultObjectId = 'getTonCenterStreamingApiUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
