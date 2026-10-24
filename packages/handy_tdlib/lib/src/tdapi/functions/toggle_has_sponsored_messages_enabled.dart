part of '../tdapi.dart';

/// **ToggleHasSponsoredMessagesEnabled** *(toggleHasSponsoredMessagesEnabled)* - TDLib function
///
/// Toggles whether the current user has sponsored messages enabled. The setting has no effect for users without Telegram Premium for which sponsored messages are always enabled.
///
/// * [hasSponsoredMessagesEnabled]: Pass true to enable sponsored messages for the current user; false to disable them.
///
/// [Ok] is returned on completion.
final class ToggleHasSponsoredMessagesEnabled extends TdFunction {
  /// **ToggleHasSponsoredMessagesEnabled** *(toggleHasSponsoredMessagesEnabled)* - TDLib function
  ///
  /// Toggles whether the current user has sponsored messages enabled. The setting has no effect for users without Telegram Premium for which sponsored messages are always enabled.
  ///
  /// * [hasSponsoredMessagesEnabled]: Pass true to enable sponsored messages for the current user; false to disable them.
  ///
  /// [Ok] is returned on completion.
  const ToggleHasSponsoredMessagesEnabled({
    required this.hasSponsoredMessagesEnabled,
  });

  /// Pass true to enable sponsored messages for the current user; false to disable them
  final bool hasSponsoredMessagesEnabled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "has_sponsored_messages_enabled": hasSponsoredMessagesEnabled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_sponsored_messages_enabled]: Pass true to enable sponsored messages for the current user; false to disable them
  ToggleHasSponsoredMessagesEnabled copyWith({
    bool? hasSponsoredMessagesEnabled,
  }) =>
      ToggleHasSponsoredMessagesEnabled(
        hasSponsoredMessagesEnabled:
            hasSponsoredMessagesEnabled ?? this.hasSponsoredMessagesEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleHasSponsoredMessagesEnabled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
