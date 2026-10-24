part of '../tdapi.dart';

/// **LiveLocation** *(liveLocation)* - basic class
///
/// A live location.
///
/// * [location]: The current location.
/// * [livePeriod]: Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever.
/// * [heading]: The direction in which the location moves, in degrees; 1-360; 0 if unknown.
/// * [proximityAlertRadius]: The maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled.. Can't be enabled in direct messages chats, channels and Saved Messages. Available only to the message sender.
final class LiveLocation extends TdObject {
  /// **LiveLocation** *(liveLocation)* - basic class
  ///
  /// A live location.
  ///
  /// * [location]: The current location.
  /// * [livePeriod]: Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever.
  /// * [heading]: The direction in which the location moves, in degrees; 1-360; 0 if unknown.
  /// * [proximityAlertRadius]: The maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled.. Can't be enabled in direct messages chats, channels and Saved Messages. Available only to the message sender.
  const LiveLocation({
    required this.location,
    required this.livePeriod,
    required this.heading,
    required this.proximityAlertRadius,
  });

  /// The current location
  final Location location;

  /// Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever
  final int livePeriod;

  /// The direction in which the location moves, in degrees; 1-360; 0 if unknown
  final int heading;

  /// The maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled.. Can't be enabled in direct messages chats, channels and Saved Messages. Available only to the message sender
  final int proximityAlertRadius;

  /// Parse from a json
  factory LiveLocation.fromJson(Map<String, dynamic> json) => LiveLocation(
        location: Location.fromJson(json['location']),
        livePeriod: json['live_period'],
        heading: json['heading'],
        proximityAlertRadius: json['proximity_alert_radius'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "live_period": livePeriod,
      "heading": heading,
      "proximity_alert_radius": proximityAlertRadius,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The current location
  /// * [live_period]: Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever
  /// * [heading]: The direction in which the location moves, in degrees; 1-360; 0 if unknown
  /// * [proximity_alert_radius]: The maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled.. Can't be enabled in direct messages chats, channels and Saved Messages. Available only to the message sender
  LiveLocation copyWith({
    Location? location,
    int? livePeriod,
    int? heading,
    int? proximityAlertRadius,
  }) =>
      LiveLocation(
        location: location ?? this.location,
        livePeriod: livePeriod ?? this.livePeriod,
        heading: heading ?? this.heading,
        proximityAlertRadius: proximityAlertRadius ?? this.proximityAlertRadius,
      );

  /// TDLib object type
  static const String defaultObjectId = 'liveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
