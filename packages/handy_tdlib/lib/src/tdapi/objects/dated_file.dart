part of '../tdapi.dart';

/// **DatedFile** *(datedFile)* - basic class
///
/// File with the date it was uploaded.
///
/// * [file]: The file.
/// * [date]: Point in time (Unix timestamp) when the file was uploaded.
final class DatedFile extends TdObject {
  /// **DatedFile** *(datedFile)* - basic class
  ///
  /// File with the date it was uploaded.
  ///
  /// * [file]: The file.
  /// * [date]: Point in time (Unix timestamp) when the file was uploaded.
  const DatedFile({
    required this.file,
    required this.date,
  });

  /// The file
  final File file;

  /// Point in time (Unix timestamp) when the file was uploaded
  final int date;

  /// Parse from a json
  factory DatedFile.fromJson(Map<String, dynamic> json) => DatedFile(
        file: File.fromJson(json['file']),
        date: json['date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file": file.toJson(),
      "date": date,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file]: The file
  /// * [date]: Point in time (Unix timestamp) when the file was uploaded
  DatedFile copyWith({
    File? file,
    int? date,
  }) =>
      DatedFile(
        file: file ?? this.file,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'datedFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
