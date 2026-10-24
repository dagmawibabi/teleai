part of '../tdapi.dart';

/// **ReportReason** *(reportReason)* - parent
///
/// Describes the reason why a chat is reported.
sealed class ReportReason extends TdObject {
  /// **ReportReason** *(reportReason)* - parent
  ///
  /// Describes the reason why a chat is reported.
  const ReportReason();

  /// a ReportReason return type can be :
  /// * [ReportReasonSpam]
  /// * [ReportReasonViolence]
  /// * [ReportReasonPornography]
  /// * [ReportReasonChildAbuse]
  /// * [ReportReasonCopyright]
  /// * [ReportReasonUnrelatedLocation]
  /// * [ReportReasonFake]
  /// * [ReportReasonIllegalDrugs]
  /// * [ReportReasonPersonalDetails]
  /// * [ReportReasonCustom]
  factory ReportReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReportReasonSpam.defaultObjectId:
        return ReportReasonSpam.fromJson(json);
      case ReportReasonViolence.defaultObjectId:
        return ReportReasonViolence.fromJson(json);
      case ReportReasonPornography.defaultObjectId:
        return ReportReasonPornography.fromJson(json);
      case ReportReasonChildAbuse.defaultObjectId:
        return ReportReasonChildAbuse.fromJson(json);
      case ReportReasonCopyright.defaultObjectId:
        return ReportReasonCopyright.fromJson(json);
      case ReportReasonUnrelatedLocation.defaultObjectId:
        return ReportReasonUnrelatedLocation.fromJson(json);
      case ReportReasonFake.defaultObjectId:
        return ReportReasonFake.fromJson(json);
      case ReportReasonIllegalDrugs.defaultObjectId:
        return ReportReasonIllegalDrugs.fromJson(json);
      case ReportReasonPersonalDetails.defaultObjectId:
        return ReportReasonPersonalDetails.fromJson(json);
      case ReportReasonCustom.defaultObjectId:
        return ReportReasonCustom.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReportReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReportReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reportReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonSpam** *(reportReasonSpam)* - child of ReportReason
///
/// The chat contains spam messages.
final class ReportReasonSpam extends ReportReason {
  /// **ReportReasonSpam** *(reportReasonSpam)* - child of ReportReason
  ///
  /// The chat contains spam messages.
  const ReportReasonSpam();

  /// Parse from a json
  factory ReportReasonSpam.fromJson(Map<String, dynamic> json) =>
      const ReportReasonSpam();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonSpam copyWith() => const ReportReasonSpam();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonSpam';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonViolence** *(reportReasonViolence)* - child of ReportReason
///
/// The chat promotes violence.
final class ReportReasonViolence extends ReportReason {
  /// **ReportReasonViolence** *(reportReasonViolence)* - child of ReportReason
  ///
  /// The chat promotes violence.
  const ReportReasonViolence();

  /// Parse from a json
  factory ReportReasonViolence.fromJson(Map<String, dynamic> json) =>
      const ReportReasonViolence();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonViolence copyWith() => const ReportReasonViolence();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonViolence';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonPornography** *(reportReasonPornography)* - child of ReportReason
///
/// The chat contains pornographic messages.
final class ReportReasonPornography extends ReportReason {
  /// **ReportReasonPornography** *(reportReasonPornography)* - child of ReportReason
  ///
  /// The chat contains pornographic messages.
  const ReportReasonPornography();

  /// Parse from a json
  factory ReportReasonPornography.fromJson(Map<String, dynamic> json) =>
      const ReportReasonPornography();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonPornography copyWith() => const ReportReasonPornography();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonPornography';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonChildAbuse** *(reportReasonChildAbuse)* - child of ReportReason
///
/// The chat has child abuse related content.
final class ReportReasonChildAbuse extends ReportReason {
  /// **ReportReasonChildAbuse** *(reportReasonChildAbuse)* - child of ReportReason
  ///
  /// The chat has child abuse related content.
  const ReportReasonChildAbuse();

