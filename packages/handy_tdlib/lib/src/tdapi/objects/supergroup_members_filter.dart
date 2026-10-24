part of '../tdapi.dart';

/// **SupergroupMembersFilter** *(supergroupMembersFilter)* - parent
///
/// Specifies the kind of chat members to return in getSupergroupMembers.
sealed class SupergroupMembersFilter extends TdObject {
  /// **SupergroupMembersFilter** *(supergroupMembersFilter)* - parent
  ///
  /// Specifies the kind of chat members to return in getSupergroupMembers.
  const SupergroupMembersFilter();

  /// a SupergroupMembersFilter return type can be :
  /// * [SupergroupMembersFilterRecent]
  /// * [SupergroupMembersFilterContacts]
  /// * [SupergroupMembersFilterAdministrators]
  /// * [SupergroupMembersFilterSearch]
  /// * [SupergroupMembersFilterRestricted]
  /// * [SupergroupMembersFilterBanned]
  /// * [SupergroupMembersFilterMention]
  /// * [SupergroupMembersFilterBots]
  factory SupergroupMembersFilter.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SupergroupMembersFilterRecent.defaultObjectId:
        return SupergroupMembersFilterRecent.fromJson(json);
      case SupergroupMembersFilterContacts.defaultObjectId:
        return SupergroupMembersFilterContacts.fromJson(json);
      case SupergroupMembersFilterAdministrators.defaultObjectId:
        return SupergroupMembersFilterAdministrators.fromJson(json);
      case SupergroupMembersFilterSearch.defaultObjectId:
        return SupergroupMembersFilterSearch.fromJson(json);
      case SupergroupMembersFilterRestricted.defaultObjectId:
        return SupergroupMembersFilterRestricted.fromJson(json);
      case SupergroupMembersFilterBanned.defaultObjectId:
        return SupergroupMembersFilterBanned.fromJson(json);
      case SupergroupMembersFilterMention.defaultObjectId:
        return SupergroupMembersFilterMention.fromJson(json);
      case SupergroupMembersFilterBots.defaultObjectId:
        return SupergroupMembersFilterBots.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SupergroupMembersFilter)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SupergroupMembersFilter copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterRecent** *(supergroupMembersFilterRecent)* - child of SupergroupMembersFilter
