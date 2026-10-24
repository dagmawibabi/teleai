part of '../tdapi.dart';

/// **SetBio** *(setBio)* - TDLib function
///
/// Changes the bio of the current user.
///
/// * [bio]: The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds.
///
/// [Ok] is returned on completion.
final class SetBio extends TdFunction {
  /// **SetBio** *(setBio)* - TDLib function
  ///
  /// Changes the bio of the current user.
  ///
  /// * [bio]: The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds.
  ///
  /// [Ok] is returned on completion.
  const SetBio({
    required this.bio,
  });

  /// The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
  final String bio;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bio": bio,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bio]: The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
  SetBio copyWith({
    String? bio,
  }) =>
      SetBio(
        bio: bio ?? this.bio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
