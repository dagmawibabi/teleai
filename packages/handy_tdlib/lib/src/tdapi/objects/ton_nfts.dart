part of '../tdapi.dart';

/// **TonNfts** *(tonNfts)* - basic class
///
/// Represents a list of TON NFTs.
///
/// * [nfts]: List of NFTs.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class TonNfts extends TdObject {
  /// **TonNfts** *(tonNfts)* - basic class
  ///
  /// Represents a list of TON NFTs.
  ///
  /// * [nfts]: List of NFTs.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const TonNfts({
    required this.nfts,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// List of NFTs
  final List<TonNft> nfts;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonNfts.fromJson(Map<String, dynamic> json) => TonNfts(
        nfts: List<TonNft>.from(
            (json['nfts'] ?? []).map((item) => TonNft.fromJson(item)).toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nfts": nfts.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nfts]: List of NFTs
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  TonNfts copyWith({
    List<TonNft>? nfts,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      TonNfts(
        nfts: nfts ?? this.nfts,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonNfts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
