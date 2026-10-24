part of '../tdapi.dart';

/// **MessageViewer** *(messageViewer)* - basic class
///
/// Represents a viewer of a message.
///
/// * [userId]: User identifier of the viewer.
/// * [viewDate]: Approximate point in time (Unix timestamp) when the message was viewed.
final class MessageViewer extends TdObject {
  /// **MessageViewer** *(messageViewer)* - basic class
  ///
  /// Represents a viewer of a message.
  ///
  /// * [userId]: User identifier of the viewer.
  /// * [viewDate]: Approximate point in time (Unix timestamp) when the message was viewed.
  const MessageViewer({
    required this.userId,
    required this.viewDate,
  });

  /// User identifier of the viewer
  final int userId;

  /// Approximate point in time (Unix timestamp) when the message was viewed
  final int viewDate;

  /// Parse from a json
  factory MessageViewer.fromJson(Map<String, dynamic> json) => MessageViewer(
        userId: json['user_id'],
        viewDate: json['view_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "view_date": viewDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier of the viewer
  /// * [view_date]: Approximate point in time (Unix timestamp) when the message was viewed
  MessageViewer copyWith({
    int? userId,
    int? viewDate,
  }) =>
      MessageViewer(
        userId: userId ?? this.userId,
        viewDate: viewDate ?? this.viewDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageViewer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
