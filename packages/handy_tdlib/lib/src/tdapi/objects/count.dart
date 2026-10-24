part of '../tdapi.dart';

/// **Count** *(count)* - basic class
///
/// Contains a counter.
///
/// * [count]: Count.
final class Count extends TdObject {
  /// **Count** *(count)* - basic class
  ///
  /// Contains a counter.
  ///
  /// * [count]: Count.
  const Count({
    required this.count,
    this.extra,
    this.clientId,
  });

  /// Count
  final int count;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Count.fromJson(Map<String, dynamic> json) => Count(
        count: json['count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "count": count,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [count]: Count
  Count copyWith({
    int? count,
    dynamic extra,
    int? clientId,
  }) =>
      Count(
        count: count ?? this.count,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'count';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
