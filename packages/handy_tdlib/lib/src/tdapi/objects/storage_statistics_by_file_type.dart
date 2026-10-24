part of '../tdapi.dart';

/// **StorageStatisticsByFileType** *(storageStatisticsByFileType)* - basic class
///
/// Contains the storage usage statistics for a specific file type.
///
/// * [fileType]: File type.
/// * [size]: Total size of the files, in bytes.
/// * [count]: Total number of files.
final class StorageStatisticsByFileType extends TdObject {
  /// **StorageStatisticsByFileType** *(storageStatisticsByFileType)* - basic class
  ///
  /// Contains the storage usage statistics for a specific file type.
  ///
  /// * [fileType]: File type.
  /// * [size]: Total size of the files, in bytes.
  /// * [count]: Total number of files.
  const StorageStatisticsByFileType({
    required this.fileType,
    required this.size,
    required this.count,
  });

  /// File type
  final FileType fileType;

  /// Total size of the files, in bytes
  final int size;

  /// Total number of files
  final int count;

  /// Parse from a json
  factory StorageStatisticsByFileType.fromJson(Map<String, dynamic> json) =>
      StorageStatisticsByFileType(
        fileType: FileType.fromJson(json['file_type']),
        size: json['size'],
        count: json['count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_type": fileType.toJson(),
      "size": size,
      "count": count,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_type]: File type
  /// * [size]: Total size of the files, in bytes
  /// * [count]: Total number of files
  StorageStatisticsByFileType copyWith({
    FileType? fileType,
    int? size,
    int? count,
  }) =>
      StorageStatisticsByFileType(
        fileType: fileType ?? this.fileType,
        size: size ?? this.size,
        count: count ?? this.count,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storageStatisticsByFileType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
