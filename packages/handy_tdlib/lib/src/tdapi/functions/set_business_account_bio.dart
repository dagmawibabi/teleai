part of '../tdapi.dart';

/// **SetBusinessAccountBio** *(setBusinessAccountBio)* - TDLib function
///
/// Changes the bio of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [bio]: The new value of the bio; 0-getOption("bio_length_max") characters without line feeds.
///
/// [Ok] is returned on completion.
final class SetBusinessAccountBio extends TdFunction {
  /// **SetBusinessAccountBio** *(setBusinessAccountBio)* - TDLib function
  ///
  /// Changes the bio of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [bio]: The new value of the bio; 0-getOption("bio_length_max") characters without line feeds.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAccountBio({
    required this.businessConnectionId,
    required this.bio,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// The new value of the bio; 0-getOption("bio_length_max") characters without line feeds
  final String bio;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "bio": bio,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [bio]: The new value of the bio; 0-getOption("bio_length_max") characters without line feeds
  SetBusinessAccountBio copyWith({
    String? businessConnectionId,
    String? bio,
  }) =>
      SetBusinessAccountBio(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        bio: bio ?? this.bio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAccountBio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
