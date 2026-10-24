part of '../tdapi.dart';

/// **PassportElementError** *(passportElementError)* - basic class
///
/// Contains the description of an error in a Telegram Passport element.
///
/// * [type]: Type of the Telegram Passport element which has the error.
/// * [message]: Error message.
/// * [source]: Error source.
final class PassportElementError extends TdObject {
  /// **PassportElementError** *(passportElementError)* - basic class
  ///
  /// Contains the description of an error in a Telegram Passport element.
  ///
  /// * [type]: Type of the Telegram Passport element which has the error.
  /// * [message]: Error message.
  /// * [source]: Error source.
  const PassportElementError({
    required this.type,
    required this.message,
    required this.source,
  });

  /// Type of the Telegram Passport element which has the error
  final PassportElementType type;

  /// Error message
  final String message;

  /// Error source
  final PassportElementErrorSource source;

  /// Parse from a json
  factory PassportElementError.fromJson(Map<String, dynamic> json) =>
      PassportElementError(
        type: PassportElementType.fromJson(json['type']),
        message: json['message'],
        source: PassportElementErrorSource.fromJson(json['source']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "message": message,
      "source": source.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the Telegram Passport element which has the error
  /// * [message]: Error message
  /// * [source]: Error source
  PassportElementError copyWith({
    PassportElementType? type,
    String? message,
    PassportElementErrorSource? source,
  }) =>
      PassportElementError(
        type: type ?? this.type,
        message: message ?? this.message,
        source: source ?? this.source,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
