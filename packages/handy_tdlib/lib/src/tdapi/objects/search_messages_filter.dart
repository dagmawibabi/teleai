part of '../tdapi.dart';

/// **SearchMessagesFilter** *(searchMessagesFilter)* - parent
///
/// Represents a filter for message search results.
sealed class SearchMessagesFilter extends TdObject {
  /// **SearchMessagesFilter** *(searchMessagesFilter)* - parent
  ///
  /// Represents a filter for message search results.
  const SearchMessagesFilter();

  /// a SearchMessagesFilter return type can be :
  /// * [SearchMessagesFilterEmpty]
  /// * [SearchMessagesFilterAnimation]
  /// * [SearchMessagesFilterAudio]
  /// * [SearchMessagesFilterDocument]
  /// * [SearchMessagesFilterPhoto]
  /// * [SearchMessagesFilterPoll]
  /// * [SearchMessagesFilterVideo]
  /// * [SearchMessagesFilterVoiceNote]
  /// * [SearchMessagesFilterPhotoAndVideo]
  /// * [SearchMessagesFilterUrl]
  /// * [SearchMessagesFilterChatPhoto]
  /// * [SearchMessagesFilterVideoNote]
  /// * [SearchMessagesFilterVoiceAndVideoNote]
  /// * [SearchMessagesFilterMention]
  /// * [SearchMessagesFilterUnreadMention]
  /// * [SearchMessagesFilterUnreadReaction]
  /// * [SearchMessagesFilterUnreadPollVote]
  /// * [SearchMessagesFilterFailedToSend]
  /// * [SearchMessagesFilterPinned]
  factory SearchMessagesFilter.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SearchMessagesFilterEmpty.defaultObjectId:
        return SearchMessagesFilterEmpty.fromJson(json);
      case SearchMessagesFilterAnimation.defaultObjectId:
        return SearchMessagesFilterAnimation.fromJson(json);
      case SearchMessagesFilterAudio.defaultObjectId:
        return SearchMessagesFilterAudio.fromJson(json);
      case SearchMessagesFilterDocument.defaultObjectId:
        return SearchMessagesFilterDocument.fromJson(json);
      case SearchMessagesFilterPhoto.defaultObjectId:
        return SearchMessagesFilterPhoto.fromJson(json);
      case SearchMessagesFilterPoll.defaultObjectId:
        return SearchMessagesFilterPoll.fromJson(json);
      case SearchMessagesFilterVideo.defaultObjectId:
        return SearchMessagesFilterVideo.fromJson(json);
      case SearchMessagesFilterVoiceNote.defaultObjectId:
        return SearchMessagesFilterVoiceNote.fromJson(json);
      case SearchMessagesFilterPhotoAndVideo.defaultObjectId:
        return SearchMessagesFilterPhotoAndVideo.fromJson(json);
      case SearchMessagesFilterUrl.defaultObjectId:
        return SearchMessagesFilterUrl.fromJson(json);
      case SearchMessagesFilterChatPhoto.defaultObjectId:
        return SearchMessagesFilterChatPhoto.fromJson(json);
      case SearchMessagesFilterVideoNote.defaultObjectId:
        return SearchMessagesFilterVideoNote.fromJson(json);
      case SearchMessagesFilterVoiceAndVideoNote.defaultObjectId:
        return SearchMessagesFilterVoiceAndVideoNote.fromJson(json);
      case SearchMessagesFilterMention.defaultObjectId:
        return SearchMessagesFilterMention.fromJson(json);
      case SearchMessagesFilterUnreadMention.defaultObjectId:
        return SearchMessagesFilterUnreadMention.fromJson(json);
      case SearchMessagesFilterUnreadReaction.defaultObjectId:
        return SearchMessagesFilterUnreadReaction.fromJson(json);
      case SearchMessagesFilterUnreadPollVote.defaultObjectId:
        return SearchMessagesFilterUnreadPollVote.fromJson(json);
      case SearchMessagesFilterFailedToSend.defaultObjectId:
        return SearchMessagesFilterFailedToSend.fromJson(json);
      case SearchMessagesFilterPinned.defaultObjectId:
        return SearchMessagesFilterPinned.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SearchMessagesFilter)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SearchMessagesFilter copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterEmpty** *(searchMessagesFilterEmpty)* - child of SearchMessagesFilter
