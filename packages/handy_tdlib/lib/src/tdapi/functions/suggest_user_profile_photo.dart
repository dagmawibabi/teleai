part of '../tdapi.dart';

/// **SuggestUserProfilePhoto** *(suggestUserProfilePhoto)* - TDLib function
///
/// Suggests a profile photo to another regular user with common messages and allowing non-paid messages.
///
/// * [userId]: User identifier.
/// * [photo]: Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function.
///
/// [Ok] is returned on completion.
final class SuggestUserProfilePhoto extends TdFunction {
  /// **SuggestUserProfilePhoto** *(suggestUserProfilePhoto)* - TDLib function
  ///
  /// Suggests a profile photo to another regular user with common messages and allowing non-paid messages.
  ///
  /// * [userId]: User identifier.
  /// * [photo]: Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function.
  ///
  /// [Ok] is returned on completion.
  const SuggestUserProfilePhoto({
    required this.userId,
    required this.photo,
  });

  /// User identifier
  final int userId;

  /// Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
  final InputChatPhoto photo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "photo": photo.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [photo]: Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
  SuggestUserProfilePhoto copyWith({
    int? userId,
    InputChatPhoto? photo,
  }) =>
      SuggestUserProfilePhoto(
        userId: userId ?? this.userId,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestUserProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
