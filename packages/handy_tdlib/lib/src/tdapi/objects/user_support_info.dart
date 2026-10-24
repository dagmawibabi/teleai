part of '../tdapi.dart';

/// **UserSupportInfo** *(userSupportInfo)* - basic class
///
/// Contains custom information about the user.
///
/// * [message]: Information message.
/// * [author]: Information author.
/// * [date]: Information change date.
final class UserSupportInfo extends TdObject {
  /// **UserSupportInfo** *(userSupportInfo)* - basic class
  ///
  /// Contains custom information about the user.
  ///
  /// * [message]: Information message.
  /// * [author]: Information author.
  /// * [date]: Information change date.
  const UserSupportInfo({
    required this.message,
    required this.author,
    required this.date,
    this.extra,
    this.clientId,
  });

  /// Information message
  final FormattedText message;

  /// Information author
  final String author;

  /// Information change date
  final int date;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UserSupportInfo.fromJson(Map<String, dynamic> json) =>
      UserSupportInfo(
        message: FormattedText.fromJson(json['message']),
        author: json['author'],
        date: json['date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "author": author,
      "date": date,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: Information message
  /// * [author]: Information author
  /// * [date]: Information change date
  UserSupportInfo copyWith({
    FormattedText? message,
    String? author,
    int? date,
    dynamic extra,
    int? clientId,
  }) =>
      UserSupportInfo(
        message: message ?? this.message,
        author: author ?? this.author,
        date: date ?? this.date,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userSupportInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
