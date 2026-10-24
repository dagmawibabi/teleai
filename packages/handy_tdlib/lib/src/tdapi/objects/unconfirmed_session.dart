part of '../tdapi.dart';

/// **UnconfirmedSession** *(unconfirmedSession)* - basic class
///
/// Contains information about an unconfirmed session.
///
/// * [type]: Session type.
/// * [date]: Point in time (Unix timestamp) when the user has logged in or the business bot was connected.
/// * [deviceModel]: Model of the device that was used for the session creation, as provided by the application.
/// * [location]: A human-readable description of the location from which the session was created, based on the IP address.
final class UnconfirmedSession extends TdObject {
  /// **UnconfirmedSession** *(unconfirmedSession)* - basic class
  ///
  /// Contains information about an unconfirmed session.
  ///
  /// * [type]: Session type.
  /// * [date]: Point in time (Unix timestamp) when the user has logged in or the business bot was connected.
  /// * [deviceModel]: Model of the device that was used for the session creation, as provided by the application.
  /// * [location]: A human-readable description of the location from which the session was created, based on the IP address.
  const UnconfirmedSession({
    required this.type,
    required this.date,
    required this.deviceModel,
    required this.location,
  });

  /// Session type
  final SessionType type;

  /// Point in time (Unix timestamp) when the user has logged in or the business bot was connected
  final int date;

  /// Model of the device that was used for the session creation, as provided by the application
  final String deviceModel;

  /// A human-readable description of the location from which the session was created, based on the IP address
  final String location;

  /// Parse from a json
  factory UnconfirmedSession.fromJson(Map<String, dynamic> json) =>
      UnconfirmedSession(
        type: SessionType.fromJson(json['type']),
        date: json['date'],
        deviceModel: json['device_model'],
        location: json['location'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "date": date,
      "device_model": deviceModel,
      "location": location,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Session type
  /// * [date]: Point in time (Unix timestamp) when the user has logged in or the business bot was connected
  /// * [device_model]: Model of the device that was used for the session creation, as provided by the application
  /// * [location]: A human-readable description of the location from which the session was created, based on the IP address
  UnconfirmedSession copyWith({
    SessionType? type,
    int? date,
    String? deviceModel,
    String? location,
  }) =>
      UnconfirmedSession(
        type: type ?? this.type,
        date: date ?? this.date,
        deviceModel: deviceModel ?? this.deviceModel,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'unconfirmedSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
