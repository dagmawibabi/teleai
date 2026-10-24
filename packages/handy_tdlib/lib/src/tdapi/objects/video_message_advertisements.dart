part of '../tdapi.dart';

/// **VideoMessageAdvertisements** *(videoMessageAdvertisements)* - basic class
///
/// Contains a list of advertisements to be shown while a video from a message is watched.
///
/// * [advertisements]: List of advertisements.
/// * [startDelay]: Delay before the first advertisement is shown, in seconds.
/// * [betweenDelay]: Delay between consecutive advertisements, in seconds.
final class VideoMessageAdvertisements extends TdObject {
  /// **VideoMessageAdvertisements** *(videoMessageAdvertisements)* - basic class
  ///
  /// Contains a list of advertisements to be shown while a video from a message is watched.
  ///
  /// * [advertisements]: List of advertisements.
  /// * [startDelay]: Delay before the first advertisement is shown, in seconds.
  /// * [betweenDelay]: Delay between consecutive advertisements, in seconds.
  const VideoMessageAdvertisements({
    required this.advertisements,
    required this.startDelay,
    required this.betweenDelay,
    this.extra,
    this.clientId,
  });

  /// List of advertisements
  final List<VideoMessageAdvertisement> advertisements;

  /// Delay before the first advertisement is shown, in seconds
  final int startDelay;

  /// Delay between consecutive advertisements, in seconds
  final int betweenDelay;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory VideoMessageAdvertisements.fromJson(Map<String, dynamic> json) =>
      VideoMessageAdvertisements(
        advertisements: List<VideoMessageAdvertisement>.from(
            (json['advertisements'] ?? [])
                .map((item) => VideoMessageAdvertisement.fromJson(item))
                .toList()),
        startDelay: json['start_delay'],
        betweenDelay: json['between_delay'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "advertisements": advertisements.map((i) => i.toJson()).toList(),
      "start_delay": startDelay,
      "between_delay": betweenDelay,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [advertisements]: List of advertisements
  /// * [start_delay]: Delay before the first advertisement is shown, in seconds
  /// * [between_delay]: Delay between consecutive advertisements, in seconds
  VideoMessageAdvertisements copyWith({
    List<VideoMessageAdvertisement>? advertisements,
    int? startDelay,
    int? betweenDelay,
    dynamic extra,
    int? clientId,
  }) =>
      VideoMessageAdvertisements(
        advertisements: advertisements ?? this.advertisements,
        startDelay: startDelay ?? this.startDelay,
        betweenDelay: betweenDelay ?? this.betweenDelay,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'videoMessageAdvertisements';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
