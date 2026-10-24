part of '../tdapi.dart';

/// **MessageForwardInfo** *(messageForwardInfo)* - basic class
///
/// Contains information about a forwarded message.
///
/// * [origin]: Origin of the forwarded message.
/// * [date]: Point in time (Unix timestamp) when the message was originally sent.
/// * [source]: For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group,. information about the source message from which the message was forwarded last time; may be null for other forwards or if unknown *(optional)*.
/// * [publicServiceAnnouncementType]: The type of public service announcement for the forwarded message.
final class MessageForwardInfo extends TdObject {
  /// **MessageForwardInfo** *(messageForwardInfo)* - basic class
  ///
  /// Contains information about a forwarded message.
  ///
  /// * [origin]: Origin of the forwarded message.
  /// * [date]: Point in time (Unix timestamp) when the message was originally sent.
  /// * [source]: For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group,. information about the source message from which the message was forwarded last time; may be null for other forwards or if unknown *(optional)*.
  /// * [publicServiceAnnouncementType]: The type of public service announcement for the forwarded message.
  const MessageForwardInfo({
    required this.origin,
    required this.date,
    this.source,
    required this.publicServiceAnnouncementType,
  });

  /// Origin of the forwarded message
  final MessageOrigin origin;

  /// Point in time (Unix timestamp) when the message was originally sent
  final int date;

  /// For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group,. information about the source message from which the message was forwarded last time; may be null for other forwards or if unknown
  final ForwardSource? source;

  /// The type of public service announcement for the forwarded message
  final String publicServiceAnnouncementType;

  /// Parse from a json
  factory MessageForwardInfo.fromJson(Map<String, dynamic> json) =>
      MessageForwardInfo(
        origin: MessageOrigin.fromJson(json['origin']),
        date: json['date'],
        source: json['source'] == null
            ? null
            : ForwardSource.fromJson(json['source']),
        publicServiceAnnouncementType: json['public_service_announcement_type'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "origin": origin.toJson(),
      "date": date,
      "source": source?.toJson(),
      "public_service_announcement_type": publicServiceAnnouncementType,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [origin]: Origin of the forwarded message
  /// * [date]: Point in time (Unix timestamp) when the message was originally sent
  /// * [source]: For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group,. information about the source message from which the message was forwarded last time; may be null for other forwards or if unknown
  /// * [public_service_announcement_type]: The type of public service announcement for the forwarded message
  MessageForwardInfo copyWith({
    MessageOrigin? origin,
    int? date,
    ForwardSource? source,
    String? publicServiceAnnouncementType,
  }) =>
      MessageForwardInfo(
        origin: origin ?? this.origin,
        date: date ?? this.date,
        source: source ?? this.source,
        publicServiceAnnouncementType:
            publicServiceAnnouncementType ?? this.publicServiceAnnouncementType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageForwardInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
