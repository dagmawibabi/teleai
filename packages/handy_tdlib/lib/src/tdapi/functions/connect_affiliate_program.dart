part of '../tdapi.dart';

/// **ConnectAffiliateProgram** *(connectAffiliateProgram)* - TDLib function
///
/// Connects an affiliate program to the given affiliate. Returns information about the connected affiliate program.
///
/// * [affiliate]: The affiliate to which the affiliate program will be connected.
/// * [botUserId]: Identifier of the bot, which affiliate program is connected.
///
/// [ConnectedAffiliateProgram] is returned on completion.
final class ConnectAffiliateProgram extends TdFunction {
  /// **ConnectAffiliateProgram** *(connectAffiliateProgram)* - TDLib function
  ///
  /// Connects an affiliate program to the given affiliate. Returns information about the connected affiliate program.
  ///
  /// * [affiliate]: The affiliate to which the affiliate program will be connected.
  /// * [botUserId]: Identifier of the bot, which affiliate program is connected.
  ///
  /// [ConnectedAffiliateProgram] is returned on completion.
  const ConnectAffiliateProgram({
    required this.affiliate,
    required this.botUserId,
  });

  /// The affiliate to which the affiliate program will be connected
  final AffiliateType affiliate;

  /// Identifier of the bot, which affiliate program is connected
  final int botUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "affiliate": affiliate.toJson(),
      "bot_user_id": botUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [affiliate]: The affiliate to which the affiliate program will be connected
  /// * [bot_user_id]: Identifier of the bot, which affiliate program is connected
  ConnectAffiliateProgram copyWith({
    AffiliateType? affiliate,
    int? botUserId,
  }) =>
      ConnectAffiliateProgram(
        affiliate: affiliate ?? this.affiliate,
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'connectAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
