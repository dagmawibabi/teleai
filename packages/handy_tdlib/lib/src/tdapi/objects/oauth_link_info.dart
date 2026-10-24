part of '../tdapi.dart';

/// **OauthLinkInfo** *(oauthLinkInfo)* - basic class
///
/// Information about the OAuth authorization.
///
/// * [userId]: Identifier of the user for which the link was generated; may be 0 if unknown. The corresponding user may be unknown.. If the user is logged in the application, then they must be chosen for authorization by default.
/// * [url]: An HTTP URL where the user authorizes.
/// * [domain]: A domain of the URL.
/// * [fromApp]: True, if the authorization originates from an application.
/// * [verifiedAppName]: Verified name of the application; if empty, then "Unverified App" must be shown instead.
/// * [botUserId]: User identifier of a bot linked with the website.
/// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
/// * [requestPhoneNumberAccess]: True, if the user must be asked for the permission to share their phone number.
/// * [requestTonWalletAccess]: True, if access to the user's TON wallet is requested by the app. If true and the user agrees to give access, then use createTonConnectSession. with dapp_client_id and ton_connect_manifest_url to create the TON Connect session, then setTonConnectSessionWalletClientId, then create a tonWalletOwnershipProof. for the given domain with the payload ton_proof_payload, and then pass all data to acceptOauthRequest in the parameter ton_connect_connect_data.
/// * [dappClientId]: Hex-encoded public X25519 key of the dApp; may be empty if TON wallet access wasn't requested.
/// * [tonConnectManifestUrl]: URL of the TON Connect manifest of the dApp; may be empty if TON wallet access wasn't requested.
/// * [tonProofPayload]: Payload for TON wallet ownership proof; may be empty if TON wallet access wasn't requested.
/// * [browser]: The version of a browser used for the authorization.
/// * [platform]: Operating system the browser is running on.
/// * [ipAddress]: IP address from which the authorization is performed, in human-readable format.
/// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address.
/// * [matchCodeFirst]: True, if code matching dialog must be shown first and checkOauthRequestMatchCode must be called before acceptOauthRequest. Otherwise, checkOauthRequestMatchCode must not be called.
/// * [matchCodes]: The list of codes to match; may be empty if irrelevant.
final class OauthLinkInfo extends TdObject {
  /// **OauthLinkInfo** *(oauthLinkInfo)* - basic class
  ///
  /// Information about the OAuth authorization.
  ///
  /// * [userId]: Identifier of the user for which the link was generated; may be 0 if unknown. The corresponding user may be unknown.. If the user is logged in the application, then they must be chosen for authorization by default.
  /// * [url]: An HTTP URL where the user authorizes.
  /// * [domain]: A domain of the URL.
  /// * [fromApp]: True, if the authorization originates from an application.
  /// * [verifiedAppName]: Verified name of the application; if empty, then "Unverified App" must be shown instead.
  /// * [botUserId]: User identifier of a bot linked with the website.
  /// * [requestWriteAccess]: True, if the user must be asked for the permission to the bot to send them messages.
  /// * [requestPhoneNumberAccess]: True, if the user must be asked for the permission to share their phone number.
  /// * [requestTonWalletAccess]: True, if access to the user's TON wallet is requested by the app. If true and the user agrees to give access, then use createTonConnectSession. with dapp_client_id and ton_connect_manifest_url to create the TON Connect session, then setTonConnectSessionWalletClientId, then create a tonWalletOwnershipProof. for the given domain with the payload ton_proof_payload, and then pass all data to acceptOauthRequest in the parameter ton_connect_connect_data.
  /// * [dappClientId]: Hex-encoded public X25519 key of the dApp; may be empty if TON wallet access wasn't requested.
  /// * [tonConnectManifestUrl]: URL of the TON Connect manifest of the dApp; may be empty if TON wallet access wasn't requested.
  /// * [tonProofPayload]: Payload for TON wallet ownership proof; may be empty if TON wallet access wasn't requested.
  /// * [browser]: The version of a browser used for the authorization.
  /// * [platform]: Operating system the browser is running on.
  /// * [ipAddress]: IP address from which the authorization is performed, in human-readable format.
  /// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address.
  /// * [matchCodeFirst]: True, if code matching dialog must be shown first and checkOauthRequestMatchCode must be called before acceptOauthRequest. Otherwise, checkOauthRequestMatchCode must not be called.
  /// * [matchCodes]: The list of codes to match; may be empty if irrelevant.
  const OauthLinkInfo({
    required this.userId,
    required this.url,
    required this.domain,
    required this.fromApp,
    required this.verifiedAppName,
    required this.botUserId,
    required this.requestWriteAccess,
    required this.requestPhoneNumberAccess,
    required this.requestTonWalletAccess,
    required this.dappClientId,
    required this.tonConnectManifestUrl,
    required this.tonProofPayload,
    required this.browser,
    required this.platform,
    required this.ipAddress,
    required this.location,
    required this.matchCodeFirst,
    required this.matchCodes,
    this.extra,
    this.clientId,
  });

