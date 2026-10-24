part of '../tdapi.dart';

/// **InviteLinkChatType** *(inviteLinkChatType)* - parent
///
/// Describes the type of chat to which points an invite link.
sealed class InviteLinkChatType extends TdObject {
  /// **InviteLinkChatType** *(inviteLinkChatType)* - parent
  ///
  /// Describes the type of chat to which points an invite link.
  const InviteLinkChatType();

  /// a InviteLinkChatType return type can be :
  /// * [InviteLinkChatTypeBasicGroup]
  /// * [InviteLinkChatTypeSupergroup]
  /// * [InviteLinkChatTypeChannel]
  factory InviteLinkChatType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InviteLinkChatTypeBasicGroup.defaultObjectId:
        return InviteLinkChatTypeBasicGroup.fromJson(json);
      case InviteLinkChatTypeSupergroup.defaultObjectId:
        return InviteLinkChatTypeSupergroup.fromJson(json);
      case InviteLinkChatTypeChannel.defaultObjectId:
        return InviteLinkChatTypeChannel.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InviteLinkChatType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InviteLinkChatType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inviteLinkChatType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteLinkChatTypeBasicGroup** *(inviteLinkChatTypeBasicGroup)* - child of InviteLinkChatType
///
/// The link is an invite link for a basic group.
final class InviteLinkChatTypeBasicGroup extends InviteLinkChatType {
  /// **InviteLinkChatTypeBasicGroup** *(inviteLinkChatTypeBasicGroup)* - child of InviteLinkChatType
  ///
  /// The link is an invite link for a basic group.
  const InviteLinkChatTypeBasicGroup();

  /// Parse from a json
  factory InviteLinkChatTypeBasicGroup.fromJson(Map<String, dynamic> json) =>
      const InviteLinkChatTypeBasicGroup();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InviteLinkChatTypeBasicGroup copyWith() =>
      const InviteLinkChatTypeBasicGroup();

  /// TDLib object type
  static const String defaultObjectId = 'inviteLinkChatTypeBasicGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteLinkChatTypeSupergroup** *(inviteLinkChatTypeSupergroup)* - child of InviteLinkChatType
///
/// The link is an invite link for a supergroup.
final class InviteLinkChatTypeSupergroup extends InviteLinkChatType {
  /// **InviteLinkChatTypeSupergroup** *(inviteLinkChatTypeSupergroup)* - child of InviteLinkChatType
  ///
  /// The link is an invite link for a supergroup.
  const InviteLinkChatTypeSupergroup();

  /// Parse from a json
  factory InviteLinkChatTypeSupergroup.fromJson(Map<String, dynamic> json) =>
      const InviteLinkChatTypeSupergroup();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InviteLinkChatTypeSupergroup copyWith() =>
      const InviteLinkChatTypeSupergroup();

  /// TDLib object type
  static const String defaultObjectId = 'inviteLinkChatTypeSupergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteLinkChatTypeChannel** *(inviteLinkChatTypeChannel)* - child of InviteLinkChatType
///
/// The link is an invite link for a channel.
final class InviteLinkChatTypeChannel extends InviteLinkChatType {
  /// **InviteLinkChatTypeChannel** *(inviteLinkChatTypeChannel)* - child of InviteLinkChatType
  ///
  /// The link is an invite link for a channel.
  const InviteLinkChatTypeChannel();

  /// Parse from a json
  factory InviteLinkChatTypeChannel.fromJson(Map<String, dynamic> json) =>
      const InviteLinkChatTypeChannel();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InviteLinkChatTypeChannel copyWith() => const InviteLinkChatTypeChannel();

  /// TDLib object type
  static const String defaultObjectId = 'inviteLinkChatTypeChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
