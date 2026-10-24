part of '../tdapi.dart';

/// **IdentityDocument** *(identityDocument)* - basic class
///
/// An identity document.
///
/// * [number]: Document number; 1-24 characters.
/// * [expirationDate]: Document expiration date; may be null if not applicable *(optional)*.
/// * [frontSide]: Front side of the document.
/// * [reverseSide]: Reverse side of the document; only for driver license and identity card; may be null *(optional)*.
/// * [selfie]: Selfie with the document; may be null *(optional)*.
/// * [translation]: List of files containing a certified English translation of the document.
final class IdentityDocument extends TdObject {
  /// **IdentityDocument** *(identityDocument)* - basic class
  ///
  /// An identity document.
  ///
  /// * [number]: Document number; 1-24 characters.
  /// * [expirationDate]: Document expiration date; may be null if not applicable *(optional)*.
  /// * [frontSide]: Front side of the document.
  /// * [reverseSide]: Reverse side of the document; only for driver license and identity card; may be null *(optional)*.
  /// * [selfie]: Selfie with the document; may be null *(optional)*.
  /// * [translation]: List of files containing a certified English translation of the document.
  const IdentityDocument({
    required this.number,
    this.expirationDate,
    required this.frontSide,
    this.reverseSide,
    this.selfie,
    required this.translation,
  });

  /// Document number; 1-24 characters
  final String number;

  /// Document expiration date; may be null if not applicable
  final Date? expirationDate;

  /// Front side of the document
  final DatedFile frontSide;

  /// Reverse side of the document; only for driver license and identity card; may be null
  final DatedFile? reverseSide;

  /// Selfie with the document; may be null
  final DatedFile? selfie;

  /// List of files containing a certified English translation of the document
  final List<DatedFile> translation;

  /// Parse from a json
  factory IdentityDocument.fromJson(Map<String, dynamic> json) =>
      IdentityDocument(
        number: json['number'],
        expirationDate: json['expiration_date'] == null
            ? null
            : Date.fromJson(json['expiration_date']),
        frontSide: DatedFile.fromJson(json['front_side']),
        reverseSide: json['reverse_side'] == null
            ? null
            : DatedFile.fromJson(json['reverse_side']),
        selfie:
            json['selfie'] == null ? null : DatedFile.fromJson(json['selfie']),
        translation: List<DatedFile>.from((json['translation'] ?? [])
            .map((item) => DatedFile.fromJson(item))
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
  /// * [expiration_date]: Document expiration date; may be null if not applicable
  /// * [front_side]: Front side of the document
  /// * [reverse_side]: Reverse side of the document; only for driver license and identity card; may be null
  /// * [selfie]: Selfie with the document; may be null
  /// * [translation]: List of files containing a certified English translation of the document
  IdentityDocument copyWith({
    String? number,
    Date? expirationDate,
    DatedFile? frontSide,
    DatedFile? reverseSide,
    DatedFile? selfie,
    List<DatedFile>? translation,
  }) =>
      IdentityDocument(
        number: number ?? this.number,
        expirationDate: expirationDate ?? this.expirationDate,
        frontSide: frontSide ?? this.frontSide,
        reverseSide: reverseSide ?? this.reverseSide,
        selfie: selfie ?? this.selfie,
        translation: translation ?? this.translation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'identityDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
