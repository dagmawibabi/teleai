part of '../tdapi.dart';

/// **MaskPoint** *(maskPoint)* - parent
///
/// Part of the face, relative to which a mask is placed.
sealed class MaskPoint extends TdObject {
  /// **MaskPoint** *(maskPoint)* - parent
  ///
  /// Part of the face, relative to which a mask is placed.
  const MaskPoint();

  /// a MaskPoint return type can be :
  /// * [MaskPointForehead]
  /// * [MaskPointEyes]
  /// * [MaskPointMouth]
  /// * [MaskPointChin]
  factory MaskPoint.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MaskPointForehead.defaultObjectId:
        return MaskPointForehead.fromJson(json);
      case MaskPointEyes.defaultObjectId:
        return MaskPointEyes.fromJson(json);
      case MaskPointMouth.defaultObjectId:
        return MaskPointMouth.fromJson(json);
      case MaskPointChin.defaultObjectId:
        return MaskPointChin.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MaskPoint)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MaskPoint copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'maskPoint';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MaskPointForehead** *(maskPointForehead)* - child of MaskPoint
///
/// The mask is placed relatively to the forehead.
final class MaskPointForehead extends MaskPoint {
  /// **MaskPointForehead** *(maskPointForehead)* - child of MaskPoint
  ///
  /// The mask is placed relatively to the forehead.
  const MaskPointForehead();

  /// Parse from a json
  factory MaskPointForehead.fromJson(Map<String, dynamic> json) =>
      const MaskPointForehead();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MaskPointForehead copyWith() => const MaskPointForehead();

  /// TDLib object type
  static const String defaultObjectId = 'maskPointForehead';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MaskPointEyes** *(maskPointEyes)* - child of MaskPoint
///
/// The mask is placed relatively to the eyes.
final class MaskPointEyes extends MaskPoint {
  /// **MaskPointEyes** *(maskPointEyes)* - child of MaskPoint
  ///
  /// The mask is placed relatively to the eyes.
  const MaskPointEyes();

  /// Parse from a json
  factory MaskPointEyes.fromJson(Map<String, dynamic> json) =>
      const MaskPointEyes();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MaskPointEyes copyWith() => const MaskPointEyes();

  /// TDLib object type
  static const String defaultObjectId = 'maskPointEyes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MaskPointMouth** *(maskPointMouth)* - child of MaskPoint
///
/// The mask is placed relatively to the mouth.
final class MaskPointMouth extends MaskPoint {
  /// **MaskPointMouth** *(maskPointMouth)* - child of MaskPoint
  ///
  /// The mask is placed relatively to the mouth.
  const MaskPointMouth();

  /// Parse from a json
  factory MaskPointMouth.fromJson(Map<String, dynamic> json) =>
      const MaskPointMouth();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MaskPointMouth copyWith() => const MaskPointMouth();

  /// TDLib object type
  static const String defaultObjectId = 'maskPointMouth';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MaskPointChin** *(maskPointChin)* - child of MaskPoint
///
/// The mask is placed relatively to the chin.
final class MaskPointChin extends MaskPoint {
  /// **MaskPointChin** *(maskPointChin)* - child of MaskPoint
  ///
  /// The mask is placed relatively to the chin.
  const MaskPointChin();

  /// Parse from a json
  factory MaskPointChin.fromJson(Map<String, dynamic> json) =>
      const MaskPointChin();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MaskPointChin copyWith() => const MaskPointChin();

  /// TDLib object type
  static const String defaultObjectId = 'maskPointChin';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
