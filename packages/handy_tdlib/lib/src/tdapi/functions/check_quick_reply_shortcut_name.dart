part of '../tdapi.dart';

/// **CheckQuickReplyShortcutName** *(checkQuickReplyShortcutName)* - TDLib function
///
/// Checks validness of a name for a quick reply shortcut. Can be called synchronously.
///
/// * [name]: The name of the shortcut; 1-32 characters.
///
/// [Ok] is returned on completion.
final class CheckQuickReplyShortcutName extends TdFunction {
  /// **CheckQuickReplyShortcutName** *(checkQuickReplyShortcutName)* - TDLib function
  ///
  /// Checks validness of a name for a quick reply shortcut. Can be called synchronously.
  ///
  /// * [name]: The name of the shortcut; 1-32 characters.
  ///
  /// [Ok] is returned on completion.
  const CheckQuickReplyShortcutName({
    required this.name,
  });

  /// The name of the shortcut; 1-32 characters
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: The name of the shortcut; 1-32 characters
  CheckQuickReplyShortcutName copyWith({
    String? name,
  }) =>
      CheckQuickReplyShortcutName(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkQuickReplyShortcutName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
