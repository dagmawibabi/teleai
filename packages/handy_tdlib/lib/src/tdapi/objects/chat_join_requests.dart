part of '../tdapi.dart';

/// **ChatJoinRequests** *(chatJoinRequests)* - basic class
///
/// Contains a list of requests to join a chat.
///
/// * [totalCount]: Approximate total number of requests found.
/// * [requests]: List of the requests.
final class ChatJoinRequests extends TdObject {
  /// **ChatJoinRequests** *(chatJoinRequests)* - basic class
  ///
  /// Contains a list of requests to join a chat.
  ///
  /// * [totalCount]: Approximate total number of requests found.
  /// * [requests]: List of the requests.
  const ChatJoinRequests({
    required this.totalCount,
    required this.requests,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of requests found
  final int totalCount;

  /// List of the requests
  final List<ChatJoinRequest> requests;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatJoinRequests.fromJson(Map<String, dynamic> json) =>
      ChatJoinRequests(
        totalCount: json['total_count'],
        requests: List<ChatJoinRequest>.from((json['requests'] ?? [])
            .map((item) => ChatJoinRequest.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "requests": requests.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of requests found
  /// * [requests]: List of the requests
  ChatJoinRequests copyWith({
    int? totalCount,
    List<ChatJoinRequest>? requests,
    dynamic extra,
    int? clientId,
  }) =>
      ChatJoinRequests(
        totalCount: totalCount ?? this.totalCount,
        requests: requests ?? this.requests,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequests';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
