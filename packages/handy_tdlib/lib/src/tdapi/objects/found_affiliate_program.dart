part of '../tdapi.dart';

/// **FoundAffiliateProgram** *(foundAffiliateProgram)* - basic class
///
/// Describes a found affiliate program.
///
/// * [botUserId]: User identifier of the bot that created the program.
/// * [info]: Information about the affiliate program.
final class FoundAffiliateProgram extends TdObject {
  /// **FoundAffiliateProgram** *(foundAffiliateProgram)* - basic class
  ///
  /// Describes a found affiliate program.
  ///
  /// * [botUserId]: User identifier of the bot that created the program.
  /// * [info]: Information about the affiliate program.
  const FoundAffiliateProgram({
    required this.botUserId,
    required this.info,
  });

  /// User identifier of the bot that created the program
  final int botUserId;

  /// Information about the affiliate program
  final AffiliateProgramInfo info;

  /// Parse from a json
  factory FoundAffiliateProgram.fromJson(Map<String, dynamic> json) =>
      FoundAffiliateProgram(
        botUserId: json['bot_user_id'],
        info: AffiliateProgramInfo.fromJson(json['info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "info": info.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot that created the program
  /// * [info]: Information about the affiliate program
  FoundAffiliateProgram copyWith({
    int? botUserId,
    AffiliateProgramInfo? info,
  }) =>
      FoundAffiliateProgram(
        botUserId: botUserId ?? this.botUserId,
        info: info ?? this.info,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
