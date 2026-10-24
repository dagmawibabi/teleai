part of '../tdapi.dart';

/// **SessionDeviceType** *(sessionDeviceType)* - parent
///
/// Represents the type of device from which session was created.
sealed class SessionDeviceType extends TdObject {
  /// **SessionDeviceType** *(sessionDeviceType)* - parent
  ///
  /// Represents the type of device from which session was created.
  const SessionDeviceType();

  /// a SessionDeviceType return type can be :
  /// * [SessionDeviceTypeAndroid]
  /// * [SessionDeviceTypeApple]
  /// * [SessionDeviceTypeBrave]
  /// * [SessionDeviceTypeChrome]
  /// * [SessionDeviceTypeEdge]
  /// * [SessionDeviceTypeFirefox]
  /// * [SessionDeviceTypeIpad]
  /// * [SessionDeviceTypeIphone]
  /// * [SessionDeviceTypeLinux]
  /// * [SessionDeviceTypeMac]
  /// * [SessionDeviceTypeOpera]
  /// * [SessionDeviceTypeSafari]
  /// * [SessionDeviceTypeUbuntu]
  /// * [SessionDeviceTypeUnknown]
  /// * [SessionDeviceTypeVivaldi]
  /// * [SessionDeviceTypeWindows]
  /// * [SessionDeviceTypeXbox]
  factory SessionDeviceType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SessionDeviceTypeAndroid.defaultObjectId:
        return SessionDeviceTypeAndroid.fromJson(json);
      case SessionDeviceTypeApple.defaultObjectId:
        return SessionDeviceTypeApple.fromJson(json);
      case SessionDeviceTypeBrave.defaultObjectId:
        return SessionDeviceTypeBrave.fromJson(json);
      case SessionDeviceTypeChrome.defaultObjectId:
        return SessionDeviceTypeChrome.fromJson(json);
      case SessionDeviceTypeEdge.defaultObjectId:
        return SessionDeviceTypeEdge.fromJson(json);
      case SessionDeviceTypeFirefox.defaultObjectId:
        return SessionDeviceTypeFirefox.fromJson(json);
      case SessionDeviceTypeIpad.defaultObjectId:
        return SessionDeviceTypeIpad.fromJson(json);
      case SessionDeviceTypeIphone.defaultObjectId:
        return SessionDeviceTypeIphone.fromJson(json);
      case SessionDeviceTypeLinux.defaultObjectId:
        return SessionDeviceTypeLinux.fromJson(json);
      case SessionDeviceTypeMac.defaultObjectId:
        return SessionDeviceTypeMac.fromJson(json);
      case SessionDeviceTypeOpera.defaultObjectId:
        return SessionDeviceTypeOpera.fromJson(json);
      case SessionDeviceTypeSafari.defaultObjectId:
        return SessionDeviceTypeSafari.fromJson(json);
      case SessionDeviceTypeUbuntu.defaultObjectId:
        return SessionDeviceTypeUbuntu.fromJson(json);
      case SessionDeviceTypeUnknown.defaultObjectId:
        return SessionDeviceTypeUnknown.fromJson(json);
      case SessionDeviceTypeVivaldi.defaultObjectId:
        return SessionDeviceTypeVivaldi.fromJson(json);
      case SessionDeviceTypeWindows.defaultObjectId:
        return SessionDeviceTypeWindows.fromJson(json);
      case SessionDeviceTypeXbox.defaultObjectId:
        return SessionDeviceTypeXbox.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SessionDeviceType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SessionDeviceType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeAndroid** *(sessionDeviceTypeAndroid)* - child of SessionDeviceType
///
/// The session is running on an Android device.
final class SessionDeviceTypeAndroid extends SessionDeviceType {
  /// **SessionDeviceTypeAndroid** *(sessionDeviceTypeAndroid)* - child of SessionDeviceType
  ///
  /// The session is running on an Android device.
  const SessionDeviceTypeAndroid();

  /// Parse from a json
  factory SessionDeviceTypeAndroid.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeAndroid();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeAndroid copyWith() => const SessionDeviceTypeAndroid();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeAndroid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeApple** *(sessionDeviceTypeApple)* - child of SessionDeviceType
///
/// The session is running on a generic Apple device.
final class SessionDeviceTypeApple extends SessionDeviceType {
  /// **SessionDeviceTypeApple** *(sessionDeviceTypeApple)* - child of SessionDeviceType
  ///
  /// The session is running on a generic Apple device.
  const SessionDeviceTypeApple();

