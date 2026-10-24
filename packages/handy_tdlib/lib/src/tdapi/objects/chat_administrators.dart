part of '../tdapi.dart';

/// **ChatAdministrators** *(chatAdministrators)* - basic class
///
/// Represents a list of chat administrators.
///
/// * [administrators]: A list of chat administrators.
final class ChatAdministrators extends TdObject {
  /// **ChatAdministrators** *(chatAdministrators)* - basic class
  ///
  /// Represents a list of chat administrators.
  ///
  /// * [administrators]: A list of chat administrators.
  const ChatAdministrators({
    required this.administrators,
    this.extra,
    this.clientId,
  });

  /// A list of chat administrators
  final List<ChatAdministrator> administrators;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatAdministrators.fromJson(Map<String, dynamic> json) =>
      ChatAdministrators(
        administrators: List<ChatAdministrator>.from(
            (json['administrators'] ?? [])
                .map((item) => ChatAdministrator.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "administrators": administrators.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [administrators]: A list of chat administrators
  ChatAdministrators copyWith({
    List<ChatAdministrator>? administrators,
    dynamic extra,
    int? clientId,
  }) =>
      ChatAdministrators(
        administrators: administrators ?? this.administrators,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatAdministrators';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
