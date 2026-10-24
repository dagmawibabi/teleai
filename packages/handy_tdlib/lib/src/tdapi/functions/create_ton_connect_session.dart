part of '../tdapi.dart';

/// **CreateTonConnectSession** *(createTonConnectSession)* - TDLib function
///
/// Creates a TON Connect session; can be used only if getOption("can_use_ton_wallet").
///
/// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
/// * [manifestUrl]: URL of the manifest of the dApp.
///
/// [TonConnectSession] is returned on completion.
final class CreateTonConnectSession extends TdFunction {
  /// **CreateTonConnectSession** *(createTonConnectSession)* - TDLib function
  ///
  /// Creates a TON Connect session; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
  /// * [manifestUrl]: URL of the manifest of the dApp.
  ///
  /// [TonConnectSession] is returned on completion.
  const CreateTonConnectSession({
    required this.dappClientId,
    required this.manifestUrl,
  });

  /// Hex-encoded public X25519 key of the dApp
  final String dappClientId;

  /// URL of the manifest of the dApp
  final String manifestUrl;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "dapp_client_id": dappClientId,
      "manifest_url": manifestUrl,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [dapp_client_id]: Hex-encoded public X25519 key of the dApp
  /// * [manifest_url]: URL of the manifest of the dApp
  CreateTonConnectSession copyWith({
    String? dappClientId,
    String? manifestUrl,
  }) =>
      CreateTonConnectSession(
        dappClientId: dappClientId ?? this.dappClientId,
        manifestUrl: manifestUrl ?? this.manifestUrl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createTonConnectSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
