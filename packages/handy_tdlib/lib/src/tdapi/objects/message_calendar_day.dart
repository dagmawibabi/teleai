part of '../tdapi.dart';

/// **MessageCalendarDay** *(messageCalendarDay)* - basic class
///
/// Contains information about found messages sent on a specific day.
///
/// * [totalCount]: Total number of found messages sent on the day.
/// * [message]: First message sent on the day.
final class MessageCalendarDay extends TdObject {
  /// **MessageCalendarDay** *(messageCalendarDay)* - basic class
  ///
  /// Contains information about found messages sent on a specific day.
  ///
  /// * [totalCount]: Total number of found messages sent on the day.
  /// * [message]: First message sent on the day.
  const MessageCalendarDay({
    required this.totalCount,
    required this.message,
  });

  /// Total number of found messages sent on the day
  final int totalCount;

  /// First message sent on the day
  final Message message;

  /// Parse from a json
  factory MessageCalendarDay.fromJson(Map<String, dynamic> json) =>
      MessageCalendarDay(
        totalCount: json['total_count'],
        message: Message.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of found messages sent on the day
  /// * [message]: First message sent on the day
  MessageCalendarDay copyWith({
    int? totalCount,
    Message? message,
  }) =>
      MessageCalendarDay(
        totalCount: totalCount ?? this.totalCount,
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageCalendarDay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
