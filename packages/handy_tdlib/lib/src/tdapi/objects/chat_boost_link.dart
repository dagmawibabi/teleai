part of '../tdapi.dart';

/// **ChatBoostLink** *(chatBoostLink)* - basic class
///
/// Contains an HTTPS link to boost a chat.
///
/// * [link]: The link.
/// * [isPublic]: True, if the link will work for non-members of the chat.
final class ChatBoostLink extends TdObject {
  /// **ChatBoostLink** *(chatBoostLink)* - basic class
  ///
  /// Contains an HTTPS link to boost a chat.
  ///
  /// * [link]: The link.
  /// * [isPublic]: True, if the link will work for non-members of the chat.
  const ChatBoostLink({
    required this.link,
    required this.isPublic,
    this.extra,
    this.clientId,
  });

  /// The link
  final String link;

  /// True, if the link will work for non-members of the chat
  final bool isPublic;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostLink.fromJson(Map<String, dynamic> json) => ChatBoostLink(
        link: json['link'],
        isPublic: json['is_public'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "link": link,
      "is_public": isPublic,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The link
  /// * [is_public]: True, if the link will work for non-members of the chat
  ChatBoostLink copyWith({
    String? link,
    bool? isPublic,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostLink(
        link: link ?? this.link,
        isPublic: isPublic ?? this.isPublic,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
