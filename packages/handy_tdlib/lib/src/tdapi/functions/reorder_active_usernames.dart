part of '../tdapi.dart';

/// **ReorderActiveUsernames** *(reorderActiveUsernames)* - TDLib function
///
/// Changes order of active usernames of the current user.
///
/// * [usernames]: The new order of active usernames. All currently active usernames must be specified.
///
/// [Ok] is returned on completion.
final class ReorderActiveUsernames extends TdFunction {
  /// **ReorderActiveUsernames** *(reorderActiveUsernames)* - TDLib function
  ///
  /// Changes order of active usernames of the current user.
  ///
  /// * [usernames]: The new order of active usernames. All currently active usernames must be specified.
  ///
  /// [Ok] is returned on completion.
  const ReorderActiveUsernames({
    required this.usernames,
  });

  /// The new order of active usernames. All currently active usernames must be specified
  final List<String> usernames;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "usernames": usernames.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [usernames]: The new order of active usernames. All currently active usernames must be specified
  ReorderActiveUsernames copyWith({
    List<String>? usernames,
  }) =>
      ReorderActiveUsernames(
        usernames: usernames ?? this.usernames,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderActiveUsernames';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
