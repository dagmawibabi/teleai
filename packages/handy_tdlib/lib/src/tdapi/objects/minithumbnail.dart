part of '../tdapi.dart';

/// **Minithumbnail** *(minithumbnail)* - basic class
///
/// Thumbnail image of a very poor quality and low resolution.
///
/// * [width]: Thumbnail width, usually doesn't exceed 40.
/// * [height]: Thumbnail height, usually doesn't exceed 40.
/// * [data]: The thumbnail in JPEG format.
final class Minithumbnail extends TdObject {
  /// **Minithumbnail** *(minithumbnail)* - basic class
  ///
  /// Thumbnail image of a very poor quality and low resolution.
  ///
  /// * [width]: Thumbnail width, usually doesn't exceed 40.
  /// * [height]: Thumbnail height, usually doesn't exceed 40.
  /// * [data]: The thumbnail in JPEG format.
  const Minithumbnail({
    required this.width,
    required this.height,
    required this.data,
  });

  /// Thumbnail width, usually doesn't exceed 40
  final int width;

  /// Thumbnail height, usually doesn't exceed 40
  final int height;

  /// The thumbnail in JPEG format
  final String data;

  /// Parse from a json
  factory Minithumbnail.fromJson(Map<String, dynamic> json) => Minithumbnail(
        width: json['width'],
        height: json['height'],
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "width": width,
      "height": height,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [width]: Thumbnail width, usually doesn't exceed 40
  /// * [height]: Thumbnail height, usually doesn't exceed 40
  /// * [data]: The thumbnail in JPEG format
  Minithumbnail copyWith({
    int? width,
    int? height,
    String? data,
  }) =>
      Minithumbnail(
        width: width ?? this.width,
        height: height ?? this.height,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'minithumbnail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
