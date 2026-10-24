part of '../tdapi.dart';

/// **PassportRequiredElement** *(passportRequiredElement)* - basic class
///
/// Contains a description of the required Telegram Passport element that was requested by a service.
///
/// * [suitableElements]: List of Telegram Passport elements any of which is enough to provide.
final class PassportRequiredElement extends TdObject {
  /// **PassportRequiredElement** *(passportRequiredElement)* - basic class
  ///
  /// Contains a description of the required Telegram Passport element that was requested by a service.
  ///
  /// * [suitableElements]: List of Telegram Passport elements any of which is enough to provide.
  const PassportRequiredElement({
    required this.suitableElements,
  });

  /// List of Telegram Passport elements any of which is enough to provide
  final List<PassportSuitableElement> suitableElements;

  /// Parse from a json
  factory PassportRequiredElement.fromJson(Map<String, dynamic> json) =>
      PassportRequiredElement(
        suitableElements: List<PassportSuitableElement>.from(
            (json['suitable_elements'] ?? [])
                .map((item) => PassportSuitableElement.fromJson(item))
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suitable_elements": suitableElements.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suitable_elements]: List of Telegram Passport elements any of which is enough to provide
  PassportRequiredElement copyWith({
    List<PassportSuitableElement>? suitableElements,
  }) =>
      PassportRequiredElement(
        suitableElements: suitableElements ?? this.suitableElements,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportRequiredElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
