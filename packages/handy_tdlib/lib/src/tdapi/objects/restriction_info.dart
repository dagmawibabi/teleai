part of '../tdapi.dart';

/// **RestrictionInfo** *(restrictionInfo)* - basic class
///
/// Contains information about restrictions that must be applied to a chat or a message.
///
/// * [restrictionReason]: A human-readable description of the reason why access to the content must be restricted. If empty, then the content can be accessed,. but may be covered by hidden with 18+ spoiler anyway.
/// * [hasSensitiveContent]: True, if media content of the messages must be hidden with 18+ spoiler.. Use value of the option "can_ignore_sensitive_content_restrictions" to check whether the current user can ignore the restriction.. If age verification parameters were received in updateAgeVerificationParameters, then the user must complete age verification to ignore the restriction.. Set the option "ignore_sensitive_content_restrictions" to true if the user passes age verification.
final class RestrictionInfo extends TdObject {
  /// **RestrictionInfo** *(restrictionInfo)* - basic class
  ///
  /// Contains information about restrictions that must be applied to a chat or a message.
  ///
  /// * [restrictionReason]: A human-readable description of the reason why access to the content must be restricted. If empty, then the content can be accessed,. but may be covered by hidden with 18+ spoiler anyway.
  /// * [hasSensitiveContent]: True, if media content of the messages must be hidden with 18+ spoiler.. Use value of the option "can_ignore_sensitive_content_restrictions" to check whether the current user can ignore the restriction.. If age verification parameters were received in updateAgeVerificationParameters, then the user must complete age verification to ignore the restriction.. Set the option "ignore_sensitive_content_restrictions" to true if the user passes age verification.
  const RestrictionInfo({
    required this.restrictionReason,
    required this.hasSensitiveContent,
  });

  /// A human-readable description of the reason why access to the content must be restricted. If empty, then the content can be accessed,. but may be covered by hidden with 18+ spoiler anyway
  final String restrictionReason;

  /// True, if media content of the messages must be hidden with 18+ spoiler.. Use value of the option "can_ignore_sensitive_content_restrictions" to check whether the current user can ignore the restriction.. If age verification parameters were received in updateAgeVerificationParameters, then the user must complete age verification to ignore the restriction.. Set the option "ignore_sensitive_content_restrictions" to true if the user passes age verification
  final bool hasSensitiveContent;

  /// Parse from a json
  factory RestrictionInfo.fromJson(Map<String, dynamic> json) =>
      RestrictionInfo(
        restrictionReason: json['restriction_reason'],
        hasSensitiveContent: json['has_sensitive_content'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "restriction_reason": restrictionReason,
      "has_sensitive_content": hasSensitiveContent,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [restriction_reason]: A human-readable description of the reason why access to the content must be restricted. If empty, then the content can be accessed,. but may be covered by hidden with 18+ spoiler anyway
  /// * [has_sensitive_content]: True, if media content of the messages must be hidden with 18+ spoiler.. Use value of the option "can_ignore_sensitive_content_restrictions" to check whether the current user can ignore the restriction.. If age verification parameters were received in updateAgeVerificationParameters, then the user must complete age verification to ignore the restriction.. Set the option "ignore_sensitive_content_restrictions" to true if the user passes age verification
  RestrictionInfo copyWith({
    String? restrictionReason,
    bool? hasSensitiveContent,
  }) =>
      RestrictionInfo(
        restrictionReason: restrictionReason ?? this.restrictionReason,
        hasSensitiveContent: hasSensitiveContent ?? this.hasSensitiveContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'restrictionInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
