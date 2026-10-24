part of '../tdapi.dart';

/// **TonNft** *(tonNft)* - basic class
///
/// Represents an NFT in the TON blockchain.
///
/// * [collectionAddress]: Address of the collection to which the NFT belongs; may be empty if unknown.
/// * [address]: Address of the NFT.
/// * [ownerAddress]: Address of the owner of the NFT.
/// * [index]: Index of the NFT among all NFTs from the collection as a decimal number.
/// * [name]: Name of the NFT.
/// * [description]: Description of the NFT.
/// * [image]: Image of the NFT; may be null if none *(optional)*.
/// * [thumbnail]: Thumbnail of the NFT; may be null if none *(optional)*.
/// * [content]: Content of the NFT; may be null if none *(optional)*.
/// * [sticker]: Sticker of the NFT; may be null if none *(optional)*.
/// * [attributes]: Attributes of the NFT.
/// * [extra]: Additional data about the NFT; may be null if none *(optional)*.
/// * [gift]: The upgraded gift corresponding to the NFT; may be null if none. Information about the owner of the gift isn't available.. Original details of the gift are available only to the sender and the receiver of the original gift *(optional)*.
final class TonNft extends TdObject {
  /// **TonNft** *(tonNft)* - basic class
  ///
  /// Represents an NFT in the TON blockchain.
  ///
  /// * [collectionAddress]: Address of the collection to which the NFT belongs; may be empty if unknown.
  /// * [address]: Address of the NFT.
  /// * [ownerAddress]: Address of the owner of the NFT.
  /// * [index]: Index of the NFT among all NFTs from the collection as a decimal number.
  /// * [name]: Name of the NFT.
  /// * [description]: Description of the NFT.
  /// * [image]: Image of the NFT; may be null if none *(optional)*.
  /// * [thumbnail]: Thumbnail of the NFT; may be null if none *(optional)*.
  /// * [content]: Content of the NFT; may be null if none *(optional)*.
  /// * [sticker]: Sticker of the NFT; may be null if none *(optional)*.
  /// * [attributes]: Attributes of the NFT.
  /// * [extra]: Additional data about the NFT; may be null if none *(optional)*.
  /// * [gift]: The upgraded gift corresponding to the NFT; may be null if none. Information about the owner of the gift isn't available.. Original details of the gift are available only to the sender and the receiver of the original gift *(optional)*.
  const TonNft({
    required this.collectionAddress,
    required this.address,
    required this.ownerAddress,
    required this.index,
    required this.name,
    required this.description,
    this.image,
    this.thumbnail,
    this.content,
    this.sticker,
    required this.attributes,
    this.extra,
    this.gift,
  });

  /// Address of the collection to which the NFT belongs; may be empty if unknown
  final String collectionAddress;

  /// Address of the NFT
  final String address;

  /// Address of the owner of the NFT
  final String ownerAddress;

  /// Index of the NFT among all NFTs from the collection as a decimal number
  final String index;

  /// Name of the NFT
  final String name;

  /// Description of the NFT
  final String description;

  /// Image of the NFT; may be null if none
  final PhotoSize? image;

  /// Thumbnail of the NFT; may be null if none
  final PhotoSize? thumbnail;

  /// Content of the NFT; may be null if none
  final Document? content;

  /// Sticker of the NFT; may be null if none
  final Sticker? sticker;

  /// Attributes of the NFT
  final List<TonNftAttribute> attributes;

  /// Additional data about the NFT; may be null if none
  final JsonValue? extra;

  /// The upgraded gift corresponding to the NFT; may be null if none. Information about the owner of the gift isn't available.. Original details of the gift are available only to the sender and the receiver of the original gift
  final UpgradedGift? gift;

  /// Parse from a json
  factory TonNft.fromJson(Map<String, dynamic> json) => TonNft(
        collectionAddress: json['collection_address'],
        address: json['address'],
        ownerAddress: json['owner_address'],
        index: json['index'],
        name: json['name'],
        description: json['description'],
        image: json['image'] == null ? null : PhotoSize.fromJson(json['image']),
        thumbnail: json['thumbnail'] == null
            ? null
            : PhotoSize.fromJson(json['thumbnail']),
        content:
            json['content'] == null ? null : Document.fromJson(json['content']),
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
        attributes: List<TonNftAttribute>.from((json['attributes'] ?? [])
            .map((item) => TonNftAttribute.fromJson(item))
            .toList()),
        extra: json['extra'] == null ? null : JsonValue.fromJson(json['extra']),
        gift: json['gift'] == null ? null : UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "collection_address": collectionAddress,
      "address": address,
      "owner_address": ownerAddress,
      "index": index,
      "name": name,
      "description": description,
      "image": image?.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "content": content?.toJson(),
      "sticker": sticker?.toJson(),
      "attributes": attributes.map((i) => i.toJson()).toList(),
      "extra": extra?.toJson(),
      "gift": gift?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [collection_address]: Address of the collection to which the NFT belongs; may be empty if unknown
  /// * [address]: Address of the NFT
  /// * [owner_address]: Address of the owner of the NFT
  /// * [index]: Index of the NFT among all NFTs from the collection as a decimal number
  /// * [name]: Name of the NFT
  /// * [description]: Description of the NFT
  /// * [image]: Image of the NFT; may be null if none
  /// * [thumbnail]: Thumbnail of the NFT; may be null if none
  /// * [content]: Content of the NFT; may be null if none
  /// * [sticker]: Sticker of the NFT; may be null if none
  /// * [attributes]: Attributes of the NFT
  /// * [extra]: Additional data about the NFT; may be null if none
  /// * [gift]: The upgraded gift corresponding to the NFT; may be null if none. Information about the owner of the gift isn't available.. Original details of the gift are available only to the sender and the receiver of the original gift
  TonNft copyWith({
    String? collectionAddress,
    String? address,
    String? ownerAddress,
    String? index,
    String? name,
    String? description,
    PhotoSize? image,
    PhotoSize? thumbnail,
    Document? content,
    Sticker? sticker,
    List<TonNftAttribute>? attributes,
    JsonValue? extra,
    UpgradedGift? gift,
  }) =>
      TonNft(
        collectionAddress: collectionAddress ?? this.collectionAddress,
        address: address ?? this.address,
        ownerAddress: ownerAddress ?? this.ownerAddress,
        index: index ?? this.index,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        thumbnail: thumbnail ?? this.thumbnail,
        content: content ?? this.content,
        sticker: sticker ?? this.sticker,
        attributes: attributes ?? this.attributes,
        extra: extra ?? this.extra,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonNft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
