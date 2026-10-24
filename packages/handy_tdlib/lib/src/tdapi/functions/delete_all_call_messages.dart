part of '../tdapi.dart';

/// **DeleteAllCallMessages** *(deleteAllCallMessages)* - TDLib function
///
/// Deletes all call messages.
///
/// * [revoke]: Pass true to delete the messages for all users.
///
/// [Ok] is returned on completion.
final class DeleteAllCallMessages extends TdFunction {
  /// **DeleteAllCallMessages** *(deleteAllCallMessages)* - TDLib function
  ///
  /// Deletes all call messages.
  ///
  /// * [revoke]: Pass true to delete the messages for all users.
  ///
  /// [Ok] is returned on completion.
  const DeleteAllCallMessages({
    required this.revoke,
  });

  /// Pass true to delete the messages for all users
  final bool revoke;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [revoke]: Pass true to delete the messages for all users
  DeleteAllCallMessages copyWith({
    bool? revoke,
  }) =>
      DeleteAllCallMessages(
        revoke: revoke ?? this.revoke,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteAllCallMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
