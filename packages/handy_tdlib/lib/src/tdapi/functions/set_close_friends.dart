part of '../tdapi.dart';

/// **SetCloseFriends** *(setCloseFriends)* - TDLib function
///
/// Changes the list of close friends of the current user.
///
/// * [userIds]: User identifiers of close friends; the users must be contacts of the current user.
///
/// [Ok] is returned on completion.
final class SetCloseFriends extends TdFunction {
  /// **SetCloseFriends** *(setCloseFriends)* - TDLib function
  ///
  /// Changes the list of close friends of the current user.
  ///
  /// * [userIds]: User identifiers of close friends; the users must be contacts of the current user.
  ///
  /// [Ok] is returned on completion.
  const SetCloseFriends({
    required this.userIds,
  });

  /// User identifiers of close friends; the users must be contacts of the current user
  final List<int> userIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_ids": userIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_ids]: User identifiers of close friends; the users must be contacts of the current user
  SetCloseFriends copyWith({
    List<int>? userIds,
  }) =>
      SetCloseFriends(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCloseFriends';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
