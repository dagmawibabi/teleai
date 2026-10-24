part of '../tdapi.dart';

/// **GetBusinessAccountStarAmount** *(getBusinessAccountStarAmount)* - TDLib function
///
/// Returns the Telegram Star amount owned by a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
///
/// [StarAmount] is returned on completion.
final class GetBusinessAccountStarAmount extends TdFunction {
  /// **GetBusinessAccountStarAmount** *(getBusinessAccountStarAmount)* - TDLib function
  ///
  /// Returns the Telegram Star amount owned by a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  ///
  /// [StarAmount] is returned on completion.
  const GetBusinessAccountStarAmount({
    required this.businessConnectionId,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  GetBusinessAccountStarAmount copyWith({
    String? businessConnectionId,
  }) =>
      GetBusinessAccountStarAmount(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessAccountStarAmount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
