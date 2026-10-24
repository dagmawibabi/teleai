part of '../tdapi.dart';

/// **FinishFileGeneration** *(finishFileGeneration)* - TDLib function
///
/// Finishes the file generation.
///
/// * [generationId]: The identifier of the generation process.
/// * [error]: If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded *(optional)*.
///
/// [Ok] is returned on completion.
final class FinishFileGeneration extends TdFunction {
  /// **FinishFileGeneration** *(finishFileGeneration)* - TDLib function
  ///
  /// Finishes the file generation.
  ///
  /// * [generationId]: The identifier of the generation process.
  /// * [error]: If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const FinishFileGeneration({
    required this.generationId,
    this.error,
  });

  /// The identifier of the generation process
  final int generationId;

  /// If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
  final TdError? error;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "generation_id": generationId,
      "error": error?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [generation_id]: The identifier of the generation process
  /// * [error]: If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
  FinishFileGeneration copyWith({
    int? generationId,
    TdError? error,
  }) =>
      FinishFileGeneration(
        generationId: generationId ?? this.generationId,
        error: error ?? this.error,
      );

  /// TDLib object type
  static const String defaultObjectId = 'finishFileGeneration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