///
/// Returns all found messages, no filter is applied.
final class SearchMessagesFilterEmpty extends SearchMessagesFilter {
  /// **SearchMessagesFilterEmpty** *(searchMessagesFilterEmpty)* - child of SearchMessagesFilter
  ///
  /// Returns all found messages, no filter is applied.
  const SearchMessagesFilterEmpty();

  /// Parse from a json
  factory SearchMessagesFilterEmpty.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterEmpty();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterEmpty copyWith() => const SearchMessagesFilterEmpty();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterEmpty';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterAnimation** *(searchMessagesFilterAnimation)* - child of SearchMessagesFilter
///
/// Returns only animation messages.
final class SearchMessagesFilterAnimation extends SearchMessagesFilter {
  /// **SearchMessagesFilterAnimation** *(searchMessagesFilterAnimation)* - child of SearchMessagesFilter
  ///
  /// Returns only animation messages.
  const SearchMessagesFilterAnimation();

  /// Parse from a json
  factory SearchMessagesFilterAnimation.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterAnimation();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterAnimation copyWith() =>
      const SearchMessagesFilterAnimation();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterAudio** *(searchMessagesFilterAudio)* - child of SearchMessagesFilter
///
/// Returns only audio messages.
final class SearchMessagesFilterAudio extends SearchMessagesFilter {
  /// **SearchMessagesFilterAudio** *(searchMessagesFilterAudio)* - child of SearchMessagesFilter
  ///
  /// Returns only audio messages.
  const SearchMessagesFilterAudio();

  /// Parse from a json
  factory SearchMessagesFilterAudio.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterAudio();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterAudio copyWith() => const SearchMessagesFilterAudio();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterDocument** *(searchMessagesFilterDocument)* - child of SearchMessagesFilter
///
/// Returns only document messages.
final class SearchMessagesFilterDocument extends SearchMessagesFilter {
  /// **SearchMessagesFilterDocument** *(searchMessagesFilterDocument)* - child of SearchMessagesFilter
  ///
  /// Returns only document messages.
  const SearchMessagesFilterDocument();

  /// Parse from a json
  factory SearchMessagesFilterDocument.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterDocument();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterDocument copyWith() =>
      const SearchMessagesFilterDocument();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterPhoto** *(searchMessagesFilterPhoto)* - child of SearchMessagesFilter
///
/// Returns only photo messages.
final class SearchMessagesFilterPhoto extends SearchMessagesFilter {
  /// **SearchMessagesFilterPhoto** *(searchMessagesFilterPhoto)* - child of SearchMessagesFilter
  ///
  /// Returns only photo messages.
  const SearchMessagesFilterPhoto();

  /// Parse from a json
  factory SearchMessagesFilterPhoto.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterPhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterPhoto copyWith() => const SearchMessagesFilterPhoto();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterPoll** *(searchMessagesFilterPoll)* - child of SearchMessagesFilter
///
/// Returns only poll messages.
final class SearchMessagesFilterPoll extends SearchMessagesFilter {
  /// **SearchMessagesFilterPoll** *(searchMessagesFilterPoll)* - child of SearchMessagesFilter
  ///
  /// Returns only poll messages.
  const SearchMessagesFilterPoll();

  /// Parse from a json
  factory SearchMessagesFilterPoll.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterPoll();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterPoll copyWith() => const SearchMessagesFilterPoll();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterPoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterVideo** *(searchMessagesFilterVideo)* - child of SearchMessagesFilter
///
/// Returns only video messages.
final class SearchMessagesFilterVideo extends SearchMessagesFilter {
  /// **SearchMessagesFilterVideo** *(searchMessagesFilterVideo)* - child of SearchMessagesFilter
  ///
  /// Returns only video messages.
  const SearchMessagesFilterVideo();

