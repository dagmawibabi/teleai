part of '../tdapi.dart';

/// **BusinessInfo** *(businessInfo)* - basic class
///
/// Contains information about a Telegram Business account.
///
/// * [location]: Location of the business; may be null if none *(optional)*.
/// * [openingHours]: Opening hours of the business; may be null if none. The hours are guaranteed to be valid and have already been split by week days *(optional)*.
/// * [localOpeningHours]: Opening hours of the business in the local time; may be null if none. The hours are guaranteed to be valid and have already been split by week days.. Local time zone identifier will be empty. An updateUserFullInfo update is not triggered when value of this field changes *(optional)*.
/// * [nextOpenIn]: Time left before the business will open the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes.
/// * [nextCloseIn]: Time left before the business will close the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes.
/// * [greetingMessageSettings]: The greeting message; may be null if none or the Business account is not of the current user *(optional)*.
/// * [awayMessageSettings]: The away message; may be null if none or the Business account is not of the current user *(optional)*.
/// * [startPage]: Information about start page of the account; may be null if none *(optional)*.
final class BusinessInfo extends TdObject {
  /// **BusinessInfo** *(businessInfo)* - basic class
  ///
  /// Contains information about a Telegram Business account.
  ///
  /// * [location]: Location of the business; may be null if none *(optional)*.
  /// * [openingHours]: Opening hours of the business; may be null if none. The hours are guaranteed to be valid and have already been split by week days *(optional)*.
  /// * [localOpeningHours]: Opening hours of the business in the local time; may be null if none. The hours are guaranteed to be valid and have already been split by week days.. Local time zone identifier will be empty. An updateUserFullInfo update is not triggered when value of this field changes *(optional)*.
  /// * [nextOpenIn]: Time left before the business will open the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes.
  /// * [nextCloseIn]: Time left before the business will close the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes.
  /// * [greetingMessageSettings]: The greeting message; may be null if none or the Business account is not of the current user *(optional)*.
  /// * [awayMessageSettings]: The away message; may be null if none or the Business account is not of the current user *(optional)*.
  /// * [startPage]: Information about start page of the account; may be null if none *(optional)*.
  const BusinessInfo({
    this.location,
    this.openingHours,
    this.localOpeningHours,
    required this.nextOpenIn,
    required this.nextCloseIn,
    this.greetingMessageSettings,
    this.awayMessageSettings,
    this.startPage,
  });

  /// Location of the business; may be null if none
  final BusinessLocation? location;

  /// Opening hours of the business; may be null if none. The hours are guaranteed to be valid and have already been split by week days
  final BusinessOpeningHours? openingHours;

  /// Opening hours of the business in the local time; may be null if none. The hours are guaranteed to be valid and have already been split by week days.. Local time zone identifier will be empty. An updateUserFullInfo update is not triggered when value of this field changes
  final BusinessOpeningHours? localOpeningHours;

  /// Time left before the business will open the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
  final int nextOpenIn;

  /// Time left before the business will close the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
  final int nextCloseIn;

  /// The greeting message; may be null if none or the Business account is not of the current user
  final BusinessGreetingMessageSettings? greetingMessageSettings;

  /// The away message; may be null if none or the Business account is not of the current user
  final BusinessAwayMessageSettings? awayMessageSettings;

  /// Information about start page of the account; may be null if none
  final BusinessStartPage? startPage;

  /// Parse from a json
  factory BusinessInfo.fromJson(Map<String, dynamic> json) => BusinessInfo(
        location: json['location'] == null
            ? null
            : BusinessLocation.fromJson(json['location']),
        openingHours: json['opening_hours'] == null
            ? null
            : BusinessOpeningHours.fromJson(json['opening_hours']),
        localOpeningHours: json['local_opening_hours'] == null
            ? null
            : BusinessOpeningHours.fromJson(json['local_opening_hours']),
        nextOpenIn: json['next_open_in'],
        nextCloseIn: json['next_close_in'],
        greetingMessageSettings: json['greeting_message_settings'] == null
            ? null
            : BusinessGreetingMessageSettings.fromJson(
                json['greeting_message_settings']),
        awayMessageSettings: json['away_message_settings'] == null
            ? null
            : BusinessAwayMessageSettings.fromJson(
                json['away_message_settings']),
        startPage: json['start_page'] == null
            ? null
            : BusinessStartPage.fromJson(json['start_page']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location?.toJson(),
      "opening_hours": openingHours?.toJson(),
      "local_opening_hours": localOpeningHours?.toJson(),
      "next_open_in": nextOpenIn,
      "next_close_in": nextCloseIn,
      "greeting_message_settings": greetingMessageSettings?.toJson(),
      "away_message_settings": awayMessageSettings?.toJson(),
      "start_page": startPage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: Location of the business; may be null if none
  /// * [opening_hours]: Opening hours of the business; may be null if none. The hours are guaranteed to be valid and have already been split by week days
  /// * [local_opening_hours]: Opening hours of the business in the local time; may be null if none. The hours are guaranteed to be valid and have already been split by week days.. Local time zone identifier will be empty. An updateUserFullInfo update is not triggered when value of this field changes
  /// * [next_open_in]: Time left before the business will open the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
  /// * [next_close_in]: Time left before the business will close the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
  /// * [greeting_message_settings]: The greeting message; may be null if none or the Business account is not of the current user
  /// * [away_message_settings]: The away message; may be null if none or the Business account is not of the current user
  /// * [start_page]: Information about start page of the account; may be null if none
  BusinessInfo copyWith({
    BusinessLocation? location,
    BusinessOpeningHours? openingHours,
    BusinessOpeningHours? localOpeningHours,
    int? nextOpenIn,
    int? nextCloseIn,
    BusinessGreetingMessageSettings? greetingMessageSettings,
    BusinessAwayMessageSettings? awayMessageSettings,
    BusinessStartPage? startPage,
  }) =>
      BusinessInfo(
        location: location ?? this.location,
        openingHours: openingHours ?? this.openingHours,
        localOpeningHours: localOpeningHours ?? this.localOpeningHours,
        nextOpenIn: nextOpenIn ?? this.nextOpenIn,
        nextCloseIn: nextCloseIn ?? this.nextCloseIn,
        greetingMessageSettings:
            greetingMessageSettings ?? this.greetingMessageSettings,
        awayMessageSettings: awayMessageSettings ?? this.awayMessageSettings,
        startPage: startPage ?? this.startPage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
