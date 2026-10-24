part of '../tdapi.dart';

/// **CanSendGiftResult** *(canSendGiftResult)* - parent
///
/// Describes whether a gift can be sent now by the current user.
sealed class CanSendGiftResult extends TdObject {
  /// **CanSendGiftResult** *(canSendGiftResult)* - parent
  ///
  /// Describes whether a gift can be sent now by the current user.
  const CanSendGiftResult();

  /// a CanSendGiftResult return type can be :
  /// * [CanSendGiftResultOk]
  /// * [CanSendGiftResultFail]
  factory CanSendGiftResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CanSendGiftResultOk.defaultObjectId:
        return CanSendGiftResultOk.fromJson(json);
      case CanSendGiftResultFail.defaultObjectId:
        return CanSendGiftResultFail.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CanSendGiftResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CanSendGiftResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'canSendGiftResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendGiftResultOk** *(canSendGiftResultOk)* - child of CanSendGiftResult
///
/// The gift can be sent now by the current user.
final class CanSendGiftResultOk extends CanSendGiftResult {
  /// **CanSendGiftResultOk** *(canSendGiftResultOk)* - child of CanSendGiftResult
  ///
  /// The gift can be sent now by the current user.
  const CanSendGiftResultOk({
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
  factory CanSendGiftResultOk.fromJson(Map<String, dynamic> json) =>
      CanSendGiftResultOk(
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
  CanSendGiftResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanSendGiftResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canSendGiftResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendGiftResultFail** *(canSendGiftResultFail)* - child of CanSendGiftResult
///
/// The gift can't be sent now by the current user.
///
/// * [reason]: Reason to be shown to the user.
final class CanSendGiftResultFail extends CanSendGiftResult {
  /// **CanSendGiftResultFail** *(canSendGiftResultFail)* - child of CanSendGiftResult
  ///
  /// The gift can't be sent now by the current user.
  ///
  /// * [reason]: Reason to be shown to the user.
  const CanSendGiftResultFail({
    required this.reason,
    this.extra,
    this.clientId,
  });

  /// Reason to be shown to the user
  final FormattedText reason;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CanSendGiftResultFail.fromJson(Map<String, dynamic> json) =>
      CanSendGiftResultFail(
        reason: FormattedText.fromJson(json['reason']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reason": reason.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: Reason to be shown to the user
  @override
  CanSendGiftResultFail copyWith({
    FormattedText? reason,
    dynamic extra,
    int? clientId,
  }) =>
      CanSendGiftResultFail(
        reason: reason ?? this.reason,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canSendGiftResultFail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
