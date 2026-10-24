part of '../tdapi.dart';

/// **SetBusinessAccountUsername** *(setBusinessAccountUsername)* - TDLib function
///
/// Changes the editable username of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [username]: The new value of the username.
///
/// [Ok] is returned on completion.
final class SetBusinessAccountUsername extends TdFunction {
  /// **SetBusinessAccountUsername** *(setBusinessAccountUsername)* - TDLib function
  ///
  /// Changes the editable username of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [username]: The new value of the username.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAccountUsername({
    required this.businessConnectionId,
    required this.username,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// The new value of the username
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [username]: The new value of the username
  SetBusinessAccountUsername copyWith({
    String? businessConnectionId,
    String? username,
  }) =>
      SetBusinessAccountUsername(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAccountUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
