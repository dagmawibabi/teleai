part of '../tdapi.dart';

/// **AcceptOauthRequest** *(acceptOauthRequest)* - TDLib function
///
/// Accepts an OAuth authorization request. Returns an HTTP URL to open after successful authorization.. May return an empty link if just a toast about successful login has to be shown.
///
/// * [url]: URL of the OAuth deep link.
/// * [matchCode]: The matching code chosen by the user.
/// * [allowWriteAccess]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to send them messages.
/// * [allowPhoneNumberAccess]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to access their phone number.
/// * [tonConnectConnectData]: Pass data required to access the user's TON wallet via TON Connect if the current user allowed this; pass null if the access wasn't requested or the user declined access *(optional)*.
///
/// [HttpUrl] is returned on completion.
final class AcceptOauthRequest extends TdFunction {
  /// **AcceptOauthRequest** *(acceptOauthRequest)* - TDLib function
  ///
  /// Accepts an OAuth authorization request. Returns an HTTP URL to open after successful authorization.. May return an empty link if just a toast about successful login has to be shown.
  ///
  /// * [url]: URL of the OAuth deep link.
  /// * [matchCode]: The matching code chosen by the user.
  /// * [allowWriteAccess]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to send them messages.
  /// * [allowPhoneNumberAccess]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to access their phone number.
  /// * [tonConnectConnectData]: Pass data required to access the user's TON wallet via TON Connect if the current user allowed this; pass null if the access wasn't requested or the user declined access *(optional)*.
  ///
  /// [HttpUrl] is returned on completion.
  const AcceptOauthRequest({
    required this.url,
    required this.matchCode,
    required this.allowWriteAccess,
    required this.allowPhoneNumberAccess,
    this.tonConnectConnectData,
  });

  /// URL of the OAuth deep link
  final String url;

  /// The matching code chosen by the user
  final String matchCode;

  /// Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to send them messages
  final bool allowWriteAccess;

  /// Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to access their phone number
  final bool allowPhoneNumberAccess;

  /// Pass data required to access the user's TON wallet via TON Connect if the current user allowed this; pass null if the access wasn't requested or the user declined access
  final TonConnectConnectData? tonConnectConnectData;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "match_code": matchCode,
      "allow_write_access": allowWriteAccess,
      "allow_phone_number_access": allowPhoneNumberAccess,
      "ton_connect_connect_data": tonConnectConnectData?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the OAuth deep link
  /// * [match_code]: The matching code chosen by the user
  /// * [allow_write_access]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to send them messages
  /// * [allow_phone_number_access]: Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to access their phone number
  /// * [ton_connect_connect_data]: Pass data required to access the user's TON wallet via TON Connect if the current user allowed this; pass null if the access wasn't requested or the user declined access
  AcceptOauthRequest copyWith({
    String? url,
    String? matchCode,
    bool? allowWriteAccess,
    bool? allowPhoneNumberAccess,
    TonConnectConnectData? tonConnectConnectData,
  }) =>
      AcceptOauthRequest(
        url: url ?? this.url,
        matchCode: matchCode ?? this.matchCode,
        allowWriteAccess: allowWriteAccess ?? this.allowWriteAccess,
        allowPhoneNumberAccess:
            allowPhoneNumberAccess ?? this.allowPhoneNumberAccess,
        tonConnectConnectData:
            tonConnectConnectData ?? this.tonConnectConnectData,
      );

  /// TDLib object type
  static const String defaultObjectId = 'acceptOauthRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
