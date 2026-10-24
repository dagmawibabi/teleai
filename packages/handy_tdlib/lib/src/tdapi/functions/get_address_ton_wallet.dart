part of '../tdapi.dart';

/// **GetAddressTonWallet** *(getAddressTonWallet)* - TDLib function
///
/// Returns information about a TON wallet with the given address; can be used only if getOption("can_use_ton_wallet").
///
/// * [address]: Address in the TON blockchain.
///
/// [UserTonWalletAddress] is returned on completion.
final class GetAddressTonWallet extends TdFunction {
  /// **GetAddressTonWallet** *(getAddressTonWallet)* - TDLib function
  ///
  /// Returns information about a TON wallet with the given address; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [address]: Address in the TON blockchain.
  ///
  /// [UserTonWalletAddress] is returned on completion.
  const GetAddressTonWallet({
    required this.address,
  });

  /// Address in the TON blockchain
  final String address;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "address": address,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: Address in the TON blockchain
  GetAddressTonWallet copyWith({
    String? address,
  }) =>
      GetAddressTonWallet(
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAddressTonWallet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
