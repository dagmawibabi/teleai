part of '../tdapi.dart';

/// **Audios** *(audios)* - basic class
///
/// Contains a list of audio files.
///
/// * [totalCount]: Approximate total number of audio files found.
/// * [audios]: List of audio files.
final class Audios extends TdObject {
  /// **Audios** *(audios)* - basic class
  ///
  /// Contains a list of audio files.
  ///
  /// * [totalCount]: Approximate total number of audio files found.
  /// * [audios]: List of audio files.
  const Audios({
    required this.totalCount,
    required this.audios,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of audio files found
  final int totalCount;

  /// List of audio files
  final List<Audio> audios;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Audios.fromJson(Map<String, dynamic> json) => Audios(
        totalCount: json['total_count'],
        audios: List<Audio>.from((json['audios'] ?? [])
            .map((item) => Audio.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "audios": audios.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of audio files found
  /// * [audios]: List of audio files
  Audios copyWith({
    int? totalCount,
    List<Audio>? audios,
    dynamic extra,
    int? clientId,
  }) =>
      Audios(
        totalCount: totalCount ?? this.totalCount,
        audios: audios ?? this.audios,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'audios';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