  /// Parse from a json
  factory SessionDeviceTypeApple.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeApple();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeApple copyWith() => const SessionDeviceTypeApple();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeApple';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeBrave** *(sessionDeviceTypeBrave)* - child of SessionDeviceType
///
/// The session is running on the Brave browser.
final class SessionDeviceTypeBrave extends SessionDeviceType {
  /// **SessionDeviceTypeBrave** *(sessionDeviceTypeBrave)* - child of SessionDeviceType
  ///
  /// The session is running on the Brave browser.
  const SessionDeviceTypeBrave();

  /// Parse from a json
  factory SessionDeviceTypeBrave.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeBrave();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeBrave copyWith() => const SessionDeviceTypeBrave();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeBrave';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeChrome** *(sessionDeviceTypeChrome)* - child of SessionDeviceType
///
/// The session is running on the Chrome browser.
final class SessionDeviceTypeChrome extends SessionDeviceType {
  /// **SessionDeviceTypeChrome** *(sessionDeviceTypeChrome)* - child of SessionDeviceType
  ///
  /// The session is running on the Chrome browser.
  const SessionDeviceTypeChrome();

  /// Parse from a json
  factory SessionDeviceTypeChrome.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeChrome();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeChrome copyWith() => const SessionDeviceTypeChrome();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeChrome';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeEdge** *(sessionDeviceTypeEdge)* - child of SessionDeviceType
///
/// The session is running on the Edge browser.
final class SessionDeviceTypeEdge extends SessionDeviceType {
  /// **SessionDeviceTypeEdge** *(sessionDeviceTypeEdge)* - child of SessionDeviceType
  ///
  /// The session is running on the Edge browser.
  const SessionDeviceTypeEdge();

  /// Parse from a json
  factory SessionDeviceTypeEdge.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeEdge();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeEdge copyWith() => const SessionDeviceTypeEdge();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeEdge';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeFirefox** *(sessionDeviceTypeFirefox)* - child of SessionDeviceType
///
/// The session is running on the Firefox browser.
final class SessionDeviceTypeFirefox extends SessionDeviceType {
  /// **SessionDeviceTypeFirefox** *(sessionDeviceTypeFirefox)* - child of SessionDeviceType
  ///
  /// The session is running on the Firefox browser.
  const SessionDeviceTypeFirefox();

  /// Parse from a json
  factory SessionDeviceTypeFirefox.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeFirefox();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeFirefox copyWith() => const SessionDeviceTypeFirefox();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeFirefox';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeIpad** *(sessionDeviceTypeIpad)* - child of SessionDeviceType
///
/// The session is running on an iPad device.
final class SessionDeviceTypeIpad extends SessionDeviceType {
  /// **SessionDeviceTypeIpad** *(sessionDeviceTypeIpad)* - child of SessionDeviceType
  ///
  /// The session is running on an iPad device.
  const SessionDeviceTypeIpad();

  /// Parse from a json
  factory SessionDeviceTypeIpad.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeIpad();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeIpad copyWith() => const SessionDeviceTypeIpad();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeIpad';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeIphone** *(sessionDeviceTypeIphone)* - child of SessionDeviceType
///
/// The session is running on an iPhone device.
final class SessionDeviceTypeIphone extends SessionDeviceType {
  /// **SessionDeviceTypeIphone** *(sessionDeviceTypeIphone)* - child of SessionDeviceType
  ///
  /// The session is running on an iPhone device.
  const SessionDeviceTypeIphone();

  /// Parse from a json
  factory SessionDeviceTypeIphone.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeIphone();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeIphone copyWith() => const SessionDeviceTypeIphone();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeIphone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeLinux** *(sessionDeviceTypeLinux)* - child of SessionDeviceType
///
/// The session is running on a Linux device.
final class SessionDeviceTypeLinux extends SessionDeviceType {
  /// **SessionDeviceTypeLinux** *(sessionDeviceTypeLinux)* - child of SessionDeviceType
  ///
  /// The session is running on a Linux device.
  const SessionDeviceTypeLinux();

  /// Parse from a json
  factory SessionDeviceTypeLinux.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeLinux();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeLinux copyWith() => const SessionDeviceTypeLinux();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeLinux';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeMac** *(sessionDeviceTypeMac)* - child of SessionDeviceType
///
/// The session is running on a Mac device.
final class SessionDeviceTypeMac extends SessionDeviceType {
  /// **SessionDeviceTypeMac** *(sessionDeviceTypeMac)* - child of SessionDeviceType
  ///
  /// The session is running on a Mac device.
  const SessionDeviceTypeMac();

