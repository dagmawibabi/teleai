part of '../tdapi.dart';

/// **LinkPreviewOptions** *(linkPreviewOptions)* - basic class
///
/// Options to be used for generation of a link preview.
///
/// * [isDisabled]: True, if link preview must be disabled.
/// * [url]: URL to use for link preview. If empty, then the first URL found in the message text will be used.
/// * [forceSmallMedia]: True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified.
/// * [forceLargeMedia]: True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified.
/// * [showAboveText]: True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats.
final class LinkPreviewOptions extends TdObject {
  /// **LinkPreviewOptions** *(linkPreviewOptions)* - basic class
  ///
  /// Options to be used for generation of a link preview.
  ///
  /// * [isDisabled]: True, if link preview must be disabled.
  /// * [url]: URL to use for link preview. If empty, then the first URL found in the message text will be used.
  /// * [forceSmallMedia]: True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified.
  /// * [forceLargeMedia]: True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified.
  /// * [showAboveText]: True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats.
  const LinkPreviewOptions({
    required this.isDisabled,
    required this.url,
    required this.forceSmallMedia,
    required this.forceLargeMedia,
    required this.showAboveText,
  });

  /// True, if link preview must be disabled
  final bool isDisabled;

  /// URL to use for link preview. If empty, then the first URL found in the message text will be used
  final String url;

  /// True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified
  final bool forceSmallMedia;

  /// True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified
  final bool forceLargeMedia;

  /// True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats
  final bool showAboveText;

  /// Parse from a json
  factory LinkPreviewOptions.fromJson(Map<String, dynamic> json) =>
      LinkPreviewOptions(
        isDisabled: json['is_disabled'],
        url: json['url'],
        forceSmallMedia: json['force_small_media'],
        forceLargeMedia: json['force_large_media'],
        showAboveText: json['show_above_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_disabled": isDisabled,
      "url": url,
      "force_small_media": forceSmallMedia,
      "force_large_media": forceLargeMedia,
      "show_above_text": showAboveText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_disabled]: True, if link preview must be disabled
  /// * [url]: URL to use for link preview. If empty, then the first URL found in the message text will be used
  /// * [force_small_media]: True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified
  /// * [force_large_media]: True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified
  /// * [show_above_text]: True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats
  LinkPreviewOptions copyWith({
    bool? isDisabled,
    String? url,
    bool? forceSmallMedia,
    bool? forceLargeMedia,
    bool? showAboveText,
  }) =>
      LinkPreviewOptions(
        isDisabled: isDisabled ?? this.isDisabled,
        url: url ?? this.url,
        forceSmallMedia: forceSmallMedia ?? this.forceSmallMedia,
        forceLargeMedia: forceLargeMedia ?? this.forceLargeMedia,
        showAboveText: showAboveText ?? this.showAboveText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
