part of '../tdapi.dart';

/// **LoadSavedMessagesTopics** *(loadSavedMessagesTopics)* - TDLib function
///
/// Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded.
///
/// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
///
/// [Ok] is returned on completion.
final class LoadSavedMessagesTopics extends TdFunction {
  /// **LoadSavedMessagesTopics** *(loadSavedMessagesTopics)* - TDLib function
  ///
  /// Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded.
  ///
  /// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
  ///
  /// [Ok] is returned on completion.
  const LoadSavedMessagesTopics({
    required this.limit,
  });

  /// The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  LoadSavedMessagesTopics copyWith({
    int? limit,
  }) =>
      LoadSavedMessagesTopics(
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadSavedMessagesTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