  /// Parse from a json
  factory SearchMessagesFilterVideo.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterVideo copyWith() => const SearchMessagesFilterVideo();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterVoiceNote** *(searchMessagesFilterVoiceNote)* - child of SearchMessagesFilter
///
/// Returns only voice note messages.
final class SearchMessagesFilterVoiceNote extends SearchMessagesFilter {
  /// **SearchMessagesFilterVoiceNote** *(searchMessagesFilterVoiceNote)* - child of SearchMessagesFilter
  ///
  /// Returns only voice note messages.
  const SearchMessagesFilterVoiceNote();

  /// Parse from a json
  factory SearchMessagesFilterVoiceNote.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterVoiceNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterVoiceNote copyWith() =>
      const SearchMessagesFilterVoiceNote();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterPhotoAndVideo** *(searchMessagesFilterPhotoAndVideo)* - child of SearchMessagesFilter
///
/// Returns only photo and video messages.
final class SearchMessagesFilterPhotoAndVideo extends SearchMessagesFilter {
  /// **SearchMessagesFilterPhotoAndVideo** *(searchMessagesFilterPhotoAndVideo)* - child of SearchMessagesFilter
  ///
  /// Returns only photo and video messages.
  const SearchMessagesFilterPhotoAndVideo();

  /// Parse from a json
  factory SearchMessagesFilterPhotoAndVideo.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterPhotoAndVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterPhotoAndVideo copyWith() =>
      const SearchMessagesFilterPhotoAndVideo();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterPhotoAndVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterUrl** *(searchMessagesFilterUrl)* - child of SearchMessagesFilter
///
/// Returns only messages containing URLs.
final class SearchMessagesFilterUrl extends SearchMessagesFilter {
  /// **SearchMessagesFilterUrl** *(searchMessagesFilterUrl)* - child of SearchMessagesFilter
  ///
  /// Returns only messages containing URLs.
  const SearchMessagesFilterUrl();

  /// Parse from a json
  factory SearchMessagesFilterUrl.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterUrl();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterUrl copyWith() => const SearchMessagesFilterUrl();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterChatPhoto** *(searchMessagesFilterChatPhoto)* - child of SearchMessagesFilter
///
/// Returns only messages containing chat photos.
final class SearchMessagesFilterChatPhoto extends SearchMessagesFilter {
  /// **SearchMessagesFilterChatPhoto** *(searchMessagesFilterChatPhoto)* - child of SearchMessagesFilter
  ///
  /// Returns only messages containing chat photos.
  const SearchMessagesFilterChatPhoto();

  /// Parse from a json
  factory SearchMessagesFilterChatPhoto.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterChatPhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterChatPhoto copyWith() =>
      const SearchMessagesFilterChatPhoto();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterVideoNote** *(searchMessagesFilterVideoNote)* - child of SearchMessagesFilter
///
/// Returns only video note messages.
final class SearchMessagesFilterVideoNote extends SearchMessagesFilter {
  /// **SearchMessagesFilterVideoNote** *(searchMessagesFilterVideoNote)* - child of SearchMessagesFilter
  ///
  /// Returns only video note messages.
  const SearchMessagesFilterVideoNote();

  /// Parse from a json
  factory SearchMessagesFilterVideoNote.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterVideoNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterVideoNote copyWith() =>
      const SearchMessagesFilterVideoNote();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterVoiceAndVideoNote** *(searchMessagesFilterVoiceAndVideoNote)* - child of SearchMessagesFilter
///
/// Returns only voice and video note messages.
final class SearchMessagesFilterVoiceAndVideoNote extends SearchMessagesFilter {
  /// **SearchMessagesFilterVoiceAndVideoNote** *(searchMessagesFilterVoiceAndVideoNote)* - child of SearchMessagesFilter
  ///
  /// Returns only voice and video note messages.
  const SearchMessagesFilterVoiceAndVideoNote();

  /// Parse from a json
  factory SearchMessagesFilterVoiceAndVideoNote.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterVoiceAndVideoNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterVoiceAndVideoNote copyWith() =>
      const SearchMessagesFilterVoiceAndVideoNote();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterVoiceAndVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterMention** *(searchMessagesFilterMention)* - child of SearchMessagesFilter
///
/// Returns only messages with mentions of the current user, or messages that are replies to their messages.
final class SearchMessagesFilterMention extends SearchMessagesFilter {
  /// **SearchMessagesFilterMention** *(searchMessagesFilterMention)* - child of SearchMessagesFilter
  ///
  /// Returns only messages with mentions of the current user, or messages that are replies to their messages.
  const SearchMessagesFilterMention();

