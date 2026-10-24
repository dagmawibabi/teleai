part of '../tdapi.dart';

/// **GetConnectedAffiliateProgram** *(getConnectedAffiliateProgram)* - TDLib function
///
/// Returns an affiliate program that was connected to the given affiliate by identifier of the bot that created the program.
///
/// * [affiliate]: The affiliate to which the affiliate program is connected.
/// * [botUserId]: Identifier of the bot that created the program.
///
/// [ConnectedAffiliateProgram] is returned on completion.
final class GetConnectedAffiliateProgram extends TdFunction {
  /// **GetConnectedAffiliateProgram** *(getConnectedAffiliateProgram)* - TDLib function
  ///
  /// Returns an affiliate program that was connected to the given affiliate by identifier of the bot that created the program.
  ///
  /// * [affiliate]: The affiliate to which the affiliate program is connected.
  /// * [botUserId]: Identifier of the bot that created the program.
  ///
  /// [ConnectedAffiliateProgram] is returned on completion.
  const GetConnectedAffiliateProgram({
    required this.affiliate,
    required this.botUserId,
  });

  /// The affiliate to which the affiliate program is connected
  final AffiliateType affiliate;

  /// Identifier of the bot that created the program
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
  /// * [affiliate]: The affiliate to which the affiliate program is connected
  /// * [bot_user_id]: Identifier of the bot that created the program
  GetConnectedAffiliateProgram copyWith({
    AffiliateType? affiliate,
    int? botUserId,
  }) =>
      GetConnectedAffiliateProgram(
        affiliate: affiliate ?? this.affiliate,
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getConnectedAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
