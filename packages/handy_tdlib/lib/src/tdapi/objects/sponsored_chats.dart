part of '../tdapi.dart';

/// **SponsoredChats** *(sponsoredChats)* - basic class
///
/// Contains a list of sponsored chats.
///
/// * [chats]: List of sponsored chats.
final class SponsoredChats extends TdObject {
  /// **SponsoredChats** *(sponsoredChats)* - basic class
  ///
  /// Contains a list of sponsored chats.
  ///
  /// * [chats]: List of sponsored chats.
  const SponsoredChats({
    required this.chats,
    this.extra,
    this.clientId,
  });

  /// List of sponsored chats
  final List<SponsoredChat> chats;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory SponsoredChats.fromJson(Map<String, dynamic> json) => SponsoredChats(
        chats: List<SponsoredChat>.from((json['chats'] ?? [])
            .map((item) => SponsoredChat.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chats": chats.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chats]: List of sponsored chats
  SponsoredChats copyWith({
    List<SponsoredChat>? chats,
    dynamic extra,
    int? clientId,
  }) =>
      SponsoredChats(
        chats: chats ?? this.chats,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sponsoredChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
