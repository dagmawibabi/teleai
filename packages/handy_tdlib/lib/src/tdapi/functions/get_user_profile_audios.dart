part of '../tdapi.dart';

/// **GetUserProfileAudios** *(getUserProfileAudios)* - TDLib function
///
/// Returns the list of profile audio files of a user.
///
/// * [userId]: User identifier.
/// * [offset]: The number of audio files to skip; must be non-negative.
/// * [limit]: The maximum number of audio files to be returned; up to 100.
///
/// [Audios] is returned on completion.
final class GetUserProfileAudios extends TdFunction {
  /// **GetUserProfileAudios** *(getUserProfileAudios)* - TDLib function
  ///
  /// Returns the list of profile audio files of a user.
  ///
  /// * [userId]: User identifier.
  /// * [offset]: The number of audio files to skip; must be non-negative.
  /// * [limit]: The maximum number of audio files to be returned; up to 100.
  ///
  /// [Audios] is returned on completion.
  const GetUserProfileAudios({
    required this.userId,
    required this.offset,
    required this.limit,
  });

  /// User identifier
  final int userId;

  /// The number of audio files to skip; must be non-negative
  final int offset;

  /// The maximum number of audio files to be returned; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [offset]: The number of audio files to skip; must be non-negative
  /// * [limit]: The maximum number of audio files to be returned; up to 100
  GetUserProfileAudios copyWith({
    int? userId,
    int? offset,
    int? limit,
  }) =>
      GetUserProfileAudios(
        userId: userId ?? this.userId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserProfileAudios';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
