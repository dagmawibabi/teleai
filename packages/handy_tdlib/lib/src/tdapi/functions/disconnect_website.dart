part of '../tdapi.dart';

/// **DisconnectWebsite** *(disconnectWebsite)* - TDLib function
///
/// Disconnects website from the current user's Telegram account.
///
/// * [websiteId]: Website identifier.
///
/// [Ok] is returned on completion.
final class DisconnectWebsite extends TdFunction {
  /// **DisconnectWebsite** *(disconnectWebsite)* - TDLib function
  ///
  /// Disconnects website from the current user's Telegram account.
  ///
  /// * [websiteId]: Website identifier.
  ///
  /// [Ok] is returned on completion.
  const DisconnectWebsite({
    required this.websiteId,
  });

  /// Website identifier
  final int websiteId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "website_id": websiteId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [website_id]: Website identifier
  DisconnectWebsite copyWith({
    int? websiteId,
  }) =>
      DisconnectWebsite(
        websiteId: websiteId ?? this.websiteId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disconnectWebsite';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
