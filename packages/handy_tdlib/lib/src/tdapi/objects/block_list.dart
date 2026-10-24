part of '../tdapi.dart';

/// **BlockList** *(blockList)* - parent
///
/// Describes type of block list.
sealed class BlockList extends TdObject {
  /// **BlockList** *(blockList)* - parent
  ///
  /// Describes type of block list.
  const BlockList();

  /// a BlockList return type can be :
  /// * [BlockListMain]
  /// * [BlockListStories]
  factory BlockList.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BlockListMain.defaultObjectId:
        return BlockListMain.fromJson(json);
      case BlockListStories.defaultObjectId:
        return BlockListStories.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BlockList)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BlockList copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'blockList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BlockListMain** *(blockListMain)* - child of BlockList
///
/// The main block list that disallows writing messages to the current user, receiving their status and photo, viewing of stories, and some other actions.
final class BlockListMain extends BlockList {
  /// **BlockListMain** *(blockListMain)* - child of BlockList
  ///
  /// The main block list that disallows writing messages to the current user, receiving their status and photo, viewing of stories, and some other actions.
  const BlockListMain();

  /// Parse from a json
  factory BlockListMain.fromJson(Map<String, dynamic> json) =>
      const BlockListMain();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BlockListMain copyWith() => const BlockListMain();

  /// TDLib object type
  static const String defaultObjectId = 'blockListMain';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BlockListStories** *(blockListStories)* - child of BlockList
///
/// The block list that disallows viewing of stories of the current user.
final class BlockListStories extends BlockList {
  /// **BlockListStories** *(blockListStories)* - child of BlockList
  ///
  /// The block list that disallows viewing of stories of the current user.
  const BlockListStories();

  /// Parse from a json
  factory BlockListStories.fromJson(Map<String, dynamic> json) =>
      const BlockListStories();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BlockListStories copyWith() => const BlockListStories();

  /// TDLib object type
  static const String defaultObjectId = 'blockListStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
