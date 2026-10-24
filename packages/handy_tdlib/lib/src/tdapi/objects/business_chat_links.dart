part of '../tdapi.dart';

/// **BusinessChatLinks** *(businessChatLinks)* - basic class
///
/// Contains a list of business chat links created by the user.
///
/// * [links]: List of links.
final class BusinessChatLinks extends TdObject {
  /// **BusinessChatLinks** *(businessChatLinks)* - basic class
  ///
  /// Contains a list of business chat links created by the user.
  ///
  /// * [links]: List of links.
  const BusinessChatLinks({
    required this.links,
    this.extra,
    this.clientId,
  });

  /// List of links
  final List<BusinessChatLink> links;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessChatLinks.fromJson(Map<String, dynamic> json) =>
      BusinessChatLinks(
        links: List<BusinessChatLink>.from((json['links'] ?? [])
            .map((item) => BusinessChatLink.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "links": links.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [links]: List of links
  BusinessChatLinks copyWith({
    List<BusinessChatLink>? links,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessChatLinks(
        links: links ?? this.links,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessChatLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