  /// Parse from a json
  factory SessionDeviceTypeMac.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeMac();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeMac copyWith() => const SessionDeviceTypeMac();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeMac';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeOpera** *(sessionDeviceTypeOpera)* - child of SessionDeviceType
///
/// The session is running on the Opera browser.
final class SessionDeviceTypeOpera extends SessionDeviceType {
  /// **SessionDeviceTypeOpera** *(sessionDeviceTypeOpera)* - child of SessionDeviceType
  ///
  /// The session is running on the Opera browser.
  const SessionDeviceTypeOpera();

  /// Parse from a json
  factory SessionDeviceTypeOpera.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeOpera();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeOpera copyWith() => const SessionDeviceTypeOpera();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeOpera';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeSafari** *(sessionDeviceTypeSafari)* - child of SessionDeviceType
///
/// The session is running on the Safari browser.
final class SessionDeviceTypeSafari extends SessionDeviceType {
  /// **SessionDeviceTypeSafari** *(sessionDeviceTypeSafari)* - child of SessionDeviceType
  ///
  /// The session is running on the Safari browser.
  const SessionDeviceTypeSafari();

  /// Parse from a json
  factory SessionDeviceTypeSafari.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeSafari();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeSafari copyWith() => const SessionDeviceTypeSafari();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeSafari';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeUbuntu** *(sessionDeviceTypeUbuntu)* - child of SessionDeviceType
///
/// The session is running on an Ubuntu device.
final class SessionDeviceTypeUbuntu extends SessionDeviceType {
  /// **SessionDeviceTypeUbuntu** *(sessionDeviceTypeUbuntu)* - child of SessionDeviceType
  ///
  /// The session is running on an Ubuntu device.
  const SessionDeviceTypeUbuntu();

  /// Parse from a json
  factory SessionDeviceTypeUbuntu.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeUbuntu();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeUbuntu copyWith() => const SessionDeviceTypeUbuntu();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeUbuntu';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeUnknown** *(sessionDeviceTypeUnknown)* - child of SessionDeviceType
///
/// The session is running on an unknown type of device.
final class SessionDeviceTypeUnknown extends SessionDeviceType {
  /// **SessionDeviceTypeUnknown** *(sessionDeviceTypeUnknown)* - child of SessionDeviceType
  ///
  /// The session is running on an unknown type of device.
  const SessionDeviceTypeUnknown();

  /// Parse from a json
  factory SessionDeviceTypeUnknown.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeUnknown();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeUnknown copyWith() => const SessionDeviceTypeUnknown();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeUnknown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeVivaldi** *(sessionDeviceTypeVivaldi)* - child of SessionDeviceType
///
/// The session is running on the Vivaldi browser.
final class SessionDeviceTypeVivaldi extends SessionDeviceType {
  /// **SessionDeviceTypeVivaldi** *(sessionDeviceTypeVivaldi)* - child of SessionDeviceType
  ///
  /// The session is running on the Vivaldi browser.
  const SessionDeviceTypeVivaldi();

  /// Parse from a json
  factory SessionDeviceTypeVivaldi.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeVivaldi();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeVivaldi copyWith() => const SessionDeviceTypeVivaldi();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeVivaldi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeWindows** *(sessionDeviceTypeWindows)* - child of SessionDeviceType
///
/// The session is running on a Windows device.
final class SessionDeviceTypeWindows extends SessionDeviceType {
  /// **SessionDeviceTypeWindows** *(sessionDeviceTypeWindows)* - child of SessionDeviceType
  ///
  /// The session is running on a Windows device.
  const SessionDeviceTypeWindows();

  /// Parse from a json
  factory SessionDeviceTypeWindows.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeWindows();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeWindows copyWith() => const SessionDeviceTypeWindows();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeWindows';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionDeviceTypeXbox** *(sessionDeviceTypeXbox)* - child of SessionDeviceType
///
/// The session is running on an Xbox console.
final class SessionDeviceTypeXbox extends SessionDeviceType {
  /// **SessionDeviceTypeXbox** *(sessionDeviceTypeXbox)* - child of SessionDeviceType
  ///
  /// The session is running on an Xbox console.
  const SessionDeviceTypeXbox();

  /// Parse from a json
  factory SessionDeviceTypeXbox.fromJson(Map<String, dynamic> json) =>
      const SessionDeviceTypeXbox();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SessionDeviceTypeXbox copyWith() => const SessionDeviceTypeXbox();

  /// TDLib object type
  static const String defaultObjectId = 'sessionDeviceTypeXbox';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
