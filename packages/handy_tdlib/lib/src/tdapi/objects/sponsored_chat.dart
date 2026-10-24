part of '../tdapi.dart';

/// **SponsoredChat** *(sponsoredChat)* - basic class
///
/// Describes a sponsored chat.
///
/// * [uniqueId]: Unique identifier of this result.
/// * [chatId]: Chat identifier.
/// * [sponsorInfo]: Additional optional information about the sponsor to be shown along with the chat.
/// * [additionalInfo]: If non-empty, additional information about the sponsored chat to be shown along with the chat.
final class SponsoredChat extends TdObject {
  /// **SponsoredChat** *(sponsoredChat)* - basic class
  ///
  /// Describes a sponsored chat.
  ///
  /// * [uniqueId]: Unique identifier of this result.
  /// * [chatId]: Chat identifier.
  /// * [sponsorInfo]: Additional optional information about the sponsor to be shown along with the chat.
  /// * [additionalInfo]: If non-empty, additional information about the sponsored chat to be shown along with the chat.
  const SponsoredChat({
    required this.uniqueId,
    required this.chatId,
    required this.sponsorInfo,
    required this.additionalInfo,
  });

  /// Unique identifier of this result
  final int uniqueId;

  /// Chat identifier
  final int chatId;

  /// Additional optional information about the sponsor to be shown along with the chat
  final String sponsorInfo;

  /// If non-empty, additional information about the sponsored chat to be shown along with the chat
  final String additionalInfo;

  /// Parse from a json
  factory SponsoredChat.fromJson(Map<String, dynamic> json) => SponsoredChat(
        uniqueId: json['unique_id'],
        chatId: json['chat_id'],
        sponsorInfo: json['sponsor_info'],
        additionalInfo: json['additional_info'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unique_id": uniqueId,
      "chat_id": chatId,
      "sponsor_info": sponsorInfo,
      "additional_info": additionalInfo,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unique_id]: Unique identifier of this result
  /// * [chat_id]: Chat identifier
  /// * [sponsor_info]: Additional optional information about the sponsor to be shown along with the chat
  /// * [additional_info]: If non-empty, additional information about the sponsored chat to be shown along with the chat
  SponsoredChat copyWith({
    int? uniqueId,
    int? chatId,
    String? sponsorInfo,
    String? additionalInfo,
  }) =>
      SponsoredChat(
        uniqueId: uniqueId ?? this.uniqueId,
        chatId: chatId ?? this.chatId,
        sponsorInfo: sponsorInfo ?? this.sponsorInfo,
        additionalInfo: additionalInfo ?? this.additionalInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sponsoredChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
