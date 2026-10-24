part of '../tdapi.dart';

/// **DeepLinkInfo** *(deepLinkInfo)* - basic class
///
/// Contains information about a tg: deep link.
///
/// * [text]: Text to be shown to the user.
/// * [needUpdateApplication]: True, if the user must be asked to update the application.
final class DeepLinkInfo extends TdObject {
  /// **DeepLinkInfo** *(deepLinkInfo)* - basic class
  ///
  /// Contains information about a tg: deep link.
  ///
  /// * [text]: Text to be shown to the user.
  /// * [needUpdateApplication]: True, if the user must be asked to update the application.
  const DeepLinkInfo({
    required this.text,
    required this.needUpdateApplication,
    this.extra,
    this.clientId,
  });

  /// Text to be shown to the user
  final FormattedText text;

  /// True, if the user must be asked to update the application
  final bool needUpdateApplication;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory DeepLinkInfo.fromJson(Map<String, dynamic> json) => DeepLinkInfo(
        text: FormattedText.fromJson(json['text']),
        needUpdateApplication: json['need_update_application'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "need_update_application": needUpdateApplication,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text to be shown to the user
  /// * [need_update_application]: True, if the user must be asked to update the application
  DeepLinkInfo copyWith({
    FormattedText? text,
    bool? needUpdateApplication,
    dynamic extra,
    int? clientId,
  }) =>
      DeepLinkInfo(
        text: text ?? this.text,
        needUpdateApplication:
            needUpdateApplication ?? this.needUpdateApplication,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deepLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
