part of '../tdapi.dart';

/// **FoundPosition** *(foundPosition)* - basic class
///
/// Contains 0-based match position.
///
/// * [position]: The position of the match.
final class FoundPosition extends TdObject {
  /// **FoundPosition** *(foundPosition)* - basic class
  ///
  /// Contains 0-based match position.
  ///
  /// * [position]: The position of the match.
  const FoundPosition({
    required this.position,
    this.extra,
    this.clientId,
  });

  /// The position of the match
  final int position;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundPosition.fromJson(Map<String, dynamic> json) => FoundPosition(
        position: json['position'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "position": position,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [position]: The position of the match
  FoundPosition copyWith({
    int? position,
    dynamic extra,
    int? clientId,
  }) =>
      FoundPosition(
        position: position ?? this.position,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
