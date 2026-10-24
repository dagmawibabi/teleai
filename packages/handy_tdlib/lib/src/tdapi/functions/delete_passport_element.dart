part of '../tdapi.dart';

/// **DeletePassportElement** *(deletePassportElement)* - TDLib function
///
/// Deletes a Telegram Passport element.
///
/// * [type]: Element type.
///
/// [Ok] is returned on completion.
final class DeletePassportElement extends TdFunction {
  /// **DeletePassportElement** *(deletePassportElement)* - TDLib function
  ///
  /// Deletes a Telegram Passport element.
  ///
  /// * [type]: Element type.
  ///
  /// [Ok] is returned on completion.
  const DeletePassportElement({
    required this.type,
  });

  /// Element type
  final PassportElementType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Element type
  DeletePassportElement copyWith({
    PassportElementType? type,
  }) =>
      DeletePassportElement(
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deletePassportElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
