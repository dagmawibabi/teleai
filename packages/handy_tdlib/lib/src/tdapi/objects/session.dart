part of '../tdapi.dart';

/// **Session** *(session)* - basic class
///
/// Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order.
///
/// * [id]: Session identifier.
/// * [isCurrent]: True, if this session is the current session.
/// * [isPasswordPending]: True, if a 2-step verification password is needed to complete authorization of the session.
/// * [isUnconfirmed]: True, if the session wasn't confirmed from another session.
/// * [canAcceptSecretChats]: True, if incoming secret chats can be accepted by the session.
/// * [canAcceptCalls]: True, if incoming calls can be accepted by the session.
/// * [deviceType]: Session device type based on the system and application version, which can be used to display a corresponding icon.
/// * [apiId]: Telegram API identifier, as provided by the application.
/// * [applicationName]: Name of the application, as provided by the application.
/// * [applicationVersion]: The version of the application, as provided by the application.
/// * [isOfficialApplication]: True, if the application is an official application or uses the api_id of an official application.
/// * [deviceModel]: Model of the device the application has been run or is running on, as provided by the application.
/// * [platform]: Operating system the application has been run or is running on, as provided by the application.
/// * [systemVersion]: Version of the operating system the application has been run or is running on, as provided by the application.
/// * [logInDate]: Point in time (Unix timestamp) when the user has logged in.
/// * [lastActiveDate]: Point in time (Unix timestamp) when the session was last used.
/// * [ipAddress]: IP address from which the session was created, in human-readable format.
/// * [location]: A human-readable description of the location from which the session was created, based on the IP address.
final class Session extends TdObject {
  /// **Session** *(session)* - basic class
  ///
  /// Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order.
  ///
  /// * [id]: Session identifier.
  /// * [isCurrent]: True, if this session is the current session.
  /// * [isPasswordPending]: True, if a 2-step verification password is needed to complete authorization of the session.
  /// * [isUnconfirmed]: True, if the session wasn't confirmed from another session.
  /// * [canAcceptSecretChats]: True, if incoming secret chats can be accepted by the session.
  /// * [canAcceptCalls]: True, if incoming calls can be accepted by the session.
  /// * [deviceType]: Session device type based on the system and application version, which can be used to display a corresponding icon.
  /// * [apiId]: Telegram API identifier, as provided by the application.
  /// * [applicationName]: Name of the application, as provided by the application.
  /// * [applicationVersion]: The version of the application, as provided by the application.
  /// * [isOfficialApplication]: True, if the application is an official application or uses the api_id of an official application.
  /// * [deviceModel]: Model of the device the application has been run or is running on, as provided by the application.
  /// * [platform]: Operating system the application has been run or is running on, as provided by the application.
  /// * [systemVersion]: Version of the operating system the application has been run or is running on, as provided by the application.
  /// * [logInDate]: Point in time (Unix timestamp) when the user has logged in.
  /// * [lastActiveDate]: Point in time (Unix timestamp) when the session was last used.
  /// * [ipAddress]: IP address from which the session was created, in human-readable format.
  /// * [location]: A human-readable description of the location from which the session was created, based on the IP address.
  const Session({
    required this.id,
    required this.isCurrent,
    required this.isPasswordPending,
    required this.isUnconfirmed,
    required this.canAcceptSecretChats,
    required this.canAcceptCalls,
    required this.deviceType,
    required this.apiId,
    required this.applicationName,
    required this.applicationVersion,
    required this.isOfficialApplication,
    required this.deviceModel,
    required this.platform,
    required this.systemVersion,
    required this.logInDate,
    required this.lastActiveDate,
    required this.ipAddress,
    required this.location,
    this.extra,
    this.clientId,
  });

  /// Session identifier
  final int id;

  /// True, if this session is the current session
  final bool isCurrent;

  /// True, if a 2-step verification password is needed to complete authorization of the session
  final bool isPasswordPending;

  /// True, if the session wasn't confirmed from another session
  final bool isUnconfirmed;

  /// True, if incoming secret chats can be accepted by the session
  final bool canAcceptSecretChats;

  /// True, if incoming calls can be accepted by the session
  final bool canAcceptCalls;

  /// Session device type based on the system and application version, which can be used to display a corresponding icon
  final SessionDeviceType deviceType;

  /// Telegram API identifier, as provided by the application
  final int apiId;

  /// Name of the application, as provided by the application
  final String applicationName;

  /// The version of the application, as provided by the application
  final String applicationVersion;

  /// True, if the application is an official application or uses the api_id of an official application
  final bool isOfficialApplication;

  /// Model of the device the application has been run or is running on, as provided by the application
  final String deviceModel;

  /// Operating system the application has been run or is running on, as provided by the application
  final String platform;

  /// Version of the operating system the application has been run or is running on, as provided by the application
  final String systemVersion;

