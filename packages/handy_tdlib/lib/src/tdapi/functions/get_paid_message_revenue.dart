part of '../tdapi.dart';

/// **GetPaidMessageRevenue** *(getPaidMessageRevenue)* - TDLib function
///
/// Returns the total number of Telegram Stars received by the current user for paid messages from the given user.
///
/// * [userId]: Identifier of the user.
///
/// [StarCount] is returned on completion.
final class GetPaidMessageRevenue extends TdFunction {
  /// **GetPaidMessageRevenue** *(getPaidMessageRevenue)* - TDLib function
  ///
  /// Returns the total number of Telegram Stars received by the current user for paid messages from the given user.
  ///
  /// * [userId]: Identifier of the user.
  ///
  /// [StarCount] is returned on completion.
  const GetPaidMessageRevenue({
    required this.userId,
  });

  /// Identifier of the user
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  GetPaidMessageRevenue copyWith({
    int? userId,
  }) =>
      GetPaidMessageRevenue(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPaidMessageRevenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
