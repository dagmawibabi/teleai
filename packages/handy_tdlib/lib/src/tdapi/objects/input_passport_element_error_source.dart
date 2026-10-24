part of '../tdapi.dart';

/// **InputPassportElementErrorSource** *(inputPassportElementErrorSource)* - parent
///
/// Contains the description of an error in a Telegram Passport element; for bots only.
sealed class InputPassportElementErrorSource extends TdObject {
  /// **InputPassportElementErrorSource** *(inputPassportElementErrorSource)* - parent
  ///
  /// Contains the description of an error in a Telegram Passport element; for bots only.
  const InputPassportElementErrorSource();

  /// a InputPassportElementErrorSource return type can be :
  /// * [InputPassportElementErrorSourceUnspecified]
  /// * [InputPassportElementErrorSourceDataField]
  /// * [InputPassportElementErrorSourceFrontSide]
  /// * [InputPassportElementErrorSourceReverseSide]
  /// * [InputPassportElementErrorSourceSelfie]
  /// * [InputPassportElementErrorSourceTranslationFile]
  /// * [InputPassportElementErrorSourceTranslationFiles]
  /// * [InputPassportElementErrorSourceFile]
  /// * [InputPassportElementErrorSourceFiles]
  factory InputPassportElementErrorSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPassportElementErrorSourceUnspecified.defaultObjectId:
        return InputPassportElementErrorSourceUnspecified.fromJson(json);
      case InputPassportElementErrorSourceDataField.defaultObjectId:
        return InputPassportElementErrorSourceDataField.fromJson(json);
      case InputPassportElementErrorSourceFrontSide.defaultObjectId:
        return InputPassportElementErrorSourceFrontSide.fromJson(json);
      case InputPassportElementErrorSourceReverseSide.defaultObjectId:
        return InputPassportElementErrorSourceReverseSide.fromJson(json);
      case InputPassportElementErrorSourceSelfie.defaultObjectId:
        return InputPassportElementErrorSourceSelfie.fromJson(json);
      case InputPassportElementErrorSourceTranslationFile.defaultObjectId:
        return InputPassportElementErrorSourceTranslationFile.fromJson(json);
      case InputPassportElementErrorSourceTranslationFiles.defaultObjectId:
        return InputPassportElementErrorSourceTranslationFiles.fromJson(json);
      case InputPassportElementErrorSourceFile.defaultObjectId:
        return InputPassportElementErrorSourceFile.fromJson(json);
      case InputPassportElementErrorSourceFiles.defaultObjectId:
        return InputPassportElementErrorSourceFiles.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPassportElementErrorSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPassportElementErrorSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementErrorSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceUnspecified** *(inputPassportElementErrorSourceUnspecified)* - child of InputPassportElementErrorSource
///
/// The element contains an error in an unspecified place. The error will be considered resolved when new data is added.
///
/// * [elementHash]: Current hash of the entire element.
final class InputPassportElementErrorSourceUnspecified
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceUnspecified** *(inputPassportElementErrorSourceUnspecified)* - child of InputPassportElementErrorSource
  ///
  /// The element contains an error in an unspecified place. The error will be considered resolved when new data is added.
  ///
  /// * [elementHash]: Current hash of the entire element.
  const InputPassportElementErrorSourceUnspecified({
    required this.elementHash,
  });

