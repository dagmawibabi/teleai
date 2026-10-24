part of '../tdapi.dart';

/// **DiffEntity** *(diffEntity)* - basic class
///
/// Represents a change of a text.
///
/// * [offset]: Offset of the entity, in UTF-16 code units.
/// * [length]: Length of the entity, in UTF-16 code units.
/// * [type]: Type of the entity.
final class DiffEntity extends TdObject {
  /// **DiffEntity** *(diffEntity)* - basic class
  ///
  /// Represents a change of a text.
  ///
  /// * [offset]: Offset of the entity, in UTF-16 code units.
  /// * [length]: Length of the entity, in UTF-16 code units.
  /// * [type]: Type of the entity.
  const DiffEntity({
    required this.offset,
    required this.length,
    required this.type,
  });

  /// Offset of the entity, in UTF-16 code units
  final int offset;

  /// Length of the entity, in UTF-16 code units
  final int length;

  /// Type of the entity
  final DiffEntityType type;

  /// Parse from a json
  factory DiffEntity.fromJson(Map<String, dynamic> json) => DiffEntity(
        offset: json['offset'],
        length: json['length'],
        type: DiffEntityType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "offset": offset,
      "length": length,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [offset]: Offset of the entity, in UTF-16 code units
  /// * [length]: Length of the entity, in UTF-16 code units
  /// * [type]: Type of the entity
  DiffEntity copyWith({
    int? offset,
    int? length,
    DiffEntityType? type,
  }) =>
      DiffEntity(
        offset: offset ?? this.offset,
        length: length ?? this.length,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'diffEntity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
