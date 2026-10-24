part of '../tdapi.dart';

/// **SetFileGenerationProgress** *(setFileGenerationProgress)* - TDLib function
///
/// Informs TDLib on a file generation progress.
///
/// * [generationId]: The identifier of the generation process.
/// * [expectedSize]: Expected size of the generated file, in bytes; 0 if unknown.
/// * [localPrefixSize]: The number of bytes already generated.
///
/// [Ok] is returned on completion.
final class SetFileGenerationProgress extends TdFunction {
  /// **SetFileGenerationProgress** *(setFileGenerationProgress)* - TDLib function
  ///
  /// Informs TDLib on a file generation progress.
  ///
  /// * [generationId]: The identifier of the generation process.
  /// * [expectedSize]: Expected size of the generated file, in bytes; 0 if unknown.
  /// * [localPrefixSize]: The number of bytes already generated.
  ///
  /// [Ok] is returned on completion.
  const SetFileGenerationProgress({
    required this.generationId,
    required this.expectedSize,
    required this.localPrefixSize,
  });

  /// The identifier of the generation process
  final int generationId;

  /// Expected size of the generated file, in bytes; 0 if unknown
  final int expectedSize;

  /// The number of bytes already generated
  final int localPrefixSize;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "generation_id": generationId,
      "expected_size": expectedSize,
      "local_prefix_size": localPrefixSize,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [generation_id]: The identifier of the generation process
  /// * [expected_size]: Expected size of the generated file, in bytes; 0 if unknown
  /// * [local_prefix_size]: The number of bytes already generated
  SetFileGenerationProgress copyWith({
    int? generationId,
    int? expectedSize,
    int? localPrefixSize,
  }) =>
      SetFileGenerationProgress(
        generationId: generationId ?? this.generationId,
        expectedSize: expectedSize ?? this.expectedSize,
        localPrefixSize: localPrefixSize ?? this.localPrefixSize,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setFileGenerationProgress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
