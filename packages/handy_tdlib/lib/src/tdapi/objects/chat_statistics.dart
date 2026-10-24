part of '../tdapi.dart';

/// **ChatStatistics** *(chatStatistics)* - parent
///
/// Contains a detailed statistics about a chat.
sealed class ChatStatistics extends TdObject {
  /// **ChatStatistics** *(chatStatistics)* - parent
  ///
  /// Contains a detailed statistics about a chat.
  const ChatStatistics();

  /// a ChatStatistics return type can be :
  /// * [ChatStatisticsSupergroup]
  /// * [ChatStatisticsChannel]
  factory ChatStatistics.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatStatisticsSupergroup.defaultObjectId:
        return ChatStatisticsSupergroup.fromJson(json);
      case ChatStatisticsChannel.defaultObjectId:
        return ChatStatisticsChannel.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatStatistics)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatStatistics copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatStatisticsSupergroup** *(chatStatisticsSupergroup)* - child of ChatStatistics
///
/// A detailed statistics about a supergroup chat.
///
/// * [period]: A period to which the statistics applies.
/// * [memberCount]: Number of members in the chat.
/// * [messageCount]: Number of messages sent to the chat.
/// * [viewerCount]: Number of users who viewed messages in the chat.
/// * [senderCount]: Number of users who sent messages to the chat.
/// * [memberCountGraph]: A graph containing number of members in the chat.
/// * [joinGraph]: A graph containing number of members joined and left the chat.
/// * [joinBySourceGraph]: A graph containing number of new member joins per source.
/// * [languageGraph]: A graph containing distribution of active users per language.
/// * [messageContentGraph]: A graph containing distribution of sent messages by content type.
/// * [actionGraph]: A graph containing number of different actions in the chat.
/// * [dayGraph]: A graph containing distribution of message views per hour.
/// * [weekGraph]: A graph containing distribution of message views per day of week.
/// * [topSenders]: List of users sent most messages in the last week.
/// * [topAdministrators]: List of most active administrators in the last week.
/// * [topInviters]: List of most active inviters of new members in the last week.
final class ChatStatisticsSupergroup extends ChatStatistics {
  /// **ChatStatisticsSupergroup** *(chatStatisticsSupergroup)* - child of ChatStatistics
  ///
  /// A detailed statistics about a supergroup chat.
  ///
  /// * [period]: A period to which the statistics applies.
  /// * [memberCount]: Number of members in the chat.
  /// * [messageCount]: Number of messages sent to the chat.
  /// * [viewerCount]: Number of users who viewed messages in the chat.
  /// * [senderCount]: Number of users who sent messages to the chat.
  /// * [memberCountGraph]: A graph containing number of members in the chat.
  /// * [joinGraph]: A graph containing number of members joined and left the chat.
  /// * [joinBySourceGraph]: A graph containing number of new member joins per source.
  /// * [languageGraph]: A graph containing distribution of active users per language.
  /// * [messageContentGraph]: A graph containing distribution of sent messages by content type.
  /// * [actionGraph]: A graph containing number of different actions in the chat.
  /// * [dayGraph]: A graph containing distribution of message views per hour.
  /// * [weekGraph]: A graph containing distribution of message views per day of week.
  /// * [topSenders]: List of users sent most messages in the last week.
  /// * [topAdministrators]: List of most active administrators in the last week.
  /// * [topInviters]: List of most active inviters of new members in the last week.
  const ChatStatisticsSupergroup({
    required this.period,
    required this.memberCount,
    required this.messageCount,
    required this.viewerCount,
    required this.senderCount,
    required this.memberCountGraph,
    required this.joinGraph,
    required this.joinBySourceGraph,
    required this.languageGraph,
    required this.messageContentGraph,
    required this.actionGraph,
    required this.dayGraph,
    required this.weekGraph,
    required this.topSenders,
    required this.topAdministrators,
    required this.topInviters,
    this.extra,
    this.clientId,
  });

  /// A period to which the statistics applies
  final DateRange period;

  /// Number of members in the chat
  final StatisticalValue memberCount;

  /// Number of messages sent to the chat
  final StatisticalValue messageCount;

  /// Number of users who viewed messages in the chat
  final StatisticalValue viewerCount;

  /// Number of users who sent messages to the chat
  final StatisticalValue senderCount;

  /// A graph containing number of members in the chat
  final StatisticalGraph memberCountGraph;

