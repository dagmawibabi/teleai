part of '../tdapi.dart';

/// **SetSupergroupMainProfileTab** *(setSupergroupMainProfileTab)* - TDLib function
///
/// Changes the main profile tab of the channel; requires can_change_info administrator right.
///
/// * [supergroupId]: Identifier of the channel.
/// * [mainProfileTab]: The new value of the main profile tab.
///
/// [Ok] is returned on completion.
final class SetSupergroupMainProfileTab extends TdFunction {
  /// **SetSupergroupMainProfileTab** *(setSupergroupMainProfileTab)* - TDLib function
  ///
  /// Changes the main profile tab of the channel; requires can_change_info administrator right.
  ///
  /// * [supergroupId]: Identifier of the channel.
  /// * [mainProfileTab]: The new value of the main profile tab.
  ///
  /// [Ok] is returned on completion.
  const SetSupergroupMainProfileTab({
    required this.supergroupId,
    required this.mainProfileTab,
  });

  /// Identifier of the channel
  final int supergroupId;

  /// The new value of the main profile tab
  final ProfileTab mainProfileTab;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "main_profile_tab": mainProfileTab.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the channel
  /// * [main_profile_tab]: The new value of the main profile tab
  SetSupergroupMainProfileTab copyWith({
    int? supergroupId,
    ProfileTab? mainProfileTab,
  }) =>
      SetSupergroupMainProfileTab(
        supergroupId: supergroupId ?? this.supergroupId,
        mainProfileTab: mainProfileTab ?? this.mainProfileTab,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSupergroupMainProfileTab';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
