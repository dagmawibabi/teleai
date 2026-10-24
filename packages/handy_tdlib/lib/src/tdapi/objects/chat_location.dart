part of '../tdapi.dart';

/// **ChatLocation** *(chatLocation)* - basic class
///
/// Represents a location to which a chat is connected.
///
/// * [location]: The location.
/// * [address]: Location address; 1-64 characters, as defined by the chat owner.
final class ChatLocation extends TdObject {
  /// **ChatLocation** *(chatLocation)* - basic class
  ///
  /// Represents a location to which a chat is connected.
  ///
  /// * [location]: The location.
  /// * [address]: Location address; 1-64 characters, as defined by the chat owner.
  const ChatLocation({
    required this.location,
    required this.address,
  });

  /// The location
  final Location location;

  /// Location address; 1-64 characters, as defined by the chat owner
  final String address;

  /// Parse from a json
  factory ChatLocation.fromJson(Map<String, dynamic> json) => ChatLocation(
        location: Location.fromJson(json['location']),
        address: json['address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "address": address,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The location
  /// * [address]: Location address; 1-64 characters, as defined by the chat owner
  ChatLocation copyWith({
    Location? location,
    String? address,
  }) =>
      ChatLocation(
        location: location ?? this.location,
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
