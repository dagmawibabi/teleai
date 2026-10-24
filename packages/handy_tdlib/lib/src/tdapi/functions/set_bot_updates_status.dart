part of '../tdapi.dart';

/// **SetBotUpdatesStatus** *(setBotUpdatesStatus)* - TDLib function
///
/// Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only.
///
/// * [pendingUpdateCount]: The number of pending updates.
/// * [errorMessage]: The last error message.
///
/// [Ok] is returned on completion.
final class SetBotUpdatesStatus extends TdFunction {
  /// **SetBotUpdatesStatus** *(setBotUpdatesStatus)* - TDLib function
  ///
  /// Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only.
  ///
  /// * [pendingUpdateCount]: The number of pending updates.
  /// * [errorMessage]: The last error message.
  ///
  /// [Ok] is returned on completion.
  const SetBotUpdatesStatus({
    required this.pendingUpdateCount,
    required this.errorMessage,
  });

  /// The number of pending updates
  final int pendingUpdateCount;

  /// The last error message
  final String errorMessage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "pending_update_count": pendingUpdateCount,
      "error_message": errorMessage,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pending_update_count]: The number of pending updates
  /// * [error_message]: The last error message
  SetBotUpdatesStatus copyWith({
    int? pendingUpdateCount,
    String? errorMessage,
  }) =>
      SetBotUpdatesStatus(
        pendingUpdateCount: pendingUpdateCount ?? this.pendingUpdateCount,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBotUpdatesStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
