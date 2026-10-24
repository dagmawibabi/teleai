part of 'tdapi.dart';

/// Base object in this plugin. Use TdFunction's children classes
/// to construct TDLib function.
sealed class TdFunction {
  /// Get TDLib object type for class instance
  String get currentObjectId => "function";

  /// Unused constructor
  const TdFunction();

  /// Convert model to TDLib JSON format
  Map<String, dynamic> toJson([dynamic extra]);
}
