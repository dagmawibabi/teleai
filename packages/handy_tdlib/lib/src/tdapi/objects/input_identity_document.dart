part of '../tdapi.dart';

/// **InputIdentityDocument** *(inputIdentityDocument)* - basic class
///
/// An identity document to be saved to Telegram Passport.
///
/// * [number]: Document number; 1-24 characters.
/// * [expirationDate]: Document expiration date; pass null if not applicable *(optional)*.
/// * [frontSide]: Front side of the document.
/// * [reverseSide]: Reverse side of the document; only for driver license and identity card; pass null otherwise *(optional)*.
/// * [selfie]: Selfie with the document; pass null if unavailable *(optional)*.
/// * [translation]: List of files containing a certified English translation of the document.
final class InputIdentityDocument extends TdObject {
  /// **InputIdentityDocument** *(inputIdentityDocument)* - basic class
  ///
  /// An identity document to be saved to Telegram Passport.
  ///
  /// * [number]: Document number; 1-24 characters.
  /// * [expirationDate]: Document expiration date; pass null if not applicable *(optional)*.
  /// * [frontSide]: Front side of the document.
  /// * [reverseSide]: Reverse side of the document; only for driver license and identity card; pass null otherwise *(optional)*.
  /// * [selfie]: Selfie with the document; pass null if unavailable *(optional)*.
  /// * [translation]: List of files containing a certified English translation of the document.
  const InputIdentityDocument({
    required this.number,
    this.expirationDate,
    required this.frontSide,
    this.reverseSide,
    this.selfie,
    required this.translation,
  });

  /// Document number; 1-24 characters
  final String number;

  /// Document expiration date; pass null if not applicable
  final Date? expirationDate;

  /// Front side of the document
  final InputFile frontSide;

  /// Reverse side of the document; only for driver license and identity card; pass null otherwise
  final InputFile? reverseSide;

  /// Selfie with the document; pass null if unavailable
  final InputFile? selfie;

  /// List of files containing a certified English translation of the document
  final List<InputFile> translation;

  /// Parse from a json
  factory InputIdentityDocument.fromJson(Map<String, dynamic> json) =>
      InputIdentityDocument(
        number: json['number'],
        expirationDate: json['expiration_date'] == null
            ? null
            : Date.fromJson(json['expiration_date']),
        frontSide: InputFile.fromJson(json['front_side']),
        reverseSide: json['reverse_side'] == null
            ? null
            : InputFile.fromJson(json['reverse_side']),
        selfie:
            json['selfie'] == null ? null : InputFile.fromJson(json['selfie']),
        translation: List<InputFile>.from((json['translation'] ?? [])
            .map((item) => InputFile.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "number": number,
      "expiration_date": expirationDate?.toJson(),
      "front_side": frontSide.toJson(),
      "reverse_side": reverseSide?.toJson(),
      "selfie": selfie?.toJson(),
      "translation": translation.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [number]: Document number; 1-24 characters
  /// * [expiration_date]: Document expiration date; pass null if not applicable
  /// * [front_side]: Front side of the document
  /// * [reverse_side]: Reverse side of the document; only for driver license and identity card; pass null otherwise
  /// * [selfie]: Selfie with the document; pass null if unavailable
  /// * [translation]: List of files containing a certified English translation of the document
  InputIdentityDocument copyWith({
    String? number,
    Date? expirationDate,
    InputFile? frontSide,
    InputFile? reverseSide,
    InputFile? selfie,
    List<InputFile>? translation,
  }) =>
      InputIdentityDocument(
        number: number ?? this.number,
        expirationDate: expirationDate ?? this.expirationDate,
        frontSide: frontSide ?? this.frontSide,
        reverseSide: reverseSide ?? this.reverseSide,
        selfie: selfie ?? this.selfie,
        translation: translation ?? this.translation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputIdentityDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
