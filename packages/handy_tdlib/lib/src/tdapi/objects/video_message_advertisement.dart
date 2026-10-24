part of '../tdapi.dart';

/// **VideoMessageAdvertisement** *(videoMessageAdvertisement)* - basic class
///
/// Describes an advertisement to be shown while a video from a message is watched.
///
/// * [uniqueId]: Unique identifier of this result.
/// * [text]: Text of the advertisement.
/// * [minDisplayDuration]: The minimum amount of time the advertisement must be displayed before it can be hidden by the user, in seconds.
/// * [maxDisplayDuration]: The maximum amount of time the advertisement must be displayed before it must be automatically hidden, in seconds.
/// * [canBeReported]: True, if the advertisement can be reported to Telegram moderators through reportVideoMessageAdvertisement.
/// * [sponsor]: Information about the sponsor of the advertisement.
/// * [title]: Title of the sponsored message.
/// * [additionalInfo]: If non-empty, additional information about the sponsored message to be shown along with the message.
final class VideoMessageAdvertisement extends TdObject {
  /// **VideoMessageAdvertisement** *(videoMessageAdvertisement)* - basic class
  ///
  /// Describes an advertisement to be shown while a video from a message is watched.
  ///
  /// * [uniqueId]: Unique identifier of this result.
  /// * [text]: Text of the advertisement.
  /// * [minDisplayDuration]: The minimum amount of time the advertisement must be displayed before it can be hidden by the user, in seconds.
  /// * [maxDisplayDuration]: The maximum amount of time the advertisement must be displayed before it must be automatically hidden, in seconds.
  /// * [canBeReported]: True, if the advertisement can be reported to Telegram moderators through reportVideoMessageAdvertisement.
  /// * [sponsor]: Information about the sponsor of the advertisement.
  /// * [title]: Title of the sponsored message.
  /// * [additionalInfo]: If non-empty, additional information about the sponsored message to be shown along with the message.
  const VideoMessageAdvertisement({
    required this.uniqueId,
    required this.text,
    required this.minDisplayDuration,
    required this.maxDisplayDuration,
    required this.canBeReported,
    required this.sponsor,
    required this.title,
    required this.additionalInfo,
  });

  /// Unique identifier of this result
  final int uniqueId;

  /// Text of the advertisement
  final String text;

  /// The minimum amount of time the advertisement must be displayed before it can be hidden by the user, in seconds
  final int minDisplayDuration;

  /// The maximum amount of time the advertisement must be displayed before it must be automatically hidden, in seconds
  final int maxDisplayDuration;

  /// True, if the advertisement can be reported to Telegram moderators through reportVideoMessageAdvertisement
  final bool canBeReported;

  /// Information about the sponsor of the advertisement
  final AdvertisementSponsor sponsor;

  /// Title of the sponsored message
  final String title;

  /// If non-empty, additional information about the sponsored message to be shown along with the message
  final String additionalInfo;

  /// Parse from a json
  factory VideoMessageAdvertisement.fromJson(Map<String, dynamic> json) =>
      VideoMessageAdvertisement(
        uniqueId: json['unique_id'],
        text: json['text'],
        minDisplayDuration: json['min_display_duration'],
        maxDisplayDuration: json['max_display_duration'],
        canBeReported: json['can_be_reported'],
        sponsor: AdvertisementSponsor.fromJson(json['sponsor']),
        title: json['title'],
        additionalInfo: json['additional_info'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unique_id": uniqueId,
      "text": text,
      "min_display_duration": minDisplayDuration,
      "max_display_duration": maxDisplayDuration,
      "can_be_reported": canBeReported,
      "sponsor": sponsor.toJson(),
      "title": title,
      "additional_info": additionalInfo,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unique_id]: Unique identifier of this result
  /// * [text]: Text of the advertisement
  /// * [min_display_duration]: The minimum amount of time the advertisement must be displayed before it can be hidden by the user, in seconds
  /// * [max_display_duration]: The maximum amount of time the advertisement must be displayed before it must be automatically hidden, in seconds
  /// * [can_be_reported]: True, if the advertisement can be reported to Telegram moderators through reportVideoMessageAdvertisement
  /// * [sponsor]: Information about the sponsor of the advertisement
  /// * [title]: Title of the sponsored message
  /// * [additional_info]: If non-empty, additional information about the sponsored message to be shown along with the message
  VideoMessageAdvertisement copyWith({
    int? uniqueId,
    String? text,
    int? minDisplayDuration,
    int? maxDisplayDuration,
    bool? canBeReported,
    AdvertisementSponsor? sponsor,
    String? title,
    String? additionalInfo,
  }) =>
      VideoMessageAdvertisement(
        uniqueId: uniqueId ?? this.uniqueId,
        text: text ?? this.text,
        minDisplayDuration: minDisplayDuration ?? this.minDisplayDuration,
        maxDisplayDuration: maxDisplayDuration ?? this.maxDisplayDuration,
        canBeReported: canBeReported ?? this.canBeReported,
        sponsor: sponsor ?? this.sponsor,
        title: title ?? this.title,
        additionalInfo: additionalInfo ?? this.additionalInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'videoMessageAdvertisement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
