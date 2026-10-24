part of '../tdapi.dart';

/// **PollOption** *(pollOption)* - basic class
///
/// Describes one answer option of a poll.
///
/// * [id]: Unique identifier of the option in the poll; may be empty if yet unassigned.
/// * [text]: Option text; 1-100 characters; may contain only custom emoji entities.
/// * [media]: Option media; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaLink, pollMediaLocation, pollMediaPhoto, pollMediaSticker, pollMediaVenue, or pollMediaVideo *(optional)*.
/// * [voterCount]: Number of voters for this option, available only for closed or voted polls, or if the current user is the creator of the poll.
/// * [votePercentage]: The percentage of votes for this option; 0-100.
/// * [recentVoterIds]: Identifiers of recent voters for the option, if the poll is non-anonymous and poll results are available.
/// * [isChosen]: True, if the option was chosen by the user.
/// * [isBeingChosen]: True, if the option is being chosen by a pending setPollAnswer request.
/// * [author]: Identifier of the user or chat who added the option; may be null if the option existed from creation of the poll *(optional)*.
/// * [additionDate]: Point in time (Unix timestamp) when the option was added; 0 if the option existed from creation of the poll.
final class PollOption extends TdObject {
  /// **PollOption** *(pollOption)* - basic class
  ///
  /// Describes one answer option of a poll.
  ///
  /// * [id]: Unique identifier of the option in the poll; may be empty if yet unassigned.
  /// * [text]: Option text; 1-100 characters; may contain only custom emoji entities.
  /// * [media]: Option media; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaLink, pollMediaLocation, pollMediaPhoto, pollMediaSticker, pollMediaVenue, or pollMediaVideo *(optional)*.
  /// * [voterCount]: Number of voters for this option, available only for closed or voted polls, or if the current user is the creator of the poll.
  /// * [votePercentage]: The percentage of votes for this option; 0-100.
  /// * [recentVoterIds]: Identifiers of recent voters for the option, if the poll is non-anonymous and poll results are available.
  /// * [isChosen]: True, if the option was chosen by the user.
  /// * [isBeingChosen]: True, if the option is being chosen by a pending setPollAnswer request.
  /// * [author]: Identifier of the user or chat who added the option; may be null if the option existed from creation of the poll *(optional)*.
  /// * [additionDate]: Point in time (Unix timestamp) when the option was added; 0 if the option existed from creation of the poll.
  const PollOption({
    required this.id,
    required this.text,
    this.media,
    required this.voterCount,
    required this.votePercentage,
    required this.recentVoterIds,
    required this.isChosen,
    required this.isBeingChosen,
    this.author,
    required this.additionDate,
  });

  /// Unique identifier of the option in the poll; may be empty if yet unassigned
  final String id;

  /// Option text; 1-100 characters; may contain only custom emoji entities
  final FormattedText text;

  /// Option media; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaLink, pollMediaLocation, pollMediaPhoto, pollMediaSticker, pollMediaVenue, or pollMediaVideo
  final PollMedia? media;

  /// Number of voters for this option, available only for closed or voted polls, or if the current user is the creator of the poll
  final int voterCount;

  /// The percentage of votes for this option; 0-100
  final int votePercentage;

  /// Identifiers of recent voters for the option, if the poll is non-anonymous and poll results are available
  final List<MessageSender> recentVoterIds;

  /// True, if the option was chosen by the user
  final bool isChosen;

  /// True, if the option is being chosen by a pending setPollAnswer request
  final bool isBeingChosen;

  /// Identifier of the user or chat who added the option; may be null if the option existed from creation of the poll
  final MessageSender? author;

  /// Point in time (Unix timestamp) when the option was added; 0 if the option existed from creation of the poll
  final int additionDate;

  /// Parse from a json
  factory PollOption.fromJson(Map<String, dynamic> json) => PollOption(
        id: json['id'],
        text: FormattedText.fromJson(json['text']),
        media: json['media'] == null ? null : PollMedia.fromJson(json['media']),
        voterCount: json['voter_count'],
        votePercentage: json['vote_percentage'],
        recentVoterIds: List<MessageSender>.from(
            (json['recent_voter_ids'] ?? [])
                .map((item) => MessageSender.fromJson(item))
                .toList()),
        isChosen: json['is_chosen'],
        isBeingChosen: json['is_being_chosen'],
        author: json['author'] == null
            ? null
            : MessageSender.fromJson(json['author']),
        additionDate: json['addition_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "text": text.toJson(),
      "media": media?.toJson(),
      "voter_count": voterCount,
      "vote_percentage": votePercentage,
      "recent_voter_ids": recentVoterIds.map((i) => i.toJson()).toList(),
      "is_chosen": isChosen,
      "is_being_chosen": isBeingChosen,
      "author": author?.toJson(),
      "addition_date": additionDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the option in the poll; may be empty if yet unassigned
  /// * [text]: Option text; 1-100 characters; may contain only custom emoji entities
  /// * [media]: Option media; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaLink, pollMediaLocation, pollMediaPhoto, pollMediaSticker, pollMediaVenue, or pollMediaVideo
  /// * [voter_count]: Number of voters for this option, available only for closed or voted polls, or if the current user is the creator of the poll
  /// * [vote_percentage]: The percentage of votes for this option; 0-100
  /// * [recent_voter_ids]: Identifiers of recent voters for the option, if the poll is non-anonymous and poll results are available
  /// * [is_chosen]: True, if the option was chosen by the user
  /// * [is_being_chosen]: True, if the option is being chosen by a pending setPollAnswer request
  /// * [author]: Identifier of the user or chat who added the option; may be null if the option existed from creation of the poll
  /// * [addition_date]: Point in time (Unix timestamp) when the option was added; 0 if the option existed from creation of the poll
  PollOption copyWith({
    String? id,
    FormattedText? text,
    PollMedia? media,
    int? voterCount,
    int? votePercentage,
    List<MessageSender>? recentVoterIds,
    bool? isChosen,
    bool? isBeingChosen,
    MessageSender? author,
    int? additionDate,
  }) =>
      PollOption(
        id: id ?? this.id,
        text: text ?? this.text,
        media: media ?? this.media,
        voterCount: voterCount ?? this.voterCount,
        votePercentage: votePercentage ?? this.votePercentage,
        recentVoterIds: recentVoterIds ?? this.recentVoterIds,
        isChosen: isChosen ?? this.isChosen,
        isBeingChosen: isBeingChosen ?? this.isBeingChosen,
        author: author ?? this.author,
        additionDate: additionDate ?? this.additionDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
