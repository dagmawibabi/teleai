part of '../tdapi.dart';

/// **SetMainProfileTab** *(setMainProfileTab)* - TDLib function
///
/// Changes the main profile tab of the current user.
///
/// * [mainProfileTab]: The new value of the main profile tab.
///
/// [Ok] is returned on completion.
final class SetMainProfileTab extends TdFunction {
  /// **SetMainProfileTab** *(setMainProfileTab)* - TDLib function
  ///
  /// Changes the main profile tab of the current user.
  ///
  /// * [mainProfileTab]: The new value of the main profile tab.
  ///
  /// [Ok] is returned on completion.
  const SetMainProfileTab({
    required this.mainProfileTab,
  });

  /// The new value of the main profile tab
  final ProfileTab mainProfileTab;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "main_profile_tab": mainProfileTab.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [main_profile_tab]: The new value of the main profile tab
  SetMainProfileTab copyWith({
    ProfileTab? mainProfileTab,
  }) =>
      SetMainProfileTab(
        mainProfileTab: mainProfileTab ?? this.mainProfileTab,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMainProfileTab';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