  /// Identifier of the user for which the link was generated; may be 0 if unknown. The corresponding user may be unknown.. If the user is logged in the application, then they must be chosen for authorization by default
  final int userId;

  /// An HTTP URL where the user authorizes
  final String url;

  /// A domain of the URL
  final String domain;

  /// True, if the authorization originates from an application
  final bool fromApp;

  /// Verified name of the application; if empty, then "Unverified App" must be shown instead
  final String verifiedAppName;

  /// User identifier of a bot linked with the website
  final int botUserId;

  /// True, if the user must be asked for the permission to the bot to send them messages
  final bool requestWriteAccess;

  /// True, if the user must be asked for the permission to share their phone number
  final bool requestPhoneNumberAccess;

  /// True, if access to the user's TON wallet is requested by the app. If true and the user agrees to give access, then use createTonConnectSession. with dapp_client_id and ton_connect_manifest_url to create the TON Connect session, then setTonConnectSessionWalletClientId, then create a tonWalletOwnershipProof. for the given domain with the payload ton_proof_payload, and then pass all data to acceptOauthRequest in the parameter ton_connect_connect_data
  final bool requestTonWalletAccess;

  /// Hex-encoded public X25519 key of the dApp; may be empty if TON wallet access wasn't requested
  final String dappClientId;

  /// URL of the TON Connect manifest of the dApp; may be empty if TON wallet access wasn't requested
  final String tonConnectManifestUrl;

  /// Payload for TON wallet ownership proof; may be empty if TON wallet access wasn't requested
  final String tonProofPayload;

  /// The version of a browser used for the authorization
  final String browser;

  /// Operating system the browser is running on
  final String platform;

  /// IP address from which the authorization is performed, in human-readable format
  final String ipAddress;

  /// Human-readable description of a country and a region from which the authorization is performed, based on the IP address
  final String location;

  /// True, if code matching dialog must be shown first and checkOauthRequestMatchCode must be called before acceptOauthRequest. Otherwise, checkOauthRequestMatchCode must not be called
  final bool matchCodeFirst;

