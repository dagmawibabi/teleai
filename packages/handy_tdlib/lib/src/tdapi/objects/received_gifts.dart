part of '../tdapi.dart';

/// **ReceivedGifts** *(receivedGifts)* - basic class
///
/// Represents a list of gifts received by a user or a chat.
///
/// * [totalCount]: The total number of received gifts.
/// * [gifts]: The list of gifts.
/// * [areNotificationsEnabled]: True, if notifications about new gifts of the owner are enabled.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class ReceivedGifts extends TdObject {
  /// **ReceivedGifts** *(receivedGifts)* - basic class
  ///
  /// Represents a list of gifts received by a user or a chat.
  ///
  /// * [totalCount]: The total number of received gifts.
  /// * [gifts]: The list of gifts.
  /// * [areNotificationsEnabled]: True, if notifications about new gifts of the owner are enabled.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const ReceivedGifts({
    required this.totalCount,
    required this.gifts,
    required this.areNotificationsEnabled,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total number of received gifts
  final int totalCount;

  /// The list of gifts
  final List<ReceivedGift> gifts;

  /// True, if notifications about new gifts of the owner are enabled
  final bool areNotificationsEnabled;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ReceivedGifts.fromJson(Map<String, dynamic> json) => ReceivedGifts(
        totalCount: json['total_count'],
        gifts: List<ReceivedGift>.from((json['gifts'] ?? [])
            .map((item) => ReceivedGift.fromJson(item))
            .toList()),
        areNotificationsEnabled: json['are_notifications_enabled'],
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "gifts": gifts.map((i) => i.toJson()).toList(),
      "are_notifications_enabled": areNotificationsEnabled,
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: The total number of received gifts
  /// * [gifts]: The list of gifts
  /// * [are_notifications_enabled]: True, if notifications about new gifts of the owner are enabled
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  ReceivedGifts copyWith({
    int? totalCount,
    List<ReceivedGift>? gifts,
    bool? areNotificationsEnabled,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      ReceivedGifts(
        totalCount: totalCount ?? this.totalCount,
        gifts: gifts ?? this.gifts,
        areNotificationsEnabled:
            areNotificationsEnabled ?? this.areNotificationsEnabled,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'receivedGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