///
/// Returns recently active users in reverse chronological order.
final class SupergroupMembersFilterRecent extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterRecent** *(supergroupMembersFilterRecent)* - child of SupergroupMembersFilter
  ///
  /// Returns recently active users in reverse chronological order.
  const SupergroupMembersFilterRecent();

  /// Parse from a json
  factory SupergroupMembersFilterRecent.fromJson(Map<String, dynamic> json) =>
      const SupergroupMembersFilterRecent();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SupergroupMembersFilterRecent copyWith() =>
      const SupergroupMembersFilterRecent();

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterRecent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterContacts** *(supergroupMembersFilterContacts)* - child of SupergroupMembersFilter
///
/// Returns contacts of the current user who are members of the supergroup or channel.
///
/// * [query]: Query to search for.
final class SupergroupMembersFilterContacts extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterContacts** *(supergroupMembersFilterContacts)* - child of SupergroupMembersFilter
  ///
  /// Returns contacts of the current user who are members of the supergroup or channel.
  ///
  /// * [query]: Query to search for.
  const SupergroupMembersFilterContacts({
    required this.query,
  });

  /// Query to search for
  final String query;

  /// Parse from a json
  factory SupergroupMembersFilterContacts.fromJson(Map<String, dynamic> json) =>
      SupergroupMembersFilterContacts(
        query: json['query'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  @override
  SupergroupMembersFilterContacts copyWith({
    String? query,
  }) =>
      SupergroupMembersFilterContacts(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterAdministrators** *(supergroupMembersFilterAdministrators)* - child of SupergroupMembersFilter
///
/// Returns the owner and administrators.
final class SupergroupMembersFilterAdministrators
    extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterAdministrators** *(supergroupMembersFilterAdministrators)* - child of SupergroupMembersFilter
  ///
  /// Returns the owner and administrators.
  const SupergroupMembersFilterAdministrators();

  /// Parse from a json
  factory SupergroupMembersFilterAdministrators.fromJson(
          Map<String, dynamic> json) =>
      const SupergroupMembersFilterAdministrators();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SupergroupMembersFilterAdministrators copyWith() =>
      const SupergroupMembersFilterAdministrators();

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterAdministrators';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterSearch** *(supergroupMembersFilterSearch)* - child of SupergroupMembersFilter
///
/// Used to search for supergroup or channel members via a (string) query.
///
/// * [query]: Query to search for.
final class SupergroupMembersFilterSearch extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterSearch** *(supergroupMembersFilterSearch)* - child of SupergroupMembersFilter
  ///
  /// Used to search for supergroup or channel members via a (string) query.
  ///
  /// * [query]: Query to search for.
  const SupergroupMembersFilterSearch({
    required this.query,
  });

  /// Query to search for
  final String query;

  /// Parse from a json
  factory SupergroupMembersFilterSearch.fromJson(Map<String, dynamic> json) =>
      SupergroupMembersFilterSearch(
        query: json['query'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  @override
  SupergroupMembersFilterSearch copyWith({
    String? query,
  }) =>
      SupergroupMembersFilterSearch(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterRestricted** *(supergroupMembersFilterRestricted)* - child of SupergroupMembersFilter
///
/// Returns restricted supergroup members; can be used only by administrators.
///
/// * [query]: Query to search for.
final class SupergroupMembersFilterRestricted extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterRestricted** *(supergroupMembersFilterRestricted)* - child of SupergroupMembersFilter
  ///
  /// Returns restricted supergroup members; can be used only by administrators.
  ///
  /// * [query]: Query to search for.
  const SupergroupMembersFilterRestricted({
    required this.query,
  });

  /// Query to search for
  final String query;

  /// Parse from a json
  factory SupergroupMembersFilterRestricted.fromJson(
          Map<String, dynamic> json) =>
      SupergroupMembersFilterRestricted(
        query: json['query'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  @override
  SupergroupMembersFilterRestricted copyWith({
    String? query,
  }) =>
      SupergroupMembersFilterRestricted(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterBanned** *(supergroupMembersFilterBanned)* - child of SupergroupMembersFilter
///
/// Returns users banned from the supergroup or channel; can be used only by administrators.
///
/// * [query]: Query to search for.
final class SupergroupMembersFilterBanned extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterBanned** *(supergroupMembersFilterBanned)* - child of SupergroupMembersFilter
  ///
  /// Returns users banned from the supergroup or channel; can be used only by administrators.
  ///
  /// * [query]: Query to search for.
  const SupergroupMembersFilterBanned({
    required this.query,
  });

  /// Query to search for
  final String query;

  /// Parse from a json
  factory SupergroupMembersFilterBanned.fromJson(Map<String, dynamic> json) =>
      SupergroupMembersFilterBanned(
        query: json['query'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  @override
  SupergroupMembersFilterBanned copyWith({
    String? query,
  }) =>
      SupergroupMembersFilterBanned(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterBanned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterMention** *(supergroupMembersFilterMention)* - child of SupergroupMembersFilter
///
/// Returns users who can be mentioned in the supergroup.
///
/// * [query]: Query to search for.
/// * [topicId]: Identifier of the topic in which the users will be mentioned; pass null if none *(optional)*.
final class SupergroupMembersFilterMention extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterMention** *(supergroupMembersFilterMention)* - child of SupergroupMembersFilter
  ///
  /// Returns users who can be mentioned in the supergroup.
  ///
  /// * [query]: Query to search for.
  /// * [topicId]: Identifier of the topic in which the users will be mentioned; pass null if none *(optional)*.
  const SupergroupMembersFilterMention({
    required this.query,
    this.topicId,
  });

  /// Query to search for
  final String query;

  /// Identifier of the topic in which the users will be mentioned; pass null if none
  final MessageTopic? topicId;

  /// Parse from a json
  factory SupergroupMembersFilterMention.fromJson(Map<String, dynamic> json) =>
      SupergroupMembersFilterMention(
        query: json['query'],
        topicId: json['topic_id'] == null
            ? null
            : MessageTopic.fromJson(json['topic_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query": query,
      "topic_id": topicId?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  /// * [topic_id]: Identifier of the topic in which the users will be mentioned; pass null if none
  @override
  SupergroupMembersFilterMention copyWith({
    String? query,
    MessageTopic? topicId,
  }) =>
      SupergroupMembersFilterMention(
        query: query ?? this.query,
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SupergroupMembersFilterBots** *(supergroupMembersFilterBots)* - child of SupergroupMembersFilter
///
/// Returns bot members of the supergroup or channel.
final class SupergroupMembersFilterBots extends SupergroupMembersFilter {
  /// **SupergroupMembersFilterBots** *(supergroupMembersFilterBots)* - child of SupergroupMembersFilter
  ///
  /// Returns bot members of the supergroup or channel.
  const SupergroupMembersFilterBots();

  /// Parse from a json
  factory SupergroupMembersFilterBots.fromJson(Map<String, dynamic> json) =>
      const SupergroupMembersFilterBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SupergroupMembersFilterBots copyWith() => const SupergroupMembersFilterBots();

  /// TDLib object type
  static const String defaultObjectId = 'supergroupMembersFilterBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
