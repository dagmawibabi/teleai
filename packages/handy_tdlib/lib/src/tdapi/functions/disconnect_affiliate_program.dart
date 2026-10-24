part of '../tdapi.dart';

/// **DisconnectAffiliateProgram** *(disconnectAffiliateProgram)* - TDLib function
///
/// Disconnects an affiliate program from the given affiliate and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program.
///
/// * [affiliate]: The affiliate to which the affiliate program is connected.
/// * [url]: The referral link of the affiliate program.
///
/// [ConnectedAffiliateProgram] is returned on completion.
final class DisconnectAffiliateProgram extends TdFunction {
  /// **DisconnectAffiliateProgram** *(disconnectAffiliateProgram)* - TDLib function
  ///
  /// Disconnects an affiliate program from the given affiliate and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program.
  ///
  /// * [affiliate]: The affiliate to which the affiliate program is connected.
  /// * [url]: The referral link of the affiliate program.
  ///
  /// [ConnectedAffiliateProgram] is returned on completion.
  const DisconnectAffiliateProgram({
    required this.affiliate,
    required this.url,
  });

  /// The affiliate to which the affiliate program is connected
  final AffiliateType affiliate;

  /// The referral link of the affiliate program
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "affiliate": affiliate.toJson(),
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [affiliate]: The affiliate to which the affiliate program is connected
  /// * [url]: The referral link of the affiliate program
  DisconnectAffiliateProgram copyWith({
    AffiliateType? affiliate,
    String? url,
  }) =>
      DisconnectAffiliateProgram(
        affiliate: affiliate ?? this.affiliate,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disconnectAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