  /// Point in time (Unix timestamp) when the user has logged in
  final int logInDate;

  /// Point in time (Unix timestamp) when the session was last used
  final int lastActiveDate;

  /// IP address from which the session was created, in human-readable format
  final String ipAddress;

  /// A human-readable description of the location from which the session was created, based on the IP address
  final String location;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        isCurrent: json['is_current'],
        isPasswordPending: json['is_password_pending'],
        isUnconfirmed: json['is_unconfirmed'],
        canAcceptSecretChats: json['can_accept_secret_chats'],
        canAcceptCalls: json['can_accept_calls'],
        deviceType: SessionDeviceType.fromJson(json['device_type']),
        apiId: json['api_id'],
        applicationName: json['application_name'],
        applicationVersion: json['application_version'],
        isOfficialApplication: json['is_official_application'],
        deviceModel: json['device_model'],
        platform: json['platform'],
        systemVersion: json['system_version'],
        logInDate: json['log_in_date'],
        lastActiveDate: json['last_active_date'],
        ipAddress: json['ip_address'],
        location: json['location'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "is_current": isCurrent,
      "is_password_pending": isPasswordPending,
      "is_unconfirmed": isUnconfirmed,
      "can_accept_secret_chats": canAcceptSecretChats,
      "can_accept_calls": canAcceptCalls,
      "device_type": deviceType.toJson(),
      "api_id": apiId,
      "application_name": applicationName,
      "application_version": applicationVersion,
      "is_official_application": isOfficialApplication,
      "device_model": deviceModel,
      "platform": platform,
      "system_version": systemVersion,
      "log_in_date": logInDate,
      "last_active_date": lastActiveDate,
      "ip_address": ipAddress,
      "location": location,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Session identifier
  /// * [is_current]: True, if this session is the current session
  /// * [is_password_pending]: True, if a 2-step verification password is needed to complete authorization of the session
  /// * [is_unconfirmed]: True, if the session wasn't confirmed from another session
  /// * [can_accept_secret_chats]: True, if incoming secret chats can be accepted by the session
  /// * [can_accept_calls]: True, if incoming calls can be accepted by the session
  /// * [device_type]: Session device type based on the system and application version, which can be used to display a corresponding icon
  /// * [api_id]: Telegram API identifier, as provided by the application
  /// * [application_name]: Name of the application, as provided by the application
  /// * [application_version]: The version of the application, as provided by the application
  /// * [is_official_application]: True, if the application is an official application or uses the api_id of an official application
  /// * [device_model]: Model of the device the application has been run or is running on, as provided by the application
  /// * [platform]: Operating system the application has been run or is running on, as provided by the application
  /// * [system_version]: Version of the operating system the application has been run or is running on, as provided by the application
  /// * [log_in_date]: Point in time (Unix timestamp) when the user has logged in
  /// * [last_active_date]: Point in time (Unix timestamp) when the session was last used
  /// * [ip_address]: IP address from which the session was created, in human-readable format
  /// * [location]: A human-readable description of the location from which the session was created, based on the IP address
  Session copyWith({
    int? id,
    bool? isCurrent,
    bool? isPasswordPending,
    bool? isUnconfirmed,
    bool? canAcceptSecretChats,
    bool? canAcceptCalls,
    SessionDeviceType? deviceType,
    int? apiId,
    String? applicationName,
    String? applicationVersion,
    bool? isOfficialApplication,
    String? deviceModel,
    String? platform,
    String? systemVersion,
    int? logInDate,
    int? lastActiveDate,
    String? ipAddress,
    String? location,
    dynamic extra,
    int? clientId,
  }) =>
      Session(
        id: id ?? this.id,
        isCurrent: isCurrent ?? this.isCurrent,
        isPasswordPending: isPasswordPending ?? this.isPasswordPending,
        isUnconfirmed: isUnconfirmed ?? this.isUnconfirmed,
        canAcceptSecretChats: canAcceptSecretChats ?? this.canAcceptSecretChats,
        canAcceptCalls: canAcceptCalls ?? this.canAcceptCalls,
        deviceType: deviceType ?? this.deviceType,
        apiId: apiId ?? this.apiId,
        applicationName: applicationName ?? this.applicationName,
        applicationVersion: applicationVersion ?? this.applicationVersion,
        isOfficialApplication:
            isOfficialApplication ?? this.isOfficialApplication,
        deviceModel: deviceModel ?? this.deviceModel,
        platform: platform ?? this.platform,
        systemVersion: systemVersion ?? this.systemVersion,
        logInDate: logInDate ?? this.logInDate,
        lastActiveDate: lastActiveDate ?? this.lastActiveDate,
        ipAddress: ipAddress ?? this.ipAddress,
        location: location ?? this.location,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'session';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
