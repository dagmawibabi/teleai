part of '../tdapi.dart';

/// **Ok** *(ok)* - basic class
///
/// An object of this type is returned on a successful function call for certain functions.
final class Ok extends TdObject {
  /// **Ok** *(ok)* - basic class
  ///
  /// An object of this type is returned on a successful function call for certain functions.
  const Ok({
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
  factory Ok.fromJson(Map<String, dynamic> json) => Ok(
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
  Ok copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      Ok(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'ok';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
