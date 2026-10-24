part of '../tdapi.dart';

/// **GetWebAppPlaceholder** *(getWebAppPlaceholder)* - TDLib function
///
/// Returns a default placeholder for Web Apps of a bot. This is an offline method. Returns a 404 error if the placeholder isn't known.
///
/// * [botUserId]: Identifier of the target bot.
///
/// [Outline] is returned on completion.
final class GetWebAppPlaceholder extends TdFunction {
  /// **GetWebAppPlaceholder** *(getWebAppPlaceholder)* - TDLib function
  ///
  /// Returns a default placeholder for Web Apps of a bot. This is an offline method. Returns a 404 error if the placeholder isn't known.
  ///
  /// * [botUserId]: Identifier of the target bot.
  ///
  /// [Outline] is returned on completion.
  const GetWebAppPlaceholder({
    required this.botUserId,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  GetWebAppPlaceholder copyWith({
    int? botUserId,
  }) =>
      GetWebAppPlaceholder(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getWebAppPlaceholder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
