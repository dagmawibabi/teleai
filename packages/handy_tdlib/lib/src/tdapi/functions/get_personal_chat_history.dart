part of '../tdapi.dart';

/// **GetPersonalChatHistory** *(getPersonalChatHistory)* - TDLib function
///
/// Returns messages in the personal chat of a given user; for bots only.
///
/// * [userId]: User identifier.
/// * [limit]: The maximum number of messages to be returned; 1-20.
///
/// [Messages] is returned on completion.
final class GetPersonalChatHistory extends TdFunction {
  /// **GetPersonalChatHistory** *(getPersonalChatHistory)* - TDLib function
  ///
  /// Returns messages in the personal chat of a given user; for bots only.
  ///
  /// * [userId]: User identifier.
  /// * [limit]: The maximum number of messages to be returned; 1-20.
  ///
  /// [Messages] is returned on completion.
  const GetPersonalChatHistory({
    required this.userId,
    required this.limit,
  });

  /// User identifier
  final int userId;

  /// The maximum number of messages to be returned; 1-20
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [limit]: The maximum number of messages to be returned; 1-20
  GetPersonalChatHistory copyWith({
    int? userId,
    int? limit,
  }) =>
      GetPersonalChatHistory(
        userId: userId ?? this.userId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPersonalChatHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
