part of '../tdapi.dart';

/// **PassportElementErrorSource** *(passportElementErrorSource)* - parent
///
/// Contains the description of an error in a Telegram Passport element.
sealed class PassportElementErrorSource extends TdObject {
  /// **PassportElementErrorSource** *(passportElementErrorSource)* - parent
  ///
  /// Contains the description of an error in a Telegram Passport element.
  const PassportElementErrorSource();

  /// a PassportElementErrorSource return type can be :
  /// * [PassportElementErrorSourceUnspecified]
  /// * [PassportElementErrorSourceDataField]
  /// * [PassportElementErrorSourceFrontSide]
  /// * [PassportElementErrorSourceReverseSide]
  /// * [PassportElementErrorSourceSelfie]
  /// * [PassportElementErrorSourceTranslationFile]
  /// * [PassportElementErrorSourceTranslationFiles]
  /// * [PassportElementErrorSourceFile]
  /// * [PassportElementErrorSourceFiles]
  factory PassportElementErrorSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PassportElementErrorSourceUnspecified.defaultObjectId:
        return PassportElementErrorSourceUnspecified.fromJson(json);
      case PassportElementErrorSourceDataField.defaultObjectId:
        return PassportElementErrorSourceDataField.fromJson(json);
      case PassportElementErrorSourceFrontSide.defaultObjectId:
        return PassportElementErrorSourceFrontSide.fromJson(json);
      case PassportElementErrorSourceReverseSide.defaultObjectId:
        return PassportElementErrorSourceReverseSide.fromJson(json);
      case PassportElementErrorSourceSelfie.defaultObjectId:
        return PassportElementErrorSourceSelfie.fromJson(json);
      case PassportElementErrorSourceTranslationFile.defaultObjectId:
        return PassportElementErrorSourceTranslationFile.fromJson(json);
      case PassportElementErrorSourceTranslationFiles.defaultObjectId:
        return PassportElementErrorSourceTranslationFiles.fromJson(json);
      case PassportElementErrorSourceFile.defaultObjectId:
        return PassportElementErrorSourceFile.fromJson(json);
      case PassportElementErrorSourceFiles.defaultObjectId:
        return PassportElementErrorSourceFiles.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PassportElementErrorSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PassportElementErrorSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceUnspecified** *(passportElementErrorSourceUnspecified)* - child of PassportElementErrorSource
///
/// The element contains an error in an unspecified place. The error will be considered resolved when new data is added.
final class PassportElementErrorSourceUnspecified
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceUnspecified** *(passportElementErrorSourceUnspecified)* - child of PassportElementErrorSource
  ///
  /// The element contains an error in an unspecified place. The error will be considered resolved when new data is added.
  const PassportElementErrorSourceUnspecified();

  /// Parse from a json
  factory PassportElementErrorSourceUnspecified.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementErrorSourceUnspecified();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceUnspecified copyWith() =>
      const PassportElementErrorSourceUnspecified();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceUnspecified';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceDataField** *(passportElementErrorSourceDataField)* - child of PassportElementErrorSource
///
/// One of the data fields contains an error. The error will be considered resolved when the value of the field changes.
///
/// * [fieldName]: Field name.
final class PassportElementErrorSourceDataField
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceDataField** *(passportElementErrorSourceDataField)* - child of PassportElementErrorSource
  ///
  /// One of the data fields contains an error. The error will be considered resolved when the value of the field changes.
  ///
  /// * [fieldName]: Field name.
  const PassportElementErrorSourceDataField({
    required this.fieldName,
  });

  /// Field name
  final String fieldName;