  /// Current hash of the entire element
  final String elementHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceUnspecified.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceUnspecified(
        elementHash: json['element_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "element_hash": elementHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [element_hash]: Current hash of the entire element
  @override
  InputPassportElementErrorSourceUnspecified copyWith({
    String? elementHash,
  }) =>
      InputPassportElementErrorSourceUnspecified(
        elementHash: elementHash ?? this.elementHash,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceUnspecified';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceDataField** *(inputPassportElementErrorSourceDataField)* - child of InputPassportElementErrorSource
///
/// A data field contains an error. The error is considered resolved when the field's value changes.
///
/// * [fieldName]: Field name.
/// * [dataHash]: Current data hash.
final class InputPassportElementErrorSourceDataField
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceDataField** *(inputPassportElementErrorSourceDataField)* - child of InputPassportElementErrorSource
  ///
  /// A data field contains an error. The error is considered resolved when the field's value changes.
  ///
  /// * [fieldName]: Field name.
  /// * [dataHash]: Current data hash.
  const InputPassportElementErrorSourceDataField({
    required this.fieldName,
    required this.dataHash,
  });

  /// Field name
  final String fieldName;

  /// Current data hash
  final String dataHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceDataField.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceDataField(
        fieldName: json['field_name'],
        dataHash: json['data_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "field_name": fieldName,
      "data_hash": dataHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [field_name]: Field name
  /// * [data_hash]: Current data hash
  @override
  InputPassportElementErrorSourceDataField copyWith({
    String? fieldName,
    String? dataHash,
  }) =>
      InputPassportElementErrorSourceDataField(
        fieldName: fieldName ?? this.fieldName,
        dataHash: dataHash ?? this.dataHash,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceDataField';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceFrontSide** *(inputPassportElementErrorSourceFrontSide)* - child of InputPassportElementErrorSource
///
/// The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes.
///
/// * [fileHash]: Current hash of the file containing the front side.
final class InputPassportElementErrorSourceFrontSide
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceFrontSide** *(inputPassportElementErrorSourceFrontSide)* - child of InputPassportElementErrorSource
  ///
  /// The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes.
  ///
  /// * [fileHash]: Current hash of the file containing the front side.
  const InputPassportElementErrorSourceFrontSide({
    required this.fileHash,
  });

  /// Current hash of the file containing the front side
  final String fileHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceFrontSide.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceFrontSide(
        fileHash: json['file_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hash": fileHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hash]: Current hash of the file containing the front side
  @override
  InputPassportElementErrorSourceFrontSide copyWith({
    String? fileHash,
  }) =>
      InputPassportElementErrorSourceFrontSide(
        fileHash: fileHash ?? this.fileHash,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceFrontSide';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceReverseSide** *(inputPassportElementErrorSourceReverseSide)* - child of InputPassportElementErrorSource
///
/// The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes.
///
/// * [fileHash]: Current hash of the file containing the reverse side.
final class InputPassportElementErrorSourceReverseSide
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceReverseSide** *(inputPassportElementErrorSourceReverseSide)* - child of InputPassportElementErrorSource
  ///
  /// The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes.
  ///
  /// * [fileHash]: Current hash of the file containing the reverse side.
  const InputPassportElementErrorSourceReverseSide({
    required this.fileHash,
  });

  /// Current hash of the file containing the reverse side
  final String fileHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceReverseSide.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceReverseSide(
        fileHash: json['file_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hash": fileHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hash]: Current hash of the file containing the reverse side
  @override
  InputPassportElementErrorSourceReverseSide copyWith({
    String? fileHash,
  }) =>
      InputPassportElementErrorSourceReverseSide(
        fileHash: fileHash ?? this.fileHash,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceReverseSide';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceSelfie** *(inputPassportElementErrorSourceSelfie)* - child of InputPassportElementErrorSource
///
/// The selfie contains an error. The error is considered resolved when the file with the selfie changes.
///
/// * [fileHash]: Current hash of the file containing the selfie.
final class InputPassportElementErrorSourceSelfie
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceSelfie** *(inputPassportElementErrorSourceSelfie)* - child of InputPassportElementErrorSource
  ///
  /// The selfie contains an error. The error is considered resolved when the file with the selfie changes.
  ///
  /// * [fileHash]: Current hash of the file containing the selfie.
  const InputPassportElementErrorSourceSelfie({
    required this.fileHash,
  });

  /// Current hash of the file containing the selfie
  final String fileHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceSelfie.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceSelfie(
        fileHash: json['file_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hash": fileHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hash]: Current hash of the file containing the selfie
  @override
  InputPassportElementErrorSourceSelfie copyWith({
    String? fileHash,
  }) =>
      InputPassportElementErrorSourceSelfie(
        fileHash: fileHash ?? this.fileHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementErrorSourceSelfie';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceTranslationFile** *(inputPassportElementErrorSourceTranslationFile)* - child of InputPassportElementErrorSource
///
/// One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes.
///
/// * [fileHash]: Current hash of the file containing the translation.
final class InputPassportElementErrorSourceTranslationFile
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceTranslationFile** *(inputPassportElementErrorSourceTranslationFile)* - child of InputPassportElementErrorSource
  ///
  /// One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes.
  ///
  /// * [fileHash]: Current hash of the file containing the translation.
  const InputPassportElementErrorSourceTranslationFile({
    required this.fileHash,
  });

  /// Current hash of the file containing the translation
  final String fileHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceTranslationFile.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceTranslationFile(
        fileHash: json['file_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hash": fileHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hash]: Current hash of the file containing the translation
  @override
  InputPassportElementErrorSourceTranslationFile copyWith({
    String? fileHash,
  }) =>
      InputPassportElementErrorSourceTranslationFile(
        fileHash: fileHash ?? this.fileHash,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceTranslationFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceTranslationFiles** *(inputPassportElementErrorSourceTranslationFiles)* - child of InputPassportElementErrorSource
///
/// The translation of the document contains an error. The error is considered resolved when the list of files changes.
///
/// * [fileHashes]: Current hashes of all files with the translation.
final class InputPassportElementErrorSourceTranslationFiles
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceTranslationFiles** *(inputPassportElementErrorSourceTranslationFiles)* - child of InputPassportElementErrorSource
  ///
  /// The translation of the document contains an error. The error is considered resolved when the list of files changes.
  ///
  /// * [fileHashes]: Current hashes of all files with the translation.
  const InputPassportElementErrorSourceTranslationFiles({
    required this.fileHashes,
  });

  /// Current hashes of all files with the translation
  final List<String> fileHashes;

  /// Parse from a json
  factory InputPassportElementErrorSourceTranslationFiles.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceTranslationFiles(
        fileHashes: List<String>.from(
            (json['file_hashes'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hashes": fileHashes.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hashes]: Current hashes of all files with the translation
  @override
  InputPassportElementErrorSourceTranslationFiles copyWith({
    List<String>? fileHashes,
  }) =>
      InputPassportElementErrorSourceTranslationFiles(
        fileHashes: fileHashes ?? this.fileHashes,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementErrorSourceTranslationFiles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceFile** *(inputPassportElementErrorSourceFile)* - child of InputPassportElementErrorSource
///
/// The file contains an error. The error is considered resolved when the file changes.
///
/// * [fileHash]: Current hash of the file which has the error.
final class InputPassportElementErrorSourceFile
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceFile** *(inputPassportElementErrorSourceFile)* - child of InputPassportElementErrorSource
  ///
  /// The file contains an error. The error is considered resolved when the file changes.
  ///
  /// * [fileHash]: Current hash of the file which has the error.
  const InputPassportElementErrorSourceFile({
    required this.fileHash,
  });

  /// Current hash of the file which has the error
  final String fileHash;

  /// Parse from a json
  factory InputPassportElementErrorSourceFile.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceFile(
        fileHash: json['file_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hash": fileHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hash]: Current hash of the file which has the error
  @override
  InputPassportElementErrorSourceFile copyWith({
    String? fileHash,
  }) =>
      InputPassportElementErrorSourceFile(
        fileHash: fileHash ?? this.fileHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementErrorSourceFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementErrorSourceFiles** *(inputPassportElementErrorSourceFiles)* - child of InputPassportElementErrorSource
///
/// The list of attached files contains an error. The error is considered resolved when the file list changes.
///
/// * [fileHashes]: Current hashes of all attached files.
final class InputPassportElementErrorSourceFiles
    extends InputPassportElementErrorSource {
  /// **InputPassportElementErrorSourceFiles** *(inputPassportElementErrorSourceFiles)* - child of InputPassportElementErrorSource
  ///
  /// The list of attached files contains an error. The error is considered resolved when the file list changes.
  ///
  /// * [fileHashes]: Current hashes of all attached files.
  const InputPassportElementErrorSourceFiles({
    required this.fileHashes,
  });

  /// Current hashes of all attached files
  final List<String> fileHashes;

  /// Parse from a json
  factory InputPassportElementErrorSourceFiles.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementErrorSourceFiles(
        fileHashes: List<String>.from(
            (json['file_hashes'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_hashes": fileHashes.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_hashes]: Current hashes of all attached files
  @override
  InputPassportElementErrorSourceFiles copyWith({
    List<String>? fileHashes,
  }) =>
      InputPassportElementErrorSourceFiles(
        fileHashes: fileHashes ?? this.fileHashes,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementErrorSourceFiles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