  /// Parse from a json
  factory ReportReasonChildAbuse.fromJson(Map<String, dynamic> json) =>
      const ReportReasonChildAbuse();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonChildAbuse copyWith() => const ReportReasonChildAbuse();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonChildAbuse';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonCopyright** *(reportReasonCopyright)* - child of ReportReason
///
/// The chat contains copyrighted content.
final class ReportReasonCopyright extends ReportReason {
  /// **ReportReasonCopyright** *(reportReasonCopyright)* - child of ReportReason
  ///
  /// The chat contains copyrighted content.
  const ReportReasonCopyright();

  /// Parse from a json
  factory ReportReasonCopyright.fromJson(Map<String, dynamic> json) =>
      const ReportReasonCopyright();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonCopyright copyWith() => const ReportReasonCopyright();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonCopyright';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonUnrelatedLocation** *(reportReasonUnrelatedLocation)* - child of ReportReason
///
/// The location-based chat is unrelated to its stated location.
final class ReportReasonUnrelatedLocation extends ReportReason {
  /// **ReportReasonUnrelatedLocation** *(reportReasonUnrelatedLocation)* - child of ReportReason
  ///
  /// The location-based chat is unrelated to its stated location.
  const ReportReasonUnrelatedLocation();

  /// Parse from a json
  factory ReportReasonUnrelatedLocation.fromJson(Map<String, dynamic> json) =>
      const ReportReasonUnrelatedLocation();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonUnrelatedLocation copyWith() =>
      const ReportReasonUnrelatedLocation();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonUnrelatedLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonFake** *(reportReasonFake)* - child of ReportReason
///
/// The chat represents a fake account.
final class ReportReasonFake extends ReportReason {
  /// **ReportReasonFake** *(reportReasonFake)* - child of ReportReason
  ///
  /// The chat represents a fake account.
  const ReportReasonFake();

  /// Parse from a json
  factory ReportReasonFake.fromJson(Map<String, dynamic> json) =>
      const ReportReasonFake();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonFake copyWith() => const ReportReasonFake();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonFake';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonIllegalDrugs** *(reportReasonIllegalDrugs)* - child of ReportReason
///
/// The chat has illegal drugs related content.
final class ReportReasonIllegalDrugs extends ReportReason {
  /// **ReportReasonIllegalDrugs** *(reportReasonIllegalDrugs)* - child of ReportReason
  ///
  /// The chat has illegal drugs related content.
  const ReportReasonIllegalDrugs();

  /// Parse from a json
  factory ReportReasonIllegalDrugs.fromJson(Map<String, dynamic> json) =>
      const ReportReasonIllegalDrugs();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonIllegalDrugs copyWith() => const ReportReasonIllegalDrugs();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonIllegalDrugs';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonPersonalDetails** *(reportReasonPersonalDetails)* - child of ReportReason
///
/// The chat contains messages with personal details.
final class ReportReasonPersonalDetails extends ReportReason {
  /// **ReportReasonPersonalDetails** *(reportReasonPersonalDetails)* - child of ReportReason
  ///
  /// The chat contains messages with personal details.
  const ReportReasonPersonalDetails();

  /// Parse from a json
  factory ReportReasonPersonalDetails.fromJson(Map<String, dynamic> json) =>
      const ReportReasonPersonalDetails();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonPersonalDetails copyWith() => const ReportReasonPersonalDetails();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonPersonalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReportReasonCustom** *(reportReasonCustom)* - child of ReportReason
///
/// A custom reason provided by the user.
final class ReportReasonCustom extends ReportReason {
  /// **ReportReasonCustom** *(reportReasonCustom)* - child of ReportReason
  ///
  /// A custom reason provided by the user.
  const ReportReasonCustom();

  /// Parse from a json
  factory ReportReasonCustom.fromJson(Map<String, dynamic> json) =>
      const ReportReasonCustom();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReportReasonCustom copyWith() => const ReportReasonCustom();

  /// TDLib object type
  static const String defaultObjectId = 'reportReasonCustom';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