  /// Parse from a json
  factory SearchMessagesFilterMention.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterMention();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterMention copyWith() => const SearchMessagesFilterMention();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterUnreadMention** *(searchMessagesFilterUnreadMention)* - child of SearchMessagesFilter
///
/// Returns only messages with unread mentions of the current user, or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query or by the sending user.
final class SearchMessagesFilterUnreadMention extends SearchMessagesFilter {
  /// **SearchMessagesFilterUnreadMention** *(searchMessagesFilterUnreadMention)* - child of SearchMessagesFilter
  ///
  /// Returns only messages with unread mentions of the current user, or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query or by the sending user.
  const SearchMessagesFilterUnreadMention();

  /// Parse from a json
  factory SearchMessagesFilterUnreadMention.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterUnreadMention();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterUnreadMention copyWith() =>
      const SearchMessagesFilterUnreadMention();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterUnreadMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterUnreadReaction** *(searchMessagesFilterUnreadReaction)* - child of SearchMessagesFilter
///
/// Returns only messages with unread reactions for the current user. When using this filter the results can't be additionally filtered by a query or by the sending user.
final class SearchMessagesFilterUnreadReaction extends SearchMessagesFilter {
  /// **SearchMessagesFilterUnreadReaction** *(searchMessagesFilterUnreadReaction)* - child of SearchMessagesFilter
  ///
  /// Returns only messages with unread reactions for the current user. When using this filter the results can't be additionally filtered by a query or by the sending user.
  const SearchMessagesFilterUnreadReaction();

  /// Parse from a json
  factory SearchMessagesFilterUnreadReaction.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterUnreadReaction();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterUnreadReaction copyWith() =>
      const SearchMessagesFilterUnreadReaction();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterUnreadReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterUnreadPollVote** *(searchMessagesFilterUnreadPollVote)* - child of SearchMessagesFilter
///
/// Returns only messages with unread poll votes for the current user. When using this filter the results can't be additionally filtered by a query or by the sending user.
final class SearchMessagesFilterUnreadPollVote extends SearchMessagesFilter {
  /// **SearchMessagesFilterUnreadPollVote** *(searchMessagesFilterUnreadPollVote)* - child of SearchMessagesFilter
  ///
  /// Returns only messages with unread poll votes for the current user. When using this filter the results can't be additionally filtered by a query or by the sending user.
  const SearchMessagesFilterUnreadPollVote();

  /// Parse from a json
  factory SearchMessagesFilterUnreadPollVote.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterUnreadPollVote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterUnreadPollVote copyWith() =>
      const SearchMessagesFilterUnreadPollVote();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterUnreadPollVote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterFailedToSend** *(searchMessagesFilterFailedToSend)* - child of SearchMessagesFilter
///
/// Returns only failed to send messages. This filter can be used only if the message database is used.
final class SearchMessagesFilterFailedToSend extends SearchMessagesFilter {
  /// **SearchMessagesFilterFailedToSend** *(searchMessagesFilterFailedToSend)* - child of SearchMessagesFilter
  ///
  /// Returns only failed to send messages. This filter can be used only if the message database is used.
  const SearchMessagesFilterFailedToSend();

  /// Parse from a json
  factory SearchMessagesFilterFailedToSend.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesFilterFailedToSend();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterFailedToSend copyWith() =>
      const SearchMessagesFilterFailedToSend();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterFailedToSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesFilterPinned** *(searchMessagesFilterPinned)* - child of SearchMessagesFilter
///
/// Returns only pinned messages.
final class SearchMessagesFilterPinned extends SearchMessagesFilter {
  /// **SearchMessagesFilterPinned** *(searchMessagesFilterPinned)* - child of SearchMessagesFilter
  ///
  /// Returns only pinned messages.
  const SearchMessagesFilterPinned();

  /// Parse from a json
  factory SearchMessagesFilterPinned.fromJson(Map<String, dynamic> json) =>
      const SearchMessagesFilterPinned();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesFilterPinned copyWith() => const SearchMessagesFilterPinned();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesFilterPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