  /// Parse from a json
  factory PassportElementErrorSourceDataField.fromJson(
          Map<String, dynamic> json) =>
      PassportElementErrorSourceDataField(
        fieldName: json['field_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "field_name": fieldName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [field_name]: Field name
  @override
  PassportElementErrorSourceDataField copyWith({
    String? fieldName,
  }) =>
      PassportElementErrorSourceDataField(
        fieldName: fieldName ?? this.fieldName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceDataField';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceFrontSide** *(passportElementErrorSourceFrontSide)* - child of PassportElementErrorSource
///
/// The front side of the document contains an error. The error will be considered resolved when the file with the front side changes.
final class PassportElementErrorSourceFrontSide
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceFrontSide** *(passportElementErrorSourceFrontSide)* - child of PassportElementErrorSource
  ///
  /// The front side of the document contains an error. The error will be considered resolved when the file with the front side changes.
  const PassportElementErrorSourceFrontSide();

  /// Parse from a json
  factory PassportElementErrorSourceFrontSide.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementErrorSourceFrontSide();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceFrontSide copyWith() =>
      const PassportElementErrorSourceFrontSide();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceFrontSide';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceReverseSide** *(passportElementErrorSourceReverseSide)* - child of PassportElementErrorSource
///
/// The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes.
final class PassportElementErrorSourceReverseSide
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceReverseSide** *(passportElementErrorSourceReverseSide)* - child of PassportElementErrorSource
  ///
  /// The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes.
  const PassportElementErrorSourceReverseSide();

  /// Parse from a json
  factory PassportElementErrorSourceReverseSide.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementErrorSourceReverseSide();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceReverseSide copyWith() =>
      const PassportElementErrorSourceReverseSide();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceReverseSide';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceSelfie** *(passportElementErrorSourceSelfie)* - child of PassportElementErrorSource
///
/// The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes.
final class PassportElementErrorSourceSelfie
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceSelfie** *(passportElementErrorSourceSelfie)* - child of PassportElementErrorSource
  ///
  /// The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes.
  const PassportElementErrorSourceSelfie();

  /// Parse from a json
  factory PassportElementErrorSourceSelfie.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementErrorSourceSelfie();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceSelfie copyWith() =>
      const PassportElementErrorSourceSelfie();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceSelfie';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceTranslationFile** *(passportElementErrorSourceTranslationFile)* - child of PassportElementErrorSource
///
/// One of files with the translation of the document contains an error. The error will be considered resolved when the file changes.
///
/// * [fileIndex]: Index of a file with the error.
final class PassportElementErrorSourceTranslationFile
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceTranslationFile** *(passportElementErrorSourceTranslationFile)* - child of PassportElementErrorSource
  ///
  /// One of files with the translation of the document contains an error. The error will be considered resolved when the file changes.
  ///
  /// * [fileIndex]: Index of a file with the error.
  const PassportElementErrorSourceTranslationFile({
    required this.fileIndex,
  });

  /// Index of a file with the error
  final int fileIndex;

  /// Parse from a json
  factory PassportElementErrorSourceTranslationFile.fromJson(
          Map<String, dynamic> json) =>
      PassportElementErrorSourceTranslationFile(
        fileIndex: json['file_index'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_index": fileIndex,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_index]: Index of a file with the error
  @override
  PassportElementErrorSourceTranslationFile copyWith({
    int? fileIndex,
  }) =>
      PassportElementErrorSourceTranslationFile(
        fileIndex: fileIndex ?? this.fileIndex,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'passportElementErrorSourceTranslationFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceTranslationFiles** *(passportElementErrorSourceTranslationFiles)* - child of PassportElementErrorSource
///
/// The translation of the document contains an error. The error will be considered resolved when the list of translation files changes.
final class PassportElementErrorSourceTranslationFiles
    extends PassportElementErrorSource {
  /// **PassportElementErrorSourceTranslationFiles** *(passportElementErrorSourceTranslationFiles)* - child of PassportElementErrorSource
  ///
  /// The translation of the document contains an error. The error will be considered resolved when the list of translation files changes.
  const PassportElementErrorSourceTranslationFiles();

  /// Parse from a json
  factory PassportElementErrorSourceTranslationFiles.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementErrorSourceTranslationFiles();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceTranslationFiles copyWith() =>
      const PassportElementErrorSourceTranslationFiles();

  /// TDLib object type
  static const String defaultObjectId =
      'passportElementErrorSourceTranslationFiles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceFile** *(passportElementErrorSourceFile)* - child of PassportElementErrorSource
///
/// The file contains an error. The error will be considered resolved when the file changes.
///
/// * [fileIndex]: Index of a file with the error.
final class PassportElementErrorSourceFile extends PassportElementErrorSource {
  /// **PassportElementErrorSourceFile** *(passportElementErrorSourceFile)* - child of PassportElementErrorSource
  ///
  /// The file contains an error. The error will be considered resolved when the file changes.
  ///
  /// * [fileIndex]: Index of a file with the error.
  const PassportElementErrorSourceFile({
    required this.fileIndex,
  });

  /// Index of a file with the error
  final int fileIndex;

  /// Parse from a json
  factory PassportElementErrorSourceFile.fromJson(Map<String, dynamic> json) =>
      PassportElementErrorSourceFile(
        fileIndex: json['file_index'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_index": fileIndex,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_index]: Index of a file with the error
  @override
  PassportElementErrorSourceFile copyWith({
    int? fileIndex,
  }) =>
      PassportElementErrorSourceFile(
        fileIndex: fileIndex ?? this.fileIndex,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementErrorSourceFiles** *(passportElementErrorSourceFiles)* - child of PassportElementErrorSource
///
/// The list of attached files contains an error. The error will be considered resolved when the list of files changes.
final class PassportElementErrorSourceFiles extends PassportElementErrorSource {
  /// **PassportElementErrorSourceFiles** *(passportElementErrorSourceFiles)* - child of PassportElementErrorSource
  ///
  /// The list of attached files contains an error. The error will be considered resolved when the list of files changes.
  const PassportElementErrorSourceFiles();

  /// Parse from a json
  factory PassportElementErrorSourceFiles.fromJson(Map<String, dynamic> json) =>
      const PassportElementErrorSourceFiles();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementErrorSourceFiles copyWith() =>
      const PassportElementErrorSourceFiles();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementErrorSourceFiles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
