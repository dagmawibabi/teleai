part of '../tdapi.dart';

/// **InputDocument** *(inputDocument)* - basic class
///
/// A document (general file) to be sent.
///
/// * [document]: File to be sent.
/// * [thumbnail]: Document thumbnail; pass null to skip thumbnail uploading *(optional)*.
/// * [disableContentTypeDetection]: Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats.
final class InputDocument extends TdObject {
  /// **InputDocument** *(inputDocument)* - basic class
  ///
  /// A document (general file) to be sent.
  ///
  /// * [document]: File to be sent.
  /// * [thumbnail]: Document thumbnail; pass null to skip thumbnail uploading *(optional)*.
  /// * [disableContentTypeDetection]: Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats.
  const InputDocument({
    required this.document,
    this.thumbnail,
    required this.disableContentTypeDetection,
  });

  /// File to be sent
  final InputFile document;

  /// Document thumbnail; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats
  final bool disableContentTypeDetection;

  /// Parse from a json
  factory InputDocument.fromJson(Map<String, dynamic> json) => InputDocument(
        document: InputFile.fromJson(json['document']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        disableContentTypeDetection: json['disable_content_type_detection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "disable_content_type_detection": disableContentTypeDetection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: File to be sent
  /// * [thumbnail]: Document thumbnail; pass null to skip thumbnail uploading
  /// * [disable_content_type_detection]: Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats
  InputDocument copyWith({
    InputFile? document,
    InputThumbnail? thumbnail,
    bool? disableContentTypeDetection,
  }) =>
      InputDocument(
        document: document ?? this.document,
        thumbnail: thumbnail ?? this.thumbnail,
        disableContentTypeDetection:
            disableContentTypeDetection ?? this.disableContentTypeDetection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