  /// The list of codes to match; may be empty if irrelevant
  final List<String> matchCodes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OauthLinkInfo.fromJson(Map<String, dynamic> json) => OauthLinkInfo(
        userId: json['user_id'],
        url: json['url'],
        domain: json['domain'],
        fromApp: json['from_app'],
        verifiedAppName: json['verified_app_name'],
        botUserId: json['bot_user_id'],
        requestWriteAccess: json['request_write_access'],
        requestPhoneNumberAccess: json['request_phone_number_access'],
        requestTonWalletAccess: json['request_ton_wallet_access'],
        dappClientId: json['dapp_client_id'],
        tonConnectManifestUrl: json['ton_connect_manifest_url'],
        tonProofPayload: json['ton_proof_payload'],
        browser: json['browser'],
        platform: json['platform'],
        ipAddress: json['ip_address'],
        location: json['location'],
        matchCodeFirst: json['match_code_first'],
        matchCodes: List<String>.from(
            (json['match_codes'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "url": url,
      "domain": domain,
      "from_app": fromApp,
      "verified_app_name": verifiedAppName,
      "bot_user_id": botUserId,
      "request_write_access": requestWriteAccess,
      "request_phone_number_access": requestPhoneNumberAccess,
      "request_ton_wallet_access": requestTonWalletAccess,
      "dapp_client_id": dappClientId,
      "ton_connect_manifest_url": tonConnectManifestUrl,
      "ton_proof_payload": tonProofPayload,
      "browser": browser,
      "platform": platform,
      "ip_address": ipAddress,
      "location": location,
      "match_code_first": matchCodeFirst,
      "match_codes": matchCodes.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user for which the link was generated; may be 0 if unknown. The corresponding user may be unknown.. If the user is logged in the application, then they must be chosen for authorization by default
  /// * [url]: An HTTP URL where the user authorizes
  /// * [domain]: A domain of the URL
  /// * [from_app]: True, if the authorization originates from an application
  /// * [verified_app_name]: Verified name of the application; if empty, then "Unverified App" must be shown instead
  /// * [bot_user_id]: User identifier of a bot linked with the website
  /// * [request_write_access]: True, if the user must be asked for the permission to the bot to send them messages
  /// * [request_phone_number_access]: True, if the user must be asked for the permission to share their phone number
  /// * [request_ton_wallet_access]: True, if access to the user's TON wallet is requested by the app. If true and the user agrees to give access, then use createTonConnectSession. with dapp_client_id and ton_connect_manifest_url to create the TON Connect session, then setTonConnectSessionWalletClientId, then create a tonWalletOwnershipProof. for the given domain with the payload ton_proof_payload, and then pass all data to acceptOauthRequest in the parameter ton_connect_connect_data
  /// * [dapp_client_id]: Hex-encoded public X25519 key of the dApp; may be empty if TON wallet access wasn't requested
  /// * [ton_connect_manifest_url]: URL of the TON Connect manifest of the dApp; may be empty if TON wallet access wasn't requested
  /// * [ton_proof_payload]: Payload for TON wallet ownership proof; may be empty if TON wallet access wasn't requested
  /// * [browser]: The version of a browser used for the authorization
  /// * [platform]: Operating system the browser is running on
  /// * [ip_address]: IP address from which the authorization is performed, in human-readable format
  /// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address
  /// * [match_code_first]: True, if code matching dialog must be shown first and checkOauthRequestMatchCode must be called before acceptOauthRequest. Otherwise, checkOauthRequestMatchCode must not be called
  /// * [match_codes]: The list of codes to match; may be empty if irrelevant
  OauthLinkInfo copyWith({
    int? userId,
    String? url,
    String? domain,
    bool? fromApp,
    String? verifiedAppName,
    int? botUserId,
    bool? requestWriteAccess,
    bool? requestPhoneNumberAccess,
    bool? requestTonWalletAccess,
    String? dappClientId,
    String? tonConnectManifestUrl,
    String? tonProofPayload,
    String? browser,
    String? platform,
    String? ipAddress,
    String? location,
    bool? matchCodeFirst,
    List<String>? matchCodes,
    dynamic extra,
    int? clientId,
  }) =>
      OauthLinkInfo(
        userId: userId ?? this.userId,
        url: url ?? this.url,
        domain: domain ?? this.domain,
        fromApp: fromApp ?? this.fromApp,
        verifiedAppName: verifiedAppName ?? this.verifiedAppName,
        botUserId: botUserId ?? this.botUserId,
        requestWriteAccess: requestWriteAccess ?? this.requestWriteAccess,
        requestPhoneNumberAccess:
            requestPhoneNumberAccess ?? this.requestPhoneNumberAccess,
        requestTonWalletAccess:
            requestTonWalletAccess ?? this.requestTonWalletAccess,
        dappClientId: dappClientId ?? this.dappClientId,
        tonConnectManifestUrl:
            tonConnectManifestUrl ?? this.tonConnectManifestUrl,
        tonProofPayload: tonProofPayload ?? this.tonProofPayload,
        browser: browser ?? this.browser,
        platform: platform ?? this.platform,
        ipAddress: ipAddress ?? this.ipAddress,
        location: location ?? this.location,
        matchCodeFirst: matchCodeFirst ?? this.matchCodeFirst,
        matchCodes: matchCodes ?? this.matchCodes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'oauthLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
