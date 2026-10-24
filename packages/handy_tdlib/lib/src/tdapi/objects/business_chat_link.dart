part of '../tdapi.dart';

/// **BusinessChatLink** *(businessChatLink)* - basic class
///
/// Contains information about a business chat link.
///
/// * [link]: The HTTPS link.
/// * [text]: Message draft text that will be added to the input field.
/// * [title]: Link title.
/// * [viewCount]: Number of times the link was used.
final class BusinessChatLink extends TdObject {
  /// **BusinessChatLink** *(businessChatLink)* - basic class
  ///
  /// Contains information about a business chat link.
  ///
  /// * [link]: The HTTPS link.
  /// * [text]: Message draft text that will be added to the input field.
  /// * [title]: Link title.
  /// * [viewCount]: Number of times the link was used.
  const BusinessChatLink({
    required this.link,
    required this.text,
    required this.title,
    required this.viewCount,
    this.extra,
    this.clientId,
  });

  /// The HTTPS link
  final String link;

  /// Message draft text that will be added to the input field
  final FormattedText text;

  /// Link title
  final String title;

  /// Number of times the link was used
  final int viewCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessChatLink.fromJson(Map<String, dynamic> json) =>
      BusinessChatLink(
        link: json['link'],
        text: FormattedText.fromJson(json['text']),
        title: json['title'],
        viewCount: json['view_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "link": link,
      "text": text.toJson(),
      "title": title,
      "view_count": viewCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The HTTPS link
  /// * [text]: Message draft text that will be added to the input field
  /// * [title]: Link title
  /// * [view_count]: Number of times the link was used
  BusinessChatLink copyWith({
    String? link,
    FormattedText? text,
    String? title,
    int? viewCount,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessChatLink(
        link: link ?? this.link,
        text: text ?? this.text,
        title: title ?? this.title,
        viewCount: viewCount ?? this.viewCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
