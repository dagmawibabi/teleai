part of '../tdapi.dart';

/// **Notification** *(notification)* - basic class
///
/// Contains information about a notification.
///
/// * [id]: Unique persistent identifier of this notification.
/// * [date]: Notification date.
/// * [isSilent]: True, if the notification was explicitly sent without sound.
/// * [type]: Notification type.
final class Notification extends TdObject {
  /// **Notification** *(notification)* - basic class
  ///
  /// Contains information about a notification.
  ///
  /// * [id]: Unique persistent identifier of this notification.
  /// * [date]: Notification date.
  /// * [isSilent]: True, if the notification was explicitly sent without sound.
  /// * [type]: Notification type.
  const Notification({
    required this.id,
    required this.date,
    required this.isSilent,
    required this.type,
  });

  /// Unique persistent identifier of this notification
  final int id;

  /// Notification date
  final int date;

  /// True, if the notification was explicitly sent without sound
  final bool isSilent;

  /// Notification type
  final NotificationType type;

  /// Parse from a json
  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['id'],
        date: json['date'],
        isSilent: json['is_silent'],
        type: NotificationType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "date": date,
      "is_silent": isSilent,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique persistent identifier of this notification
  /// * [date]: Notification date
  /// * [is_silent]: True, if the notification was explicitly sent without sound
  /// * [type]: Notification type
  Notification copyWith({
    int? id,
    int? date,
    bool? isSilent,
    NotificationType? type,
  }) =>
      Notification(
        id: id ?? this.id,
        date: date ?? this.date,
        isSilent: isSilent ?? this.isSilent,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'notification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
