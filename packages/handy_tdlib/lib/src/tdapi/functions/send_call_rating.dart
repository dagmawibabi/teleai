part of '../tdapi.dart';

/// **SendCallRating** *(sendCallRating)* - TDLib function
///
/// Sends a call rating.
///
/// * [callId]: Call identifier.
/// * [rating]: Call rating; 1-5.
/// * [comment]: An optional user comment if the rating is less than 5.
/// * [problems]: List of the exact types of problems with the call, specified by the user.
///
/// [Ok] is returned on completion.
final class SendCallRating extends TdFunction {
  /// **SendCallRating** *(sendCallRating)* - TDLib function
  ///
  /// Sends a call rating.
  ///
  /// * [callId]: Call identifier.
  /// * [rating]: Call rating; 1-5.
  /// * [comment]: An optional user comment if the rating is less than 5.
  /// * [problems]: List of the exact types of problems with the call, specified by the user.
  ///
  /// [Ok] is returned on completion.
  const SendCallRating({
    required this.callId,
    required this.rating,
    required this.comment,
    required this.problems,
  });

  /// Call identifier
  final InputCall callId;

  /// Call rating; 1-5
  final int rating;

  /// An optional user comment if the rating is less than 5
  final String comment;

  /// List of the exact types of problems with the call, specified by the user
  final List<CallProblem> problems;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "call_id": callId.toJson(),
      "rating": rating,
      "comment": comment,
      "problems": problems.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: Call identifier
  /// * [rating]: Call rating; 1-5
  /// * [comment]: An optional user comment if the rating is less than 5
  /// * [problems]: List of the exact types of problems with the call, specified by the user
  SendCallRating copyWith({
    InputCall? callId,
    int? rating,
    String? comment,
    List<CallProblem>? problems,
  }) =>
      SendCallRating(
        callId: callId ?? this.callId,
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        problems: problems ?? this.problems,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendCallRating';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
