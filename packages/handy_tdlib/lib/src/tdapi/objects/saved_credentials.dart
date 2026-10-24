part of '../tdapi.dart';

/// **SavedCredentials** *(savedCredentials)* - basic class
///
/// Contains information about saved payment credentials.
///
/// * [id]: Unique identifier of the saved credentials.
/// * [title]: Title of the saved credentials.
final class SavedCredentials extends TdObject {
  /// **SavedCredentials** *(savedCredentials)* - basic class
  ///
  /// Contains information about saved payment credentials.
  ///
  /// * [id]: Unique identifier of the saved credentials.
  /// * [title]: Title of the saved credentials.
  const SavedCredentials({
    required this.id,
    required this.title,
  });

  /// Unique identifier of the saved credentials
  final String id;

  /// Title of the saved credentials
  final String title;

  /// Parse from a json
  factory SavedCredentials.fromJson(Map<String, dynamic> json) =>
      SavedCredentials(
        id: json['id'],
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the saved credentials
  /// * [title]: Title of the saved credentials
  SavedCredentials copyWith({
    String? id,
    String? title,
  }) =>
      SavedCredentials(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savedCredentials';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
