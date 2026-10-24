part of '../tdapi.dart';

/// **FileDownloadedPrefixSize** *(fileDownloadedPrefixSize)* - basic class
///
/// Contains size of downloaded prefix of a file.
///
/// * [size]: The prefix size, in bytes.
final class FileDownloadedPrefixSize extends TdObject {
  /// **FileDownloadedPrefixSize** *(fileDownloadedPrefixSize)* - basic class
  ///
  /// Contains size of downloaded prefix of a file.
  ///
  /// * [size]: The prefix size, in bytes.
  const FileDownloadedPrefixSize({
    required this.size,
    this.extra,
    this.clientId,
  });

  /// The prefix size, in bytes
  final int size;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FileDownloadedPrefixSize.fromJson(Map<String, dynamic> json) =>
      FileDownloadedPrefixSize(
        size: json['size'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "size": size,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [size]: The prefix size, in bytes
  FileDownloadedPrefixSize copyWith({
    int? size,
    dynamic extra,
    int? clientId,
  }) =>
      FileDownloadedPrefixSize(
        size: size ?? this.size,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'fileDownloadedPrefixSize';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
