part of '../tdapi.dart';

/// **SearchChatTypeFilter** *(searchChatTypeFilter)* - parent
///
/// Represents a filter for type of the chats to search for.
sealed class SearchChatTypeFilter extends TdObject {
  /// **SearchChatTypeFilter** *(searchChatTypeFilter)* - parent
  ///
  /// Represents a filter for type of the chats to search for.
  const SearchChatTypeFilter();

  /// a SearchChatTypeFilter return type can be :
  /// * [SearchChatTypeFilterBot]
  /// * [SearchChatTypeFilterChannel]
  factory SearchChatTypeFilter.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SearchChatTypeFilterBot.defaultObjectId:
        return SearchChatTypeFilterBot.fromJson(json);
      case SearchChatTypeFilterChannel.defaultObjectId:
        return SearchChatTypeFilterChannel.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SearchChatTypeFilter)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SearchChatTypeFilter copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'searchChatTypeFilter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchChatTypeFilterBot** *(searchChatTypeFilterBot)* - child of SearchChatTypeFilter
///
/// Returns only private chats with bots.
final class SearchChatTypeFilterBot extends SearchChatTypeFilter {
  /// **SearchChatTypeFilterBot** *(searchChatTypeFilterBot)* - child of SearchChatTypeFilter
  ///
  /// Returns only private chats with bots.
  const SearchChatTypeFilterBot();

  /// Parse from a json
  factory SearchChatTypeFilterBot.fromJson(Map<String, dynamic> json) =>
      const SearchChatTypeFilterBot();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchChatTypeFilterBot copyWith() => const SearchChatTypeFilterBot();

  /// TDLib object type
  static const String defaultObjectId = 'searchChatTypeFilterBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchChatTypeFilterChannel** *(searchChatTypeFilterChannel)* - child of SearchChatTypeFilter
///
/// Returns only channel chats.
final class SearchChatTypeFilterChannel extends SearchChatTypeFilter {
  /// **SearchChatTypeFilterChannel** *(searchChatTypeFilterChannel)* - child of SearchChatTypeFilter
  ///
  /// Returns only channel chats.
  const SearchChatTypeFilterChannel();

  /// Parse from a json
  factory SearchChatTypeFilterChannel.fromJson(Map<String, dynamic> json) =>
      const SearchChatTypeFilterChannel();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchChatTypeFilterChannel copyWith() => const SearchChatTypeFilterChannel();

  /// TDLib object type
  static const String defaultObjectId = 'searchChatTypeFilterChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
