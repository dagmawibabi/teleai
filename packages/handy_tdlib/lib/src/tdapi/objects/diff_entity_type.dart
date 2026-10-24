part of '../tdapi.dart';

/// **DiffEntityType** *(diffEntityType)* - parent
///
/// Represents a change of a text.
sealed class DiffEntityType extends TdObject {
  /// **DiffEntityType** *(diffEntityType)* - parent
  ///
  /// Represents a change of a text.
  const DiffEntityType();

  /// a DiffEntityType return type can be :
  /// * [DiffEntityTypeInsert]
  /// * [DiffEntityTypeReplace]
  /// * [DiffEntityTypeDelete]
  factory DiffEntityType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case DiffEntityTypeInsert.defaultObjectId:
        return DiffEntityTypeInsert.fromJson(json);
      case DiffEntityTypeReplace.defaultObjectId:
        return DiffEntityTypeReplace.fromJson(json);
      case DiffEntityTypeDelete.defaultObjectId:
        return DiffEntityTypeDelete.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of DiffEntityType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  DiffEntityType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'diffEntityType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DiffEntityTypeInsert** *(diffEntityTypeInsert)* - child of DiffEntityType
///
/// Addition of some text.
final class DiffEntityTypeInsert extends DiffEntityType {
  /// **DiffEntityTypeInsert** *(diffEntityTypeInsert)* - child of DiffEntityType
  ///
  /// Addition of some text.
  const DiffEntityTypeInsert();

  /// Parse from a json
  factory DiffEntityTypeInsert.fromJson(Map<String, dynamic> json) =>
      const DiffEntityTypeInsert();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DiffEntityTypeInsert copyWith() => const DiffEntityTypeInsert();

  /// TDLib object type
  static const String defaultObjectId = 'diffEntityTypeInsert';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DiffEntityTypeReplace** *(diffEntityTypeReplace)* - child of DiffEntityType
///
/// Change of some text.
///
/// * [oldText]: The old text.
final class DiffEntityTypeReplace extends DiffEntityType {
  /// **DiffEntityTypeReplace** *(diffEntityTypeReplace)* - child of DiffEntityType
  ///
  /// Change of some text.
  ///
  /// * [oldText]: The old text.
  const DiffEntityTypeReplace({
    required this.oldText,
  });

  /// The old text
  final String oldText;

  /// Parse from a json
  factory DiffEntityTypeReplace.fromJson(Map<String, dynamic> json) =>
      DiffEntityTypeReplace(
        oldText: json['old_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_text": oldText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_text]: The old text
  @override
  DiffEntityTypeReplace copyWith({
    String? oldText,
  }) =>
      DiffEntityTypeReplace(
        oldText: oldText ?? this.oldText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'diffEntityTypeReplace';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DiffEntityTypeDelete** *(diffEntityTypeDelete)* - child of DiffEntityType
///
/// Removal of some text.
final class DiffEntityTypeDelete extends DiffEntityType {
  /// **DiffEntityTypeDelete** *(diffEntityTypeDelete)* - child of DiffEntityType
  ///
  /// Removal of some text.
  const DiffEntityTypeDelete();

  /// Parse from a json
  factory DiffEntityTypeDelete.fromJson(Map<String, dynamic> json) =>
      const DiffEntityTypeDelete();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DiffEntityTypeDelete copyWith() => const DiffEntityTypeDelete();

  /// TDLib object type
  static const String defaultObjectId = 'diffEntityTypeDelete';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