  /// A graph containing number of members joined and left the chat
  final StatisticalGraph joinGraph;

  /// A graph containing number of new member joins per source
  final StatisticalGraph joinBySourceGraph;

  /// A graph containing distribution of active users per language
  final StatisticalGraph languageGraph;

  /// A graph containing distribution of sent messages by content type
  final StatisticalGraph messageContentGraph;

  /// A graph containing number of different actions in the chat
  final StatisticalGraph actionGraph;

  /// A graph containing distribution of message views per hour
  final StatisticalGraph dayGraph;

  /// A graph containing distribution of message views per day of week
  final StatisticalGraph weekGraph;

  /// List of users sent most messages in the last week
  final List<ChatStatisticsMessageSenderInfo> topSenders;

  /// List of most active administrators in the last week
  final List<ChatStatisticsAdministratorActionsInfo> topAdministrators;

  /// List of most active inviters of new members in the last week
  final List<ChatStatisticsInviterInfo> topInviters;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatStatisticsSupergroup.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsSupergroup(
        period: DateRange.fromJson(json['period']),
        memberCount: StatisticalValue.fromJson(json['member_count']),
        messageCount: StatisticalValue.fromJson(json['message_count']),
        viewerCount: StatisticalValue.fromJson(json['viewer_count']),
        senderCount: StatisticalValue.fromJson(json['sender_count']),
        memberCountGraph: StatisticalGraph.fromJson(json['member_count_graph']),
        joinGraph: StatisticalGraph.fromJson(json['join_graph']),
        joinBySourceGraph:
            StatisticalGraph.fromJson(json['join_by_source_graph']),
        languageGraph: StatisticalGraph.fromJson(json['language_graph']),
        messageContentGraph:
            StatisticalGraph.fromJson(json['message_content_graph']),
        actionGraph: StatisticalGraph.fromJson(json['action_graph']),
        dayGraph: StatisticalGraph.fromJson(json['day_graph']),
        weekGraph: StatisticalGraph.fromJson(json['week_graph']),
        topSenders: List<ChatStatisticsMessageSenderInfo>.from(
            (json['top_senders'] ?? [])
                .map((item) => ChatStatisticsMessageSenderInfo.fromJson(item))
                .toList()),
        topAdministrators: List<ChatStatisticsAdministratorActionsInfo>.from(
            (json['top_administrators'] ?? [])
                .map((item) =>
                    ChatStatisticsAdministratorActionsInfo.fromJson(item))
                .toList()),
        topInviters: List<ChatStatisticsInviterInfo>.from(
            (json['top_inviters'] ?? [])
                .map((item) => ChatStatisticsInviterInfo.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "period": period.toJson(),
      "member_count": memberCount.toJson(),
      "message_count": messageCount.toJson(),
      "viewer_count": viewerCount.toJson(),
      "sender_count": senderCount.toJson(),
      "member_count_graph": memberCountGraph.toJson(),
      "join_graph": joinGraph.toJson(),
      "join_by_source_graph": joinBySourceGraph.toJson(),
      "language_graph": languageGraph.toJson(),
      "message_content_graph": messageContentGraph.toJson(),
      "action_graph": actionGraph.toJson(),
      "day_graph": dayGraph.toJson(),
      "week_graph": weekGraph.toJson(),
      "top_senders": topSenders.map((i) => i.toJson()).toList(),
      "top_administrators": topAdministrators.map((i) => i.toJson()).toList(),
      "top_inviters": topInviters.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [period]: A period to which the statistics applies
  /// * [member_count]: Number of members in the chat
  /// * [message_count]: Number of messages sent to the chat
  /// * [viewer_count]: Number of users who viewed messages in the chat
  /// * [sender_count]: Number of users who sent messages to the chat
  /// * [member_count_graph]: A graph containing number of members in the chat
  /// * [join_graph]: A graph containing number of members joined and left the chat
  /// * [join_by_source_graph]: A graph containing number of new member joins per source
  /// * [language_graph]: A graph containing distribution of active users per language
  /// * [message_content_graph]: A graph containing distribution of sent messages by content type
  /// * [action_graph]: A graph containing number of different actions in the chat
  /// * [day_graph]: A graph containing distribution of message views per hour
  /// * [week_graph]: A graph containing distribution of message views per day of week
  /// * [top_senders]: List of users sent most messages in the last week
  /// * [top_administrators]: List of most active administrators in the last week
  /// * [top_inviters]: List of most active inviters of new members in the last week
  @override
  ChatStatisticsSupergroup copyWith({
    DateRange? period,
    StatisticalValue? memberCount,
    StatisticalValue? messageCount,
    StatisticalValue? viewerCount,
    StatisticalValue? senderCount,
    StatisticalGraph? memberCountGraph,
    StatisticalGraph? joinGraph,
    StatisticalGraph? joinBySourceGraph,
    StatisticalGraph? languageGraph,
    StatisticalGraph? messageContentGraph,
    StatisticalGraph? actionGraph,
    StatisticalGraph? dayGraph,
    StatisticalGraph? weekGraph,
    List<ChatStatisticsMessageSenderInfo>? topSenders,
    List<ChatStatisticsAdministratorActionsInfo>? topAdministrators,
    List<ChatStatisticsInviterInfo>? topInviters,
    dynamic extra,
    int? clientId,
  }) =>
      ChatStatisticsSupergroup(
        period: period ?? this.period,
        memberCount: memberCount ?? this.memberCount,
        messageCount: messageCount ?? this.messageCount,
        viewerCount: viewerCount ?? this.viewerCount,
        senderCount: senderCount ?? this.senderCount,
        memberCountGraph: memberCountGraph ?? this.memberCountGraph,
        joinGraph: joinGraph ?? this.joinGraph,
        joinBySourceGraph: joinBySourceGraph ?? this.joinBySourceGraph,
        languageGraph: languageGraph ?? this.languageGraph,
        messageContentGraph: messageContentGraph ?? this.messageContentGraph,
        actionGraph: actionGraph ?? this.actionGraph,
        dayGraph: dayGraph ?? this.dayGraph,
        weekGraph: weekGraph ?? this.weekGraph,
        topSenders: topSenders ?? this.topSenders,
        topAdministrators: topAdministrators ?? this.topAdministrators,
        topInviters: topInviters ?? this.topInviters,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsSupergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatStatisticsChannel** *(chatStatisticsChannel)* - child of ChatStatistics
///
/// A detailed statistics about a channel chat.
///
/// * [period]: A period to which the statistics applies.
/// * [memberCount]: Number of members in the chat.
/// * [meanMessageViewCount]: Mean number of times the recently sent messages were viewed.
/// * [meanMessageShareCount]: Mean number of times the recently sent messages were shared.
/// * [meanMessageReactionCount]: Mean number of times reactions were added to the recently sent messages.
/// * [meanStoryViewCount]: Mean number of times the recently posted stories were viewed.
/// * [meanStoryShareCount]: Mean number of times the recently posted stories were shared.
/// * [meanStoryReactionCount]: Mean number of times reactions were added to the recently posted stories.
/// * [enabledNotificationsPercentage]: A percentage of users with enabled notifications for the chat; 0-100.
/// * [memberCountGraph]: A graph containing number of members in the chat.
/// * [joinGraph]: A graph containing number of members joined and left the chat.
/// * [muteGraph]: A graph containing number of members muted and unmuted the chat.
/// * [viewCountByHourGraph]: A graph containing number of message views in a given hour in the last two weeks.
/// * [viewCountBySourceGraph]: A graph containing number of message views per source.
/// * [joinBySourceGraph]: A graph containing number of new member joins per source.
/// * [languageGraph]: A graph containing number of users viewed chat messages per language.
/// * [messageInteractionGraph]: A graph containing number of chat message views and shares.
/// * [messageReactionGraph]: A graph containing number of reactions on messages.
/// * [storyInteractionGraph]: A graph containing number of story views and shares.
/// * [storyReactionGraph]: A graph containing number of reactions on stories.
/// * [instantViewInteractionGraph]: A graph containing number of views of associated with the chat instant views.
/// * [recentInteractions]: Detailed statistics about number of views and shares of recently sent messages and posted stories.
final class ChatStatisticsChannel extends ChatStatistics {
  /// **ChatStatisticsChannel** *(chatStatisticsChannel)* - child of ChatStatistics
  ///
  /// A detailed statistics about a channel chat.
  ///
  /// * [period]: A period to which the statistics applies.
  /// * [memberCount]: Number of members in the chat.
  /// * [meanMessageViewCount]: Mean number of times the recently sent messages were viewed.
  /// * [meanMessageShareCount]: Mean number of times the recently sent messages were shared.
  /// * [meanMessageReactionCount]: Mean number of times reactions were added to the recently sent messages.
  /// * [meanStoryViewCount]: Mean number of times the recently posted stories were viewed.
  /// * [meanStoryShareCount]: Mean number of times the recently posted stories were shared.
  /// * [meanStoryReactionCount]: Mean number of times reactions were added to the recently posted stories.
  /// * [enabledNotificationsPercentage]: A percentage of users with enabled notifications for the chat; 0-100.
  /// * [memberCountGraph]: A graph containing number of members in the chat.
  /// * [joinGraph]: A graph containing number of members joined and left the chat.
  /// * [muteGraph]: A graph containing number of members muted and unmuted the chat.
  /// * [viewCountByHourGraph]: A graph containing number of message views in a given hour in the last two weeks.
  /// * [viewCountBySourceGraph]: A graph containing number of message views per source.
  /// * [joinBySourceGraph]: A graph containing number of new member joins per source.
  /// * [languageGraph]: A graph containing number of users viewed chat messages per language.
  /// * [messageInteractionGraph]: A graph containing number of chat message views and shares.
  /// * [messageReactionGraph]: A graph containing number of reactions on messages.
  /// * [storyInteractionGraph]: A graph containing number of story views and shares.
  /// * [storyReactionGraph]: A graph containing number of reactions on stories.
  /// * [instantViewInteractionGraph]: A graph containing number of views of associated with the chat instant views.
  /// * [recentInteractions]: Detailed statistics about number of views and shares of recently sent messages and posted stories.
  const ChatStatisticsChannel({
    required this.period,
    required this.memberCount,
    required this.meanMessageViewCount,
    required this.meanMessageShareCount,
    required this.meanMessageReactionCount,
    required this.meanStoryViewCount,
    required this.meanStoryShareCount,
    required this.meanStoryReactionCount,
    required this.enabledNotificationsPercentage,
    required this.memberCountGraph,
    required this.joinGraph,
    required this.muteGraph,
    required this.viewCountByHourGraph,
    required this.viewCountBySourceGraph,
    required this.joinBySourceGraph,
    required this.languageGraph,
    required this.messageInteractionGraph,
    required this.messageReactionGraph,
    required this.storyInteractionGraph,
    required this.storyReactionGraph,
    required this.instantViewInteractionGraph,
    required this.recentInteractions,
    this.extra,
    this.clientId,
  });

  /// A period to which the statistics applies
  final DateRange period;

  /// Number of members in the chat
  final StatisticalValue memberCount;

  /// Mean number of times the recently sent messages were viewed
  final StatisticalValue meanMessageViewCount;

  /// Mean number of times the recently sent messages were shared
  final StatisticalValue meanMessageShareCount;

  /// Mean number of times reactions were added to the recently sent messages
  final StatisticalValue meanMessageReactionCount;

  /// Mean number of times the recently posted stories were viewed
  final StatisticalValue meanStoryViewCount;

  /// Mean number of times the recently posted stories were shared
  final StatisticalValue meanStoryShareCount;

  /// Mean number of times reactions were added to the recently posted stories
  final StatisticalValue meanStoryReactionCount;

  /// A percentage of users with enabled notifications for the chat; 0-100
  final double enabledNotificationsPercentage;

  /// A graph containing number of members in the chat
  final StatisticalGraph memberCountGraph;

  /// A graph containing number of members joined and left the chat
  final StatisticalGraph joinGraph;

  /// A graph containing number of members muted and unmuted the chat
  final StatisticalGraph muteGraph;

  /// A graph containing number of message views in a given hour in the last two weeks
  final StatisticalGraph viewCountByHourGraph;

  /// A graph containing number of message views per source
  final StatisticalGraph viewCountBySourceGraph;

  /// A graph containing number of new member joins per source
  final StatisticalGraph joinBySourceGraph;

  /// A graph containing number of users viewed chat messages per language
  final StatisticalGraph languageGraph;

  /// A graph containing number of chat message views and shares
  final StatisticalGraph messageInteractionGraph;

  /// A graph containing number of reactions on messages
  final StatisticalGraph messageReactionGraph;

  /// A graph containing number of story views and shares
  final StatisticalGraph storyInteractionGraph;

  /// A graph containing number of reactions on stories
  final StatisticalGraph storyReactionGraph;

  /// A graph containing number of views of associated with the chat instant views
  final StatisticalGraph instantViewInteractionGraph;

  /// Detailed statistics about number of views and shares of recently sent messages and posted stories
  final List<ChatStatisticsInteractionInfo> recentInteractions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatStatisticsChannel.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsChannel(
        period: DateRange.fromJson(json['period']),
        memberCount: StatisticalValue.fromJson(json['member_count']),
        meanMessageViewCount:
            StatisticalValue.fromJson(json['mean_message_view_count']),
        meanMessageShareCount:
            StatisticalValue.fromJson(json['mean_message_share_count']),
        meanMessageReactionCount:
            StatisticalValue.fromJson(json['mean_message_reaction_count']),
        meanStoryViewCount:
            StatisticalValue.fromJson(json['mean_story_view_count']),
        meanStoryShareCount:
            StatisticalValue.fromJson(json['mean_story_share_count']),
        meanStoryReactionCount:
            StatisticalValue.fromJson(json['mean_story_reaction_count']),
        enabledNotificationsPercentage:
            json['enabled_notifications_percentage'],
        memberCountGraph: StatisticalGraph.fromJson(json['member_count_graph']),
        joinGraph: StatisticalGraph.fromJson(json['join_graph']),
        muteGraph: StatisticalGraph.fromJson(json['mute_graph']),
        viewCountByHourGraph:
            StatisticalGraph.fromJson(json['view_count_by_hour_graph']),
        viewCountBySourceGraph:
            StatisticalGraph.fromJson(json['view_count_by_source_graph']),
        joinBySourceGraph:
            StatisticalGraph.fromJson(json['join_by_source_graph']),
        languageGraph: StatisticalGraph.fromJson(json['language_graph']),
        messageInteractionGraph:
            StatisticalGraph.fromJson(json['message_interaction_graph']),
        messageReactionGraph:
            StatisticalGraph.fromJson(json['message_reaction_graph']),
        storyInteractionGraph:
            StatisticalGraph.fromJson(json['story_interaction_graph']),
        storyReactionGraph:
            StatisticalGraph.fromJson(json['story_reaction_graph']),
        instantViewInteractionGraph:
            StatisticalGraph.fromJson(json['instant_view_interaction_graph']),
        recentInteractions: List<ChatStatisticsInteractionInfo>.from(
            (json['recent_interactions'] ?? [])
                .map((item) => ChatStatisticsInteractionInfo.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "period": period.toJson(),
      "member_count": memberCount.toJson(),
      "mean_message_view_count": meanMessageViewCount.toJson(),
      "mean_message_share_count": meanMessageShareCount.toJson(),
      "mean_message_reaction_count": meanMessageReactionCount.toJson(),
      "mean_story_view_count": meanStoryViewCount.toJson(),
      "mean_story_share_count": meanStoryShareCount.toJson(),
      "mean_story_reaction_count": meanStoryReactionCount.toJson(),
      "enabled_notifications_percentage": enabledNotificationsPercentage,
      "member_count_graph": memberCountGraph.toJson(),
      "join_graph": joinGraph.toJson(),
      "mute_graph": muteGraph.toJson(),
      "view_count_by_hour_graph": viewCountByHourGraph.toJson(),
      "view_count_by_source_graph": viewCountBySourceGraph.toJson(),
      "join_by_source_graph": joinBySourceGraph.toJson(),
      "language_graph": languageGraph.toJson(),
      "message_interaction_graph": messageInteractionGraph.toJson(),
      "message_reaction_graph": messageReactionGraph.toJson(),
      "story_interaction_graph": storyInteractionGraph.toJson(),
      "story_reaction_graph": storyReactionGraph.toJson(),
      "instant_view_interaction_graph": instantViewInteractionGraph.toJson(),
      "recent_interactions": recentInteractions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [period]: A period to which the statistics applies
  /// * [member_count]: Number of members in the chat
  /// * [mean_message_view_count]: Mean number of times the recently sent messages were viewed
  /// * [mean_message_share_count]: Mean number of times the recently sent messages were shared
  /// * [mean_message_reaction_count]: Mean number of times reactions were added to the recently sent messages
  /// * [mean_story_view_count]: Mean number of times the recently posted stories were viewed
  /// * [mean_story_share_count]: Mean number of times the recently posted stories were shared
  /// * [mean_story_reaction_count]: Mean number of times reactions were added to the recently posted stories
  /// * [enabled_notifications_percentage]: A percentage of users with enabled notifications for the chat; 0-100
  /// * [member_count_graph]: A graph containing number of members in the chat
  /// * [join_graph]: A graph containing number of members joined and left the chat
  /// * [mute_graph]: A graph containing number of members muted and unmuted the chat
  /// * [view_count_by_hour_graph]: A graph containing number of message views in a given hour in the last two weeks
  /// * [view_count_by_source_graph]: A graph containing number of message views per source
  /// * [join_by_source_graph]: A graph containing number of new member joins per source
  /// * [language_graph]: A graph containing number of users viewed chat messages per language
  /// * [message_interaction_graph]: A graph containing number of chat message views and shares
  /// * [message_reaction_graph]: A graph containing number of reactions on messages
  /// * [story_interaction_graph]: A graph containing number of story views and shares
  /// * [story_reaction_graph]: A graph containing number of reactions on stories
  /// * [instant_view_interaction_graph]: A graph containing number of views of associated with the chat instant views
  /// * [recent_interactions]: Detailed statistics about number of views and shares of recently sent messages and posted stories
  @override
  ChatStatisticsChannel copyWith({
    DateRange? period,
    StatisticalValue? memberCount,
    StatisticalValue? meanMessageViewCount,
    StatisticalValue? meanMessageShareCount,
    StatisticalValue? meanMessageReactionCount,
    StatisticalValue? meanStoryViewCount,
    StatisticalValue? meanStoryShareCount,
    StatisticalValue? meanStoryReactionCount,
    double? enabledNotificationsPercentage,
    StatisticalGraph? memberCountGraph,
    StatisticalGraph? joinGraph,
    StatisticalGraph? muteGraph,
    StatisticalGraph? viewCountByHourGraph,
    StatisticalGraph? viewCountBySourceGraph,
    StatisticalGraph? joinBySourceGraph,
    StatisticalGraph? languageGraph,
    StatisticalGraph? messageInteractionGraph,
    StatisticalGraph? messageReactionGraph,
    StatisticalGraph? storyInteractionGraph,
    StatisticalGraph? storyReactionGraph,
    StatisticalGraph? instantViewInteractionGraph,
    List<ChatStatisticsInteractionInfo>? recentInteractions,
    dynamic extra,
    int? clientId,
  }) =>
      ChatStatisticsChannel(
        period: period ?? this.period,
        memberCount: memberCount ?? this.memberCount,
        meanMessageViewCount: meanMessageViewCount ?? this.meanMessageViewCount,
        meanMessageShareCount:
            meanMessageShareCount ?? this.meanMessageShareCount,
        meanMessageReactionCount:
            meanMessageReactionCount ?? this.meanMessageReactionCount,
        meanStoryViewCount: meanStoryViewCount ?? this.meanStoryViewCount,
        meanStoryShareCount: meanStoryShareCount ?? this.meanStoryShareCount,
        meanStoryReactionCount:
            meanStoryReactionCount ?? this.meanStoryReactionCount,
        enabledNotificationsPercentage: enabledNotificationsPercentage ??
            this.enabledNotificationsPercentage,
        memberCountGraph: memberCountGraph ?? this.memberCountGraph,
        joinGraph: joinGraph ?? this.joinGraph,
        muteGraph: muteGraph ?? this.muteGraph,
        viewCountByHourGraph: viewCountByHourGraph ?? this.viewCountByHourGraph,
        viewCountBySourceGraph:
            viewCountBySourceGraph ?? this.viewCountBySourceGraph,
        joinBySourceGraph: joinBySourceGraph ?? this.joinBySourceGraph,
        languageGraph: languageGraph ?? this.languageGraph,
        messageInteractionGraph:
            messageInteractionGraph ?? this.messageInteractionGraph,
        messageReactionGraph: messageReactionGraph ?? this.messageReactionGraph,
        storyInteractionGraph:
            storyInteractionGraph ?? this.storyInteractionGraph,
        storyReactionGraph: storyReactionGraph ?? this.storyReactionGraph,
        instantViewInteractionGraph:
            instantViewInteractionGraph ?? this.instantViewInteractionGraph,
        recentInteractions: recentInteractions ?? this.recentInteractions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
