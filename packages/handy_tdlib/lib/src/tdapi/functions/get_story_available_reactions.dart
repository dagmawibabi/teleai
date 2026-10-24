part of '../tdapi.dart';

/// **GetStoryAvailableReactions** *(getStoryAvailableReactions)* - TDLib function
///
/// Returns reactions, which can be chosen for a story.
///
/// * [rowSize]: Number of reactions per row, 5-25.
///
/// [AvailableReactions] is returned on completion.
final class GetStoryAvailableReactions extends TdFunction {
  /// **GetStoryAvailableReactions** *(getStoryAvailableReactions)* - TDLib function
  ///
  /// Returns reactions, which can be chosen for a story.
  ///
  /// * [rowSize]: Number of reactions per row, 5-25.
  ///
  /// [AvailableReactions] is returned on completion.
  const GetStoryAvailableReactions({
    required this.rowSize,
  });

  /// Number of reactions per row, 5-25
  final int rowSize;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "row_size": rowSize,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [row_size]: Number of reactions per row, 5-25
  GetStoryAvailableReactions copyWith({
    int? rowSize,
  }) =>
      GetStoryAvailableReactions(
        rowSize: rowSize ?? this.rowSize,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStoryAvailableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
