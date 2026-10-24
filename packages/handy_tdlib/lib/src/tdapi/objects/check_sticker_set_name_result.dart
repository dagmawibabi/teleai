part of '../tdapi.dart';

/// **CheckStickerSetNameResult** *(checkStickerSetNameResult)* - parent
///
/// Represents result of checking whether a name can be used for a new sticker set.
sealed class CheckStickerSetNameResult extends TdObject {
  /// **CheckStickerSetNameResult** *(checkStickerSetNameResult)* - parent
  ///
  /// Represents result of checking whether a name can be used for a new sticker set.
  const CheckStickerSetNameResult();

  /// a CheckStickerSetNameResult return type can be :
  /// * [CheckStickerSetNameResultOk]
  /// * [CheckStickerSetNameResultNameInvalid]
  /// * [CheckStickerSetNameResultNameOccupied]
  factory CheckStickerSetNameResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CheckStickerSetNameResultOk.defaultObjectId:
        return CheckStickerSetNameResultOk.fromJson(json);
      case CheckStickerSetNameResultNameInvalid.defaultObjectId:
        return CheckStickerSetNameResultNameInvalid.fromJson(json);
      case CheckStickerSetNameResultNameOccupied.defaultObjectId:
        return CheckStickerSetNameResultNameOccupied.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CheckStickerSetNameResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CheckStickerSetNameResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'checkStickerSetNameResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckStickerSetNameResultOk** *(checkStickerSetNameResultOk)* - child of CheckStickerSetNameResult
///
/// The name can be set.
final class CheckStickerSetNameResultOk extends CheckStickerSetNameResult {
  /// **CheckStickerSetNameResultOk** *(checkStickerSetNameResultOk)* - child of CheckStickerSetNameResult
  ///
  /// The name can be set.
  const CheckStickerSetNameResultOk({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CheckStickerSetNameResultOk.fromJson(Map<String, dynamic> json) =>
      CheckStickerSetNameResultOk(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CheckStickerSetNameResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckStickerSetNameResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkStickerSetNameResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckStickerSetNameResultNameInvalid** *(checkStickerSetNameResultNameInvalid)* - child of CheckStickerSetNameResult
///
/// The name is invalid.
final class CheckStickerSetNameResultNameInvalid
    extends CheckStickerSetNameResult {
  /// **CheckStickerSetNameResultNameInvalid** *(checkStickerSetNameResultNameInvalid)* - child of CheckStickerSetNameResult
  ///
  /// The name is invalid.
  const CheckStickerSetNameResultNameInvalid({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CheckStickerSetNameResultNameInvalid.fromJson(
          Map<String, dynamic> json) =>
      CheckStickerSetNameResultNameInvalid(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CheckStickerSetNameResultNameInvalid copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckStickerSetNameResultNameInvalid(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkStickerSetNameResultNameInvalid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckStickerSetNameResultNameOccupied** *(checkStickerSetNameResultNameOccupied)* - child of CheckStickerSetNameResult
///
/// The name is occupied.
final class CheckStickerSetNameResultNameOccupied
    extends CheckStickerSetNameResult {
  /// **CheckStickerSetNameResultNameOccupied** *(checkStickerSetNameResultNameOccupied)* - child of CheckStickerSetNameResult
  ///
  /// The name is occupied.
  const CheckStickerSetNameResultNameOccupied({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CheckStickerSetNameResultNameOccupied.fromJson(
          Map<String, dynamic> json) =>
      CheckStickerSetNameResultNameOccupied(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CheckStickerSetNameResultNameOccupied copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckStickerSetNameResultNameOccupied(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkStickerSetNameResultNameOccupied';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
