part of '../tdapi.dart';

/// **StoryList** *(storyList)* - parent
///
/// Describes a list of stories.
sealed class StoryList extends TdObject {
  /// **StoryList** *(storyList)* - parent
  ///
  /// Describes a list of stories.
  const StoryList();

  /// a StoryList return type can be :
  /// * [StoryListMain]
  /// * [StoryListArchive]
  factory StoryList.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryListMain.defaultObjectId:
        return StoryListMain.fromJson(json);
      case StoryListArchive.defaultObjectId:
        return StoryListArchive.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryList)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryList copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryListMain** *(storyListMain)* - child of StoryList
///
/// The list of stories, shown in the main chat list and folder chat lists.
final class StoryListMain extends StoryList {
  /// **StoryListMain** *(storyListMain)* - child of StoryList
  ///
  /// The list of stories, shown in the main chat list and folder chat lists.
  const StoryListMain();

  /// Parse from a json
  factory StoryListMain.fromJson(Map<String, dynamic> json) =>
      const StoryListMain();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryListMain copyWith() => const StoryListMain();

  /// TDLib object type
  static const String defaultObjectId = 'storyListMain';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryListArchive** *(storyListArchive)* - child of StoryList
///
/// The list of stories, shown in the Archive chat list.
final class StoryListArchive extends StoryList {
  /// **StoryListArchive** *(storyListArchive)* - child of StoryList
  ///
  /// The list of stories, shown in the Archive chat list.
  const StoryListArchive();

  /// Parse from a json
  factory StoryListArchive.fromJson(Map<String, dynamic> json) =>
      const StoryListArchive();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryListArchive copyWith() => const StoryListArchive();

  /// TDLib object type
  static const String defaultObjectId = 'storyListArchive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
