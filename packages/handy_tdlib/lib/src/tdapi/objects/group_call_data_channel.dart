part of '../tdapi.dart';

/// **GroupCallDataChannel** *(groupCallDataChannel)* - parent
///
/// Describes data channel for a group call.
sealed class GroupCallDataChannel extends TdObject {
  /// **GroupCallDataChannel** *(groupCallDataChannel)* - parent
  ///
  /// Describes data channel for a group call.
  const GroupCallDataChannel();

  /// a GroupCallDataChannel return type can be :
  /// * [GroupCallDataChannelMain]
  /// * [GroupCallDataChannelScreenSharing]
  factory GroupCallDataChannel.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GroupCallDataChannelMain.defaultObjectId:
        return GroupCallDataChannelMain.fromJson(json);
      case GroupCallDataChannelScreenSharing.defaultObjectId:
        return GroupCallDataChannelScreenSharing.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GroupCallDataChannel)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GroupCallDataChannel copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'groupCallDataChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GroupCallDataChannelMain** *(groupCallDataChannelMain)* - child of GroupCallDataChannel
///
/// The main data channel for audio and video data.
final class GroupCallDataChannelMain extends GroupCallDataChannel {
  /// **GroupCallDataChannelMain** *(groupCallDataChannelMain)* - child of GroupCallDataChannel
  ///
  /// The main data channel for audio and video data.
  const GroupCallDataChannelMain();

  /// Parse from a json
  factory GroupCallDataChannelMain.fromJson(Map<String, dynamic> json) =>
      const GroupCallDataChannelMain();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GroupCallDataChannelMain copyWith() => const GroupCallDataChannelMain();

  /// TDLib object type
  static const String defaultObjectId = 'groupCallDataChannelMain';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GroupCallDataChannelScreenSharing** *(groupCallDataChannelScreenSharing)* - child of GroupCallDataChannel
///
/// The data channel for screen sharing.
final class GroupCallDataChannelScreenSharing extends GroupCallDataChannel {
  /// **GroupCallDataChannelScreenSharing** *(groupCallDataChannelScreenSharing)* - child of GroupCallDataChannel
  ///
  /// The data channel for screen sharing.
  const GroupCallDataChannelScreenSharing();

  /// Parse from a json
  factory GroupCallDataChannelScreenSharing.fromJson(
          Map<String, dynamic> json) =>
      const GroupCallDataChannelScreenSharing();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GroupCallDataChannelScreenSharing copyWith() =>
      const GroupCallDataChannelScreenSharing();

  /// TDLib object type
  static const String defaultObjectId = 'groupCallDataChannelScreenSharing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
