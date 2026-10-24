part of '../tdapi.dart';

/// **ToggleSupergroupIsAllHistoryAvailable** *(toggleSupergroupIsAllHistoryAvailable)* - TDLib function
///
/// Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right.
///
/// * [supergroupId]: The identifier of the supergroup.
/// * [isAllHistoryAvailable]: The new value of is_all_history_available.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupIsAllHistoryAvailable extends TdFunction {
  /// **ToggleSupergroupIsAllHistoryAvailable** *(toggleSupergroupIsAllHistoryAvailable)* - TDLib function
  ///
  /// Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right.
  ///
  /// * [supergroupId]: The identifier of the supergroup.
  /// * [isAllHistoryAvailable]: The new value of is_all_history_available.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupIsAllHistoryAvailable({
    required this.supergroupId,
    required this.isAllHistoryAvailable,
  });

  /// The identifier of the supergroup
  final int supergroupId;

  /// The new value of is_all_history_available
  final bool isAllHistoryAvailable;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "is_all_history_available": isAllHistoryAvailable,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: The identifier of the supergroup
  /// * [is_all_history_available]: The new value of is_all_history_available
  ToggleSupergroupIsAllHistoryAvailable copyWith({
    int? supergroupId,
    bool? isAllHistoryAvailable,
  }) =>
      ToggleSupergroupIsAllHistoryAvailable(
        supergroupId: supergroupId ?? this.supergroupId,
        isAllHistoryAvailable:
            isAllHistoryAvailable ?? this.isAllHistoryAvailable,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupIsAllHistoryAvailable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
