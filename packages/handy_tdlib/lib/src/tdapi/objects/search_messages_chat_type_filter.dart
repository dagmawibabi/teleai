part of '../tdapi.dart';

/// **SearchMessagesChatTypeFilter** *(searchMessagesChatTypeFilter)* - parent
///
/// Represents a filter for type of the chats in which to search for messages.
sealed class SearchMessagesChatTypeFilter extends TdObject {
  /// **SearchMessagesChatTypeFilter** *(searchMessagesChatTypeFilter)* - parent
  ///
  /// Represents a filter for type of the chats in which to search for messages.
  const SearchMessagesChatTypeFilter();

  /// a SearchMessagesChatTypeFilter return type can be :
  /// * [SearchMessagesChatTypeFilterPrivate]
  /// * [SearchMessagesChatTypeFilterGroup]
  /// * [SearchMessagesChatTypeFilterChannel]
  /// * [SearchMessagesChatTypeFilterCommunity]
  factory SearchMessagesChatTypeFilter.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SearchMessagesChatTypeFilterPrivate.defaultObjectId:
        return SearchMessagesChatTypeFilterPrivate.fromJson(json);
      case SearchMessagesChatTypeFilterGroup.defaultObjectId:
        return SearchMessagesChatTypeFilterGroup.fromJson(json);
      case SearchMessagesChatTypeFilterChannel.defaultObjectId:
        return SearchMessagesChatTypeFilterChannel.fromJson(json);
      case SearchMessagesChatTypeFilterCommunity.defaultObjectId:
        return SearchMessagesChatTypeFilterCommunity.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SearchMessagesChatTypeFilter)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SearchMessagesChatTypeFilter copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesChatTypeFilter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesChatTypeFilterPrivate** *(searchMessagesChatTypeFilterPrivate)* - child of SearchMessagesChatTypeFilter
///
/// Returns only messages in private chats.
final class SearchMessagesChatTypeFilterPrivate
    extends SearchMessagesChatTypeFilter {
  /// **SearchMessagesChatTypeFilterPrivate** *(searchMessagesChatTypeFilterPrivate)* - child of SearchMessagesChatTypeFilter
  ///
  /// Returns only messages in private chats.
  const SearchMessagesChatTypeFilterPrivate();

  /// Parse from a json
  factory SearchMessagesChatTypeFilterPrivate.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesChatTypeFilterPrivate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesChatTypeFilterPrivate copyWith() =>
      const SearchMessagesChatTypeFilterPrivate();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesChatTypeFilterPrivate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesChatTypeFilterGroup** *(searchMessagesChatTypeFilterGroup)* - child of SearchMessagesChatTypeFilter
///
/// Returns only messages in basic group and supergroup chats.
final class SearchMessagesChatTypeFilterGroup
    extends SearchMessagesChatTypeFilter {
  /// **SearchMessagesChatTypeFilterGroup** *(searchMessagesChatTypeFilterGroup)* - child of SearchMessagesChatTypeFilter
  ///
  /// Returns only messages in basic group and supergroup chats.
  const SearchMessagesChatTypeFilterGroup();

  /// Parse from a json
  factory SearchMessagesChatTypeFilterGroup.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesChatTypeFilterGroup();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesChatTypeFilterGroup copyWith() =>
      const SearchMessagesChatTypeFilterGroup();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesChatTypeFilterGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesChatTypeFilterChannel** *(searchMessagesChatTypeFilterChannel)* - child of SearchMessagesChatTypeFilter
///
/// Returns only messages in channel chats.
final class SearchMessagesChatTypeFilterChannel
    extends SearchMessagesChatTypeFilter {
  /// **SearchMessagesChatTypeFilterChannel** *(searchMessagesChatTypeFilterChannel)* - child of SearchMessagesChatTypeFilter
  ///
  /// Returns only messages in channel chats.
  const SearchMessagesChatTypeFilterChannel();

  /// Parse from a json
  factory SearchMessagesChatTypeFilterChannel.fromJson(
          Map<String, dynamic> json) =>
      const SearchMessagesChatTypeFilterChannel();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SearchMessagesChatTypeFilterChannel copyWith() =>
      const SearchMessagesChatTypeFilterChannel();

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesChatTypeFilterChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SearchMessagesChatTypeFilterCommunity** *(searchMessagesChatTypeFilterCommunity)* - child of SearchMessagesChatTypeFilter
///
/// Returns only messages in the specified community.
///
/// * [communityId]: Identifier of the community to search in.
final class SearchMessagesChatTypeFilterCommunity
    extends SearchMessagesChatTypeFilter {
  /// **SearchMessagesChatTypeFilterCommunity** *(searchMessagesChatTypeFilterCommunity)* - child of SearchMessagesChatTypeFilter
  ///
  /// Returns only messages in the specified community.
  ///
  /// * [communityId]: Identifier of the community to search in.
  const SearchMessagesChatTypeFilterCommunity({
    required this.communityId,
  });

  /// Identifier of the community to search in
  final int communityId;

  /// Parse from a json
  factory SearchMessagesChatTypeFilterCommunity.fromJson(
          Map<String, dynamic> json) =>
      SearchMessagesChatTypeFilterCommunity(
        communityId: json['community_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community to search in
  @override
  SearchMessagesChatTypeFilterCommunity copyWith({
    int? communityId,
  }) =>
      SearchMessagesChatTypeFilterCommunity(
        communityId: communityId ?? this.communityId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchMessagesChatTypeFilterCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
