part of '../tdapi.dart';

/// **ConfirmQrCodeAuthentication** *(confirmQrCodeAuthentication)* - TDLib function
///
/// Confirms QR code authentication on another device. Returns created session on success.
///
/// * [link]: A link from a QR code. The link must be scanned by the in-app camera.
///
/// [Session] is returned on completion.
final class ConfirmQrCodeAuthentication extends TdFunction {
  /// **ConfirmQrCodeAuthentication** *(confirmQrCodeAuthentication)* - TDLib function
  ///
  /// Confirms QR code authentication on another device. Returns created session on success.
  ///
  /// * [link]: A link from a QR code. The link must be scanned by the in-app camera.
  ///
  /// [Session] is returned on completion.
  const ConfirmQrCodeAuthentication({
    required this.link,
  });

  /// A link from a QR code. The link must be scanned by the in-app camera
  final String link;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link": link,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: A link from a QR code. The link must be scanned by the in-app camera
  ConfirmQrCodeAuthentication copyWith({
    String? link,
  }) =>
      ConfirmQrCodeAuthentication(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'confirmQrCodeAuthentication';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
