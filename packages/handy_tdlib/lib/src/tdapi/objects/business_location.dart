part of '../tdapi.dart';

/// **BusinessLocation** *(businessLocation)* - basic class
///
/// Represents a location of a business.
///
/// * [location]: The location; may be null if not specified *(optional)*.
/// * [address]: Location address; 1-96 characters.
final class BusinessLocation extends TdObject {
  /// **BusinessLocation** *(businessLocation)* - basic class
  ///
  /// Represents a location of a business.
  ///
  /// * [location]: The location; may be null if not specified *(optional)*.
  /// * [address]: Location address; 1-96 characters.
  const BusinessLocation({
    this.location,
    required this.address,
  });

  /// The location; may be null if not specified
  final Location? location;

  /// Location address; 1-96 characters
  final String address;

  /// Parse from a json
  factory BusinessLocation.fromJson(Map<String, dynamic> json) =>
      BusinessLocation(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location']),
        address: json['address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location?.toJson(),
      "address": address,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The location; may be null if not specified
  /// * [address]: Location address; 1-96 characters
  BusinessLocation copyWith({
    Location? location,
    String? address,
  }) =>
      BusinessLocation(
        location: location ?? this.location,
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
