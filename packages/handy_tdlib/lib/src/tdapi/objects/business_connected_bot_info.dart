part of '../tdapi.dart';

/// **BusinessConnectedBotInfo** *(businessConnectedBotInfo)* - basic class
///
/// Describes a connection of a bot to an account.
///
/// * [bot]: Information about the bot.
/// * [connectionDate]: Point in time (Unix timestamp) when the bot was added; may be 0 if unknown.
/// * [deviceModel]: Model of the device that was used for the bot connection, as provided by the application; may be empty if unknown.
/// * [location]: A human-readable description of the location from which the bot was connected, based on the IP address; may be empty if unknown.
final class BusinessConnectedBotInfo extends TdObject {
  /// **BusinessConnectedBotInfo** *(businessConnectedBotInfo)* - basic class
  ///
  /// Describes a connection of a bot to an account.
  ///
  /// * [bot]: Information about the bot.
  /// * [connectionDate]: Point in time (Unix timestamp) when the bot was added; may be 0 if unknown.
  /// * [deviceModel]: Model of the device that was used for the bot connection, as provided by the application; may be empty if unknown.
  /// * [location]: A human-readable description of the location from which the bot was connected, based on the IP address; may be empty if unknown.
  const BusinessConnectedBotInfo({
    required this.bot,
    required this.connectionDate,
    required this.deviceModel,
    required this.location,
    this.extra,
    this.clientId,
  });

  /// Information about the bot
  final BusinessConnectedBot bot;

  /// Point in time (Unix timestamp) when the bot was added; may be 0 if unknown
  final int connectionDate;

  /// Model of the device that was used for the bot connection, as provided by the application; may be empty if unknown
  final String deviceModel;

  /// A human-readable description of the location from which the bot was connected, based on the IP address; may be empty if unknown
  final String location;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessConnectedBotInfo.fromJson(Map<String, dynamic> json) =>
      BusinessConnectedBotInfo(
        bot: BusinessConnectedBot.fromJson(json['bot']),
        connectionDate: json['connection_date'],
        deviceModel: json['device_model'],
        location: json['location'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot": bot.toJson(),
      "connection_date": connectionDate,
      "device_model": deviceModel,
      "location": location,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot]: Information about the bot
  /// * [connection_date]: Point in time (Unix timestamp) when the bot was added; may be 0 if unknown
  /// * [device_model]: Model of the device that was used for the bot connection, as provided by the application; may be empty if unknown
  /// * [location]: A human-readable description of the location from which the bot was connected, based on the IP address; may be empty if unknown
  BusinessConnectedBotInfo copyWith({
    BusinessConnectedBot? bot,
    int? connectionDate,
    String? deviceModel,
    String? location,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessConnectedBotInfo(
        bot: bot ?? this.bot,
        connectionDate: connectionDate ?? this.connectionDate,
        deviceModel: deviceModel ?? this.deviceModel,
        location: location ?? this.location,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessConnectedBotInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
