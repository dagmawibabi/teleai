part of '../tdapi.dart';

/// **Data** *(data)* - basic class
///
/// Contains some binary data.
///
/// * [data]: Data.
final class Data extends TdObject {
  /// **Data** *(data)* - basic class
  ///
  /// Contains some binary data.
  ///
  /// * [data]: Data.
  const Data({
    required this.data,
    this.extra,
    this.clientId,
  });

  /// Data
  final String data;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json['data'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: Data
  Data copyWith({
    String? data,
    dynamic extra,
    int? clientId,
  }) =>
      Data(
        data: data ?? this.data,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'data';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
