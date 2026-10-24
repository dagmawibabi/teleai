part of '../tdapi.dart';

/// **TonConnectManifest** *(tonConnectManifest)* - parent
///
/// Describes manifest of the dApp that is being connected using TON Connect.
sealed class TonConnectManifest extends TdObject {
  /// **TonConnectManifest** *(tonConnectManifest)* - parent
  ///
  /// Describes manifest of the dApp that is being connected using TON Connect.
  const TonConnectManifest();

  /// a TonConnectManifest return type can be :
  /// * [TonConnectManifestPending]
  /// * [TonConnectManifestInfo]
  /// * [TonConnectManifestFailed]
  /// * [TonConnectManifestInvalid]
  factory TonConnectManifest.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonConnectManifestPending.defaultObjectId:
        return TonConnectManifestPending.fromJson(json);
      case TonConnectManifestInfo.defaultObjectId:
        return TonConnectManifestInfo.fromJson(json);
      case TonConnectManifestFailed.defaultObjectId:
        return TonConnectManifestFailed.fromJson(json);
      case TonConnectManifestInvalid.defaultObjectId:
        return TonConnectManifestInvalid.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonConnectManifest)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonConnectManifest copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectManifest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectManifestPending** *(tonConnectManifestPending)* - child of TonConnectManifest
///
/// The manifest is being downloaded.
final class TonConnectManifestPending extends TonConnectManifest {
  /// **TonConnectManifestPending** *(tonConnectManifestPending)* - child of TonConnectManifest
  ///
  /// The manifest is being downloaded.
  const TonConnectManifestPending();

  /// Parse from a json
  factory TonConnectManifestPending.fromJson(Map<String, dynamic> json) =>
      const TonConnectManifestPending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectManifestPending copyWith() => const TonConnectManifestPending();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectManifestPending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectManifestInfo** *(tonConnectManifestInfo)* - child of TonConnectManifest
///
/// The manifest is available.
///
/// * [url]: URL of the dApp.
/// * [name]: Name of the dApp.
/// * [icon]: App icon in PNG or ICO format.
final class TonConnectManifestInfo extends TonConnectManifest {
  /// **TonConnectManifestInfo** *(tonConnectManifestInfo)* - child of TonConnectManifest
  ///
  /// The manifest is available.
  ///
  /// * [url]: URL of the dApp.
  /// * [name]: Name of the dApp.
  /// * [icon]: App icon in PNG or ICO format.
  const TonConnectManifestInfo({
    required this.url,
    required this.name,
    required this.icon,
  });

  /// URL of the dApp
  final String url;

  /// Name of the dApp
  final String name;

  /// App icon in PNG or ICO format
  final Document icon;

  /// Parse from a json
  factory TonConnectManifestInfo.fromJson(Map<String, dynamic> json) =>
      TonConnectManifestInfo(
        url: json['url'],
        name: json['name'],
        icon: Document.fromJson(json['icon']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "name": name,
      "icon": icon.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the dApp
  /// * [name]: Name of the dApp
  /// * [icon]: App icon in PNG or ICO format
  @override
  TonConnectManifestInfo copyWith({
    String? url,
    String? name,
    Document? icon,
  }) =>
      TonConnectManifestInfo(
        url: url ?? this.url,
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectManifestInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectManifestFailed** *(tonConnectManifestFailed)* - child of TonConnectManifest
///
/// The manifest has failed to download.
final class TonConnectManifestFailed extends TonConnectManifest {
  /// **TonConnectManifestFailed** *(tonConnectManifestFailed)* - child of TonConnectManifest
  ///
  /// The manifest has failed to download.
  const TonConnectManifestFailed();

  /// Parse from a json
  factory TonConnectManifestFailed.fromJson(Map<String, dynamic> json) =>
      const TonConnectManifestFailed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectManifestFailed copyWith() => const TonConnectManifestFailed();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectManifestFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectManifestInvalid** *(tonConnectManifestInvalid)* - child of TonConnectManifest
///
/// The manifest is invalid.
final class TonConnectManifestInvalid extends TonConnectManifest {
  /// **TonConnectManifestInvalid** *(tonConnectManifestInvalid)* - child of TonConnectManifest
  ///
  /// The manifest is invalid.
  const TonConnectManifestInvalid();

  /// Parse from a json
  factory TonConnectManifestInvalid.fromJson(Map<String, dynamic> json) =>
      const TonConnectManifestInvalid();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectManifestInvalid copyWith() => const TonConnectManifestInvalid();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectManifestInvalid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
