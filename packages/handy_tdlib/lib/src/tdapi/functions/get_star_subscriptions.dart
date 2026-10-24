part of '../tdapi.dart';

/// **GetStarSubscriptions** *(getStarSubscriptions)* - TDLib function
///
/// Returns the list of Telegram Star subscriptions for the current user.
///
/// * [onlyExpiring]: Pass true to receive only expiring subscriptions for which there aren't enough Telegram Stars to extend.
/// * [offset]: Offset of the first subscription to return as received from the previous request; use empty string to get the first chunk of results.
///
/// [StarSubscriptions] is returned on completion.
final class GetStarSubscriptions extends TdFunction {
  /// **GetStarSubscriptions** *(getStarSubscriptions)* - TDLib function
  ///
  /// Returns the list of Telegram Star subscriptions for the current user.
  ///
  /// * [onlyExpiring]: Pass true to receive only expiring subscriptions for which there aren't enough Telegram Stars to extend.
  /// * [offset]: Offset of the first subscription to return as received from the previous request; use empty string to get the first chunk of results.
  ///
  /// [StarSubscriptions] is returned on completion.
  const GetStarSubscriptions({
    required this.onlyExpiring,
    required this.offset,
  });

  /// Pass true to receive only expiring subscriptions for which there aren't enough Telegram Stars to extend
  final bool onlyExpiring;

  /// Offset of the first subscription to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "only_expiring": onlyExpiring,
      "offset": offset,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [only_expiring]: Pass true to receive only expiring subscriptions for which there aren't enough Telegram Stars to extend
  /// * [offset]: Offset of the first subscription to return as received from the previous request; use empty string to get the first chunk of results
  GetStarSubscriptions copyWith({
    bool? onlyExpiring,
    String? offset,
  }) =>
      GetStarSubscriptions(
        onlyExpiring: onlyExpiring ?? this.onlyExpiring,
        offset: offset ?? this.offset,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStarSubscriptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
