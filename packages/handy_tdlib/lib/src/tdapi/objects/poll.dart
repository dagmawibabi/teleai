part of '../tdapi.dart';

/// **Poll** *(poll)* - basic class
///
/// Describes a poll.
///
/// * [id]: Unique poll identifier.
/// * [question]: Poll question; 1-300 characters; may contain only custom emoji entities.
/// * [options]: List of poll answer options.
/// * [totalVoterCount]: Total number of voters, participating in the poll.
/// * [recentVoterIds]: Identifiers of recent voters, if the poll is non-anonymous and poll results are available.
/// * [canGetVoters]: True, if the current user can get voters in the poll using getPollVoters.
/// * [canSeeResults]: True, if the current user can see results of the poll.
/// * [isAnonymous]: True, if the poll is anonymous.
/// * [allowsMultipleAnswers]: True, if multiple answer options can be chosen simultaneously.
/// * [allowsRevoting]: True, if the poll can be answered multiple times.
/// * [membersOnly]: True, if only the users that are members of the chat for more than a day will be able to vote.
/// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote. If empty, then all users can participate in the poll.
/// * [optionOrder]: The list of 0-based poll option identifiers in which the options of the poll must be shown; empty if the order of options must not be changed.
/// * [type]: Type of the poll.
/// * [openPeriod]: Amount of time the poll will be active after creation, in seconds.
/// * [closeDate]: Point in time (Unix timestamp) when the poll will automatically be closed.
/// * [isClosed]: True, if the poll is closed.
/// * [voteRestrictionReason]: The reason describing, why the current user can't vote in the poll; may be null if the user can vote in the poll *(optional)*.
final class Poll extends TdObject {
  /// **Poll** *(poll)* - basic class
  ///
  /// Describes a poll.
  ///
  /// * [id]: Unique poll identifier.
  /// * [question]: Poll question; 1-300 characters; may contain only custom emoji entities.
  /// * [options]: List of poll answer options.
  /// * [totalVoterCount]: Total number of voters, participating in the poll.
  /// * [recentVoterIds]: Identifiers of recent voters, if the poll is non-anonymous and poll results are available.
  /// * [canGetVoters]: True, if the current user can get voters in the poll using getPollVoters.
  /// * [canSeeResults]: True, if the current user can see results of the poll.
  /// * [isAnonymous]: True, if the poll is anonymous.
  /// * [allowsMultipleAnswers]: True, if multiple answer options can be chosen simultaneously.
  /// * [allowsRevoting]: True, if the poll can be answered multiple times.
  /// * [membersOnly]: True, if only the users that are members of the chat for more than a day will be able to vote.
  /// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote. If empty, then all users can participate in the poll.
  /// * [optionOrder]: The list of 0-based poll option identifiers in which the options of the poll must be shown; empty if the order of options must not be changed.
  /// * [type]: Type of the poll.
  /// * [openPeriod]: Amount of time the poll will be active after creation, in seconds.
  /// * [closeDate]: Point in time (Unix timestamp) when the poll will automatically be closed.
  /// * [isClosed]: True, if the poll is closed.
  /// * [voteRestrictionReason]: The reason describing, why the current user can't vote in the poll; may be null if the user can vote in the poll *(optional)*.
  const Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.totalVoterCount,
    required this.recentVoterIds,
    required this.canGetVoters,
    required this.canSeeResults,
    required this.isAnonymous,
    required this.allowsMultipleAnswers,
    required this.allowsRevoting,
    required this.membersOnly,
    required this.countryCodes,
    required this.optionOrder,
    required this.type,
    required this.openPeriod,
    required this.closeDate,
    required this.isClosed,
    this.voteRestrictionReason,
  });

  /// Unique poll identifier
  final int id;

  /// Poll question; 1-300 characters; may contain only custom emoji entities
  final FormattedText question;

  /// List of poll answer options
  final List<PollOption> options;

  /// Total number of voters, participating in the poll
  final int totalVoterCount;

  /// Identifiers of recent voters, if the poll is non-anonymous and poll results are available
  final List<MessageSender> recentVoterIds;

  /// True, if the current user can get voters in the poll using getPollVoters
  final bool canGetVoters;

  /// True, if the current user can see results of the poll
  final bool canSeeResults;

  /// True, if the poll is anonymous
  final bool isAnonymous;

  /// True, if multiple answer options can be chosen simultaneously
  final bool allowsMultipleAnswers;

  /// True, if the poll can be answered multiple times
  final bool allowsRevoting;

  /// True, if only the users that are members of the chat for more than a day will be able to vote
  final bool membersOnly;

  /// The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote. If empty, then all users can participate in the poll
  final List<String> countryCodes;

  /// The list of 0-based poll option identifiers in which the options of the poll must be shown; empty if the order of options must not be changed
  final List<int> optionOrder;

  /// Type of the poll
  final PollType type;

  /// Amount of time the poll will be active after creation, in seconds
  final int openPeriod;

  /// Point in time (Unix timestamp) when the poll will automatically be closed
  final int closeDate;

  /// True, if the poll is closed
  final bool isClosed;

  /// The reason describing, why the current user can't vote in the poll; may be null if the user can vote in the poll
  final PollVoteRestrictionReason? voteRestrictionReason;

  /// Parse from a json
  factory Poll.fromJson(Map<String, dynamic> json) => Poll(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        question: FormattedText.fromJson(json['question']),
        options: List<PollOption>.from((json['options'] ?? [])
            .map((item) => PollOption.fromJson(item))
            .toList()),
        totalVoterCount: json['total_voter_count'],
        recentVoterIds: List<MessageSender>.from(
            (json['recent_voter_ids'] ?? [])
                .map((item) => MessageSender.fromJson(item))
                .toList()),
        canGetVoters: json['can_get_voters'],
        canSeeResults: json['can_see_results'],
        isAnonymous: json['is_anonymous'],
        allowsMultipleAnswers: json['allows_multiple_answers'],
        allowsRevoting: json['allows_revoting'],
        membersOnly: json['members_only'],
        countryCodes: List<String>.from(
            (json['country_codes'] ?? []).map((item) => item).toList()),
        optionOrder: List<int>.from(
            (json['option_order'] ?? []).map((item) => item).toList()),
        type: PollType.fromJson(json['type']),
        openPeriod: json['open_period'],
        closeDate: json['close_date'],
        isClosed: json['is_closed'],
        voteRestrictionReason: json['vote_restriction_reason'] == null
            ? null
            : PollVoteRestrictionReason.fromJson(
                json['vote_restriction_reason']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "question": question.toJson(),
      "options": options.map((i) => i.toJson()).toList(),
      "total_voter_count": totalVoterCount,
      "recent_voter_ids": recentVoterIds.map((i) => i.toJson()).toList(),
      "can_get_voters": canGetVoters,
      "can_see_results": canSeeResults,
      "is_anonymous": isAnonymous,
      "allows_multiple_answers": allowsMultipleAnswers,
      "allows_revoting": allowsRevoting,
      "members_only": membersOnly,
      "country_codes": countryCodes.map((i) => i).toList(),
      "option_order": optionOrder.map((i) => i).toList(),
      "type": type.toJson(),
      "open_period": openPeriod,
      "close_date": closeDate,
      "is_closed": isClosed,
      "vote_restriction_reason": voteRestrictionReason?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique poll identifier
  /// * [question]: Poll question; 1-300 characters; may contain only custom emoji entities
  /// * [options]: List of poll answer options
  /// * [total_voter_count]: Total number of voters, participating in the poll
  /// * [recent_voter_ids]: Identifiers of recent voters, if the poll is non-anonymous and poll results are available
  /// * [can_get_voters]: True, if the current user can get voters in the poll using getPollVoters
  /// * [can_see_results]: True, if the current user can see results of the poll
  /// * [is_anonymous]: True, if the poll is anonymous
  /// * [allows_multiple_answers]: True, if multiple answer options can be chosen simultaneously
  /// * [allows_revoting]: True, if the poll can be answered multiple times
  /// * [members_only]: True, if only the users that are members of the chat for more than a day will be able to vote
  /// * [country_codes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote. If empty, then all users can participate in the poll
  /// * [option_order]: The list of 0-based poll option identifiers in which the options of the poll must be shown; empty if the order of options must not be changed
  /// * [type]: Type of the poll
  /// * [open_period]: Amount of time the poll will be active after creation, in seconds
  /// * [close_date]: Point in time (Unix timestamp) when the poll will automatically be closed
  /// * [is_closed]: True, if the poll is closed
  /// * [vote_restriction_reason]: The reason describing, why the current user can't vote in the poll; may be null if the user can vote in the poll
  Poll copyWith({
    int? id,
    FormattedText? question,
    List<PollOption>? options,
    int? totalVoterCount,
    List<MessageSender>? recentVoterIds,
    bool? canGetVoters,
    bool? canSeeResults,
    bool? isAnonymous,
    bool? allowsMultipleAnswers,
    bool? allowsRevoting,
    bool? membersOnly,
    List<String>? countryCodes,
    List<int>? optionOrder,
    PollType? type,
    int? openPeriod,
    int? closeDate,
    bool? isClosed,
    PollVoteRestrictionReason? voteRestrictionReason,
  }) =>
      Poll(
        id: id ?? this.id,
        question: question ?? this.question,
        options: options ?? this.options,
        totalVoterCount: totalVoterCount ?? this.totalVoterCount,
        recentVoterIds: recentVoterIds ?? this.recentVoterIds,
        canGetVoters: canGetVoters ?? this.canGetVoters,
        canSeeResults: canSeeResults ?? this.canSeeResults,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        allowsMultipleAnswers:
            allowsMultipleAnswers ?? this.allowsMultipleAnswers,
        allowsRevoting: allowsRevoting ?? this.allowsRevoting,
        membersOnly: membersOnly ?? this.membersOnly,
        countryCodes: countryCodes ?? this.countryCodes,
        optionOrder: optionOrder ?? this.optionOrder,
        type: type ?? this.type,
        openPeriod: openPeriod ?? this.openPeriod,
        closeDate: closeDate ?? this.closeDate,
        isClosed: isClosed ?? this.isClosed,
        voteRestrictionReason:
            voteRestrictionReason ?? this.voteRestrictionReason,
      );

  /// TDLib object type
  static const String defaultObjectId = 'poll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
