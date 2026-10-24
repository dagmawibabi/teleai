part of '../tdapi.dart';

/// **WriteGeneratedFilePart** *(writeGeneratedFilePart)* - TDLib function
///
/// Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file.
///
/// * [generationId]: The identifier of the generation process.
/// * [offset]: The offset from which to write the data to the file.
/// * [data]: The data to write.
///
/// [Ok] is returned on completion.
final class WriteGeneratedFilePart extends TdFunction {
  /// **WriteGeneratedFilePart** *(writeGeneratedFilePart)* - TDLib function
  ///
  /// Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file.
  ///
  /// * [generationId]: The identifier of the generation process.
  /// * [offset]: The offset from which to write the data to the file.
  /// * [data]: The data to write.
  ///
  /// [Ok] is returned on completion.
  const WriteGeneratedFilePart({
    required this.generationId,
    required this.offset,
    required this.data,
  });

  /// The identifier of the generation process
  final int generationId;

  /// The offset from which to write the data to the file
  final int offset;

  /// The data to write
  final String data;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "generation_id": generationId,
      "offset": offset,
      "data": data,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [generation_id]: The identifier of the generation process
  /// * [offset]: The offset from which to write the data to the file
  /// * [data]: The data to write
  WriteGeneratedFilePart copyWith({
    int? generationId,
    int? offset,
    String? data,
  }) =>
      WriteGeneratedFilePart(
        generationId: generationId ?? this.generationId,
        offset: offset ?? this.offset,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'writeGeneratedFilePart';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
