part of '../tdapi.dart';

/// **GetTonConnectDAppPendingRequests** *(getTonConnectDAppPendingRequests)* - TDLib function
///
/// Returns pending requests with a dApp through TON Connect.
///
/// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
///
/// [TonConnectRequests] is returned on completion.
final class GetTonConnectDAppPendingRequests extends TdFunction {
  /// **GetTonConnectDAppPendingRequests** *(getTonConnectDAppPendingRequests)* - TDLib function
  ///
  /// Returns pending requests with a dApp through TON Connect.
  ///
  /// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
  ///
  /// [TonConnectRequests] is returned on completion.
  const GetTonConnectDAppPendingRequests({
    required this.dappClientId,
  });

  /// Hex-encoded public X25519 key of the dApp
  final String dappClientId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "dapp_client_id": dappClientId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [dapp_client_id]: Hex-encoded public X25519 key of the dApp
  GetTonConnectDAppPendingRequests copyWith({
    String? dappClientId,
  }) =>
      GetTonConnectDAppPendingRequests(
        dappClientId: dappClientId ?? this.dappClientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonConnectDAppPendingRequests';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
