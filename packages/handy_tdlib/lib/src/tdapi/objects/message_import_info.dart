part of '../tdapi.dart';

/// **MessageImportInfo** *(messageImportInfo)* - basic class
///
/// Contains information about a message created with importMessages.
///
/// * [senderName]: Name of the original sender.
/// * [date]: Point in time (Unix timestamp) when the message was originally sent.
final class MessageImportInfo extends TdObject {
  /// **MessageImportInfo** *(messageImportInfo)* - basic class
  ///
  /// Contains information about a message created with importMessages.
  ///
  /// * [senderName]: Name of the original sender.
  /// * [date]: Point in time (Unix timestamp) when the message was originally sent.
  const MessageImportInfo({
    required this.senderName,
    required this.date,
  });

  /// Name of the original sender
  final String senderName;

  /// Point in time (Unix timestamp) when the message was originally sent
  final int date;

  /// Parse from a json
  factory MessageImportInfo.fromJson(Map<String, dynamic> json) =>
      MessageImportInfo(
        senderName: json['sender_name'],
        date: json['date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_name": senderName,
      "date": date,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_name]: Name of the original sender
  /// * [date]: Point in time (Unix timestamp) when the message was originally sent
  MessageImportInfo copyWith({
    String? senderName,
    int? date,
  }) =>
      MessageImportInfo(
        senderName: senderName ?? this.senderName,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageImportInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
