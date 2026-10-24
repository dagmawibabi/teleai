part of '../tdapi.dart';

/// **ProductInfo** *(productInfo)* - basic class
///
/// Contains information about a product that can be paid with invoice.
///
/// * [title]: Product title.
/// * [description]: Product description.
/// * [photo]: Product photo; may be null *(optional)*.
final class ProductInfo extends TdObject {
  /// **ProductInfo** *(productInfo)* - basic class
  ///
  /// Contains information about a product that can be paid with invoice.
  ///
  /// * [title]: Product title.
  /// * [description]: Product description.
  /// * [photo]: Product photo; may be null *(optional)*.
  const ProductInfo({
    required this.title,
    required this.description,
    this.photo,
  });

  /// Product title
  final String title;

  /// Product description
  final FormattedText description;

  /// Product photo; may be null
  final Photo? photo;

  /// Parse from a json
  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        title: json['title'],
        description: FormattedText.fromJson(json['description']),
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "description": description.toJson(),
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Product title
  /// * [description]: Product description
  /// * [photo]: Product photo; may be null
  ProductInfo copyWith({
    String? title,
    FormattedText? description,
    Photo? photo,
  }) =>
      ProductInfo(
        title: title ?? this.title,
        description: description ?? this.description,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'productInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
