part of '../tdapi.dart';

/// **SetBusinessStartPage** *(setBusinessStartPage)* - TDLib function
///
/// Changes the business start page of the current user. Requires Telegram Business subscription.
///
/// * [startPage]: The new start page of the business; pass null to remove custom start page *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBusinessStartPage extends TdFunction {
  /// **SetBusinessStartPage** *(setBusinessStartPage)* - TDLib function
  ///
  /// Changes the business start page of the current user. Requires Telegram Business subscription.
  ///
  /// * [startPage]: The new start page of the business; pass null to remove custom start page *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessStartPage({
    this.startPage,
  });

  /// The new start page of the business; pass null to remove custom start page
  final InputBusinessStartPage? startPage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "start_page": startPage?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_page]: The new start page of the business; pass null to remove custom start page
  SetBusinessStartPage copyWith({
    InputBusinessStartPage? startPage,
  }) =>
      SetBusinessStartPage(
        startPage: startPage ?? this.startPage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessStartPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
