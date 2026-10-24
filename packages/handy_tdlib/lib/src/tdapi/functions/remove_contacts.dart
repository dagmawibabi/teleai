part of '../tdapi.dart';

/// **RemoveContacts** *(removeContacts)* - TDLib function
///
/// Removes users from the contact list.
///
/// * [userIds]: Identifiers of users to be deleted.
///
/// [Ok] is returned on completion.
final class RemoveContacts extends TdFunction {
  /// **RemoveContacts** *(removeContacts)* - TDLib function
  ///
  /// Removes users from the contact list.
  ///
  /// * [userIds]: Identifiers of users to be deleted.
  ///
  /// [Ok] is returned on completion.
  const RemoveContacts({
    required this.userIds,
  });

  /// Identifiers of users to be deleted
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
  /// * [user_ids]: Identifiers of users to be deleted
  RemoveContacts copyWith({
    List<int>? userIds,
  }) =>
      RemoveContacts(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
