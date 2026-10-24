part of '../tdapi.dart';

/// **ConnectedAffiliateProgram** *(connectedAffiliateProgram)* - basic class
///
/// Describes an affiliate program that was connected to an affiliate.
///
/// * [url]: The link that can be used to refer users if the program is still active.
/// * [botUserId]: User identifier of the bot that created the program.
/// * [parameters]: The parameters of the affiliate program.
/// * [connectionDate]: Point in time (Unix timestamp) when the affiliate program was connected.
/// * [isDisconnected]: True, if the program was canceled by the bot, or disconnected by the chat owner and isn't available anymore.
/// * [userCount]: The number of users that used the affiliate program.
/// * [revenueStarCount]: The number of Telegram Stars that were earned by the affiliate program.
final class ConnectedAffiliateProgram extends TdObject {
  /// **ConnectedAffiliateProgram** *(connectedAffiliateProgram)* - basic class
  ///
  /// Describes an affiliate program that was connected to an affiliate.
  ///
  /// * [url]: The link that can be used to refer users if the program is still active.
  /// * [botUserId]: User identifier of the bot that created the program.
  /// * [parameters]: The parameters of the affiliate program.
  /// * [connectionDate]: Point in time (Unix timestamp) when the affiliate program was connected.
  /// * [isDisconnected]: True, if the program was canceled by the bot, or disconnected by the chat owner and isn't available anymore.
  /// * [userCount]: The number of users that used the affiliate program.
  /// * [revenueStarCount]: The number of Telegram Stars that were earned by the affiliate program.
  const ConnectedAffiliateProgram({
    required this.url,
    required this.botUserId,
    required this.parameters,
    required this.connectionDate,
    required this.isDisconnected,
    required this.userCount,
    required this.revenueStarCount,
    this.extra,
    this.clientId,
  });

  /// The link that can be used to refer users if the program is still active
  final String url;

  /// User identifier of the bot that created the program
  final int botUserId;

  /// The parameters of the affiliate program
  final AffiliateProgramParameters parameters;

  /// Point in time (Unix timestamp) when the affiliate program was connected
  final int connectionDate;

  /// True, if the program was canceled by the bot, or disconnected by the chat owner and isn't available anymore
  final bool isDisconnected;

  /// The number of users that used the affiliate program
  final int userCount;

  /// The number of Telegram Stars that were earned by the affiliate program
  final int revenueStarCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ConnectedAffiliateProgram.fromJson(Map<String, dynamic> json) =>
      ConnectedAffiliateProgram(
        url: json['url'],
        botUserId: json['bot_user_id'],
        parameters: AffiliateProgramParameters.fromJson(json['parameters']),
        connectionDate: json['connection_date'],
        isDisconnected: json['is_disconnected'],
        userCount: json['user_count'] is int
            ? json['user_count']
            : int.parse(json['user_count']),
        revenueStarCount: json['revenue_star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "bot_user_id": botUserId,
      "parameters": parameters.toJson(),
      "connection_date": connectionDate,
      "is_disconnected": isDisconnected,
      "user_count": userCount,
      "revenue_star_count": revenueStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The link that can be used to refer users if the program is still active
  /// * [bot_user_id]: User identifier of the bot that created the program
  /// * [parameters]: The parameters of the affiliate program
  /// * [connection_date]: Point in time (Unix timestamp) when the affiliate program was connected
  /// * [is_disconnected]: True, if the program was canceled by the bot, or disconnected by the chat owner and isn't available anymore
  /// * [user_count]: The number of users that used the affiliate program
  /// * [revenue_star_count]: The number of Telegram Stars that were earned by the affiliate program
  ConnectedAffiliateProgram copyWith({
    String? url,
    int? botUserId,
    AffiliateProgramParameters? parameters,
    int? connectionDate,
    bool? isDisconnected,
    int? userCount,
    int? revenueStarCount,
    dynamic extra,
    int? clientId,
  }) =>
      ConnectedAffiliateProgram(
        url: url ?? this.url,
        botUserId: botUserId ?? this.botUserId,
        parameters: parameters ?? this.parameters,
        connectionDate: connectionDate ?? this.connectionDate,
        isDisconnected: isDisconnected ?? this.isDisconnected,
        userCount: userCount ?? this.userCount,
        revenueStarCount: revenueStarCount ?? this.revenueStarCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'connectedAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
