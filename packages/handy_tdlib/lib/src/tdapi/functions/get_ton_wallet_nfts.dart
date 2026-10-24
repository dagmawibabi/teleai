part of '../tdapi.dart';

/// **GetTonWalletNfts** *(getTonWalletNfts)* - TDLib function
///
/// Returns NFTs stored on the TON wallet of the user; can be used only if getOption("can_use_ton_wallet").
///
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of NFTs to be returned; must be positive and can't be greater than 20.
///
/// [TonNfts] is returned on completion.
final class GetTonWalletNfts extends TdFunction {
  /// **GetTonWalletNfts** *(getTonWalletNfts)* - TDLib function
  ///
  /// Returns NFTs stored on the TON wallet of the user; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of NFTs to be returned; must be positive and can't be greater than 20.
  ///
  /// [TonNfts] is returned on completion.
  const GetTonWalletNfts({
    required this.offset,
    required this.limit,
  });

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of NFTs to be returned; must be positive and can't be greater than 20
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
  /// * [limit]: The maximum number of NFTs to be returned; must be positive and can't be greater than 20
  GetTonWalletNfts copyWith({
    String? offset,
    int? limit,
  }) =>
      GetTonWalletNfts(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletNfts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
