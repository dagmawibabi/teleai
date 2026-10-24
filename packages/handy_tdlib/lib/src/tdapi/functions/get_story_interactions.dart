part of '../tdapi.dart';

/// **GetStoryInteractions** *(getStoryInteractions)* - TDLib function
///
/// Returns interactions with a story. The method can be called only for stories posted on behalf of the current user.
///
/// * [storyId]: Story identifier.
/// * [query]: Query to search for in names, usernames and titles; may be empty to get all relevant interactions.
/// * [onlyContacts]: Pass true to get only interactions by contacts; pass false to get all relevant interactions.
/// * [preferForwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date.
/// * [preferWithReaction]: Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of story interactions to return.
///
/// [StoryInteractions] is returned on completion.
final class GetStoryInteractions extends TdFunction {
  /// **GetStoryInteractions** *(getStoryInteractions)* - TDLib function
  ///
  /// Returns interactions with a story. The method can be called only for stories posted on behalf of the current user.
  ///
  /// * [storyId]: Story identifier.
  /// * [query]: Query to search for in names, usernames and titles; may be empty to get all relevant interactions.
  /// * [onlyContacts]: Pass true to get only interactions by contacts; pass false to get all relevant interactions.
  /// * [preferForwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date.
  /// * [preferWithReaction]: Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of story interactions to return.
  ///
  /// [StoryInteractions] is returned on completion.
  const GetStoryInteractions({
    required this.storyId,
    required this.query,
    required this.onlyContacts,
    required this.preferForwards,
    required this.preferWithReaction,
    required this.offset,
    required this.limit,
  });

  /// Story identifier
  final int storyId;

  /// Query to search for in names, usernames and titles; may be empty to get all relevant interactions
  final String query;

  /// Pass true to get only interactions by contacts; pass false to get all relevant interactions
  final bool onlyContacts;

  /// Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
  final bool preferForwards;

  /// Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true
  final bool preferWithReaction;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of story interactions to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_id": storyId,
      "query": query,
      "only_contacts": onlyContacts,
      "prefer_forwards": preferForwards,
      "prefer_with_reaction": preferWithReaction,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_id]: Story identifier
  /// * [query]: Query to search for in names, usernames and titles; may be empty to get all relevant interactions
  /// * [only_contacts]: Pass true to get only interactions by contacts; pass false to get all relevant interactions
  /// * [prefer_forwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
  /// * [prefer_with_reaction]: Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of story interactions to return
  GetStoryInteractions copyWith({
    int? storyId,
    String? query,
    bool? onlyContacts,
    bool? preferForwards,
    bool? preferWithReaction,
    String? offset,
    int? limit,
  }) =>
      GetStoryInteractions(
        storyId: storyId ?? this.storyId,
        query: query ?? this.query,
        onlyContacts: onlyContacts ?? this.onlyContacts,
        preferForwards: preferForwards ?? this.preferForwards,
        preferWithReaction: preferWithReaction ?? this.preferWithReaction,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStoryInteractions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
