part of '../tdapi.dart';

/// **ConnectedWebsite** *(connectedWebsite)* - basic class
///
/// Contains information about one website the current user is logged in with Telegram.
///
/// * [id]: Website identifier.
/// * [domainName]: The domain name of the website.
/// * [botUserId]: User identifier of a bot linked with the website.
/// * [browser]: The version of a browser used to log in.
/// * [platform]: Operating system the browser is running on.
/// * [logInDate]: Point in time (Unix timestamp) when the user was logged in.
/// * [lastActiveDate]: Point in time (Unix timestamp) when obtained authorization was last used.
/// * [ipAddress]: IP address from which the user was logged in, in human-readable format.
/// * [location]: Human-readable description of a country and a region from which the user was logged in, based on the IP address.
final class ConnectedWebsite extends TdObject {
  /// **ConnectedWebsite** *(connectedWebsite)* - basic class
  ///
  /// Contains information about one website the current user is logged in with Telegram.
  ///
  /// * [id]: Website identifier.
  /// * [domainName]: The domain name of the website.
  /// * [botUserId]: User identifier of a bot linked with the website.
  /// * [browser]: The version of a browser used to log in.
  /// * [platform]: Operating system the browser is running on.
  /// * [logInDate]: Point in time (Unix timestamp) when the user was logged in.
  /// * [lastActiveDate]: Point in time (Unix timestamp) when obtained authorization was last used.
  /// * [ipAddress]: IP address from which the user was logged in, in human-readable format.
  /// * [location]: Human-readable description of a country and a region from which the user was logged in, based on the IP address.
  const ConnectedWebsite({
    required this.id,
    required this.domainName,
    required this.botUserId,
    required this.browser,
    required this.platform,
    required this.logInDate,
    required this.lastActiveDate,
    required this.ipAddress,
    required this.location,
  });

  /// Website identifier
  final int id;

  /// The domain name of the website
  final String domainName;

  /// User identifier of a bot linked with the website
  final int botUserId;

  /// The version of a browser used to log in
  final String browser;

  /// Operating system the browser is running on
  final String platform;

  /// Point in time (Unix timestamp) when the user was logged in
  final int logInDate;

  /// Point in time (Unix timestamp) when obtained authorization was last used
  final int lastActiveDate;

  /// IP address from which the user was logged in, in human-readable format
  final String ipAddress;

  /// Human-readable description of a country and a region from which the user was logged in, based on the IP address
  final String location;

  /// Parse from a json
  factory ConnectedWebsite.fromJson(Map<String, dynamic> json) =>
      ConnectedWebsite(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        domainName: json['domain_name'],
        botUserId: json['bot_user_id'],
        browser: json['browser'],
        platform: json['platform'],
        logInDate: json['log_in_date'],
        lastActiveDate: json['last_active_date'],
        ipAddress: json['ip_address'],
        location: json['location'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "domain_name": domainName,
      "bot_user_id": botUserId,
      "browser": browser,
      "platform": platform,
      "log_in_date": logInDate,
      "last_active_date": lastActiveDate,
      "ip_address": ipAddress,
      "location": location,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Website identifier
  /// * [domain_name]: The domain name of the website
  /// * [bot_user_id]: User identifier of a bot linked with the website
  /// * [browser]: The version of a browser used to log in
  /// * [platform]: Operating system the browser is running on
  /// * [log_in_date]: Point in time (Unix timestamp) when the user was logged in
  /// * [last_active_date]: Point in time (Unix timestamp) when obtained authorization was last used
  /// * [ip_address]: IP address from which the user was logged in, in human-readable format
  /// * [location]: Human-readable description of a country and a region from which the user was logged in, based on the IP address
  ConnectedWebsite copyWith({
    int? id,
    String? domainName,
    int? botUserId,
    String? browser,
    String? platform,
    int? logInDate,
    int? lastActiveDate,
    String? ipAddress,
    String? location,
  }) =>
      ConnectedWebsite(
        id: id ?? this.id,
        domainName: domainName ?? this.domainName,
        botUserId: botUserId ?? this.botUserId,
        browser: browser ?? this.browser,
        platform: platform ?? this.platform,
        logInDate: logInDate ?? this.logInDate,
        lastActiveDate: lastActiveDate ?? this.lastActiveDate,
        ipAddress: ipAddress ?? this.ipAddress,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'connectedWebsite';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
