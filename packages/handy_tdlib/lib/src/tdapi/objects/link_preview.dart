part of '../tdapi.dart';

/// **LinkPreview** *(linkPreview)* - basic class
///
/// Describes a link preview.
///
/// * [url]: Original URL of the link.
/// * [displayUrl]: URL to display.
/// * [siteName]: Short name of the website (e.g., Google Docs, App Store).
/// * [title]: Title of the content.
/// * [description]: Description of the content.
/// * [author]: Author of the content.
/// * [type]: Type of the link preview.
/// * [hasLargeMedia]: True, if size of media in the preview can be changed.
/// * [showLargeMedia]: True, if large media preview must be shown; otherwise, the media preview must be shown small and only the first frame must be shown for videos.
/// * [showMediaAboveDescription]: True, if media must be shown above link preview description; otherwise, the media must be shown below the description.
/// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear.
/// * [showAboveText]: True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text.
/// * [instantViewVersion]: Version of instant view (currently, can be 1 or 2) for the web page; 0 if none.
final class LinkPreview extends TdObject {
  /// **LinkPreview** *(linkPreview)* - basic class
  ///
  /// Describes a link preview.
  ///
  /// * [url]: Original URL of the link.
  /// * [displayUrl]: URL to display.
  /// * [siteName]: Short name of the website (e.g., Google Docs, App Store).
  /// * [title]: Title of the content.
  /// * [description]: Description of the content.
  /// * [author]: Author of the content.
  /// * [type]: Type of the link preview.
  /// * [hasLargeMedia]: True, if size of media in the preview can be changed.
  /// * [showLargeMedia]: True, if large media preview must be shown; otherwise, the media preview must be shown small and only the first frame must be shown for videos.
  /// * [showMediaAboveDescription]: True, if media must be shown above link preview description; otherwise, the media must be shown below the description.
  /// * [skipConfirmation]: True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear.
  /// * [showAboveText]: True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text.
  /// * [instantViewVersion]: Version of instant view (currently, can be 1 or 2) for the web page; 0 if none.
  const LinkPreview({
    required this.url,
    required this.displayUrl,
    required this.siteName,
    required this.title,
    required this.description,
    required this.author,
    required this.type,
    required this.hasLargeMedia,
    required this.showLargeMedia,
    required this.showMediaAboveDescription,
    required this.skipConfirmation,
    required this.showAboveText,
    required this.instantViewVersion,
    this.extra,
    this.clientId,
  });

  /// Original URL of the link
  final String url;

  /// URL to display
  final String displayUrl;

  /// Short name of the website (e.g., Google Docs, App Store)
  final String siteName;

  /// Title of the content
  final String title;

  /// Description of the content
  final FormattedText description;

  /// Author of the content
  final String author;

  /// Type of the link preview
  final LinkPreviewType type;

  /// True, if size of media in the preview can be changed
  final bool hasLargeMedia;

  /// True, if large media preview must be shown; otherwise, the media preview must be shown small and only the first frame must be shown for videos
  final bool showLargeMedia;

  /// True, if media must be shown above link preview description; otherwise, the media must be shown below the description
  final bool showMediaAboveDescription;

  /// True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear
  final bool skipConfirmation;

  /// True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text
  final bool showAboveText;

  /// Version of instant view (currently, can be 1 or 2) for the web page; 0 if none
  final int instantViewVersion;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LinkPreview.fromJson(Map<String, dynamic> json) => LinkPreview(
        url: json['url'],
        displayUrl: json['display_url'],
        siteName: json['site_name'],
        title: json['title'],
        description: FormattedText.fromJson(json['description']),
        author: json['author'],
        type: LinkPreviewType.fromJson(json['type']),
        hasLargeMedia: json['has_large_media'],
        showLargeMedia: json['show_large_media'],
        showMediaAboveDescription: json['show_media_above_description'],
        skipConfirmation: json['skip_confirmation'],
        showAboveText: json['show_above_text'],
        instantViewVersion: json['instant_view_version'] ?? 0,
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "display_url": displayUrl,
      "site_name": siteName,
      "title": title,
      "description": description.toJson(),
      "author": author,
      "type": type.toJson(),
      "has_large_media": hasLargeMedia,
      "show_large_media": showLargeMedia,
      "show_media_above_description": showMediaAboveDescription,
      "skip_confirmation": skipConfirmation,
      "show_above_text": showAboveText,
      "instant_view_version": instantViewVersion,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: Original URL of the link
  /// * [display_url]: URL to display
  /// * [site_name]: Short name of the website (e.g., Google Docs, App Store)
  /// * [title]: Title of the content
  /// * [description]: Description of the content
  /// * [author]: Author of the content
  /// * [type]: Type of the link preview
  /// * [has_large_media]: True, if size of media in the preview can be changed
  /// * [show_large_media]: True, if large media preview must be shown; otherwise, the media preview must be shown small and only the first frame must be shown for videos
  /// * [show_media_above_description]: True, if media must be shown above link preview description; otherwise, the media must be shown below the description
  /// * [skip_confirmation]: True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear
  /// * [show_above_text]: True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text
  /// * [instant_view_version]: Version of instant view (currently, can be 1 or 2) for the web page; 0 if none
  LinkPreview copyWith({
    String? url,
    String? displayUrl,
    String? siteName,
    String? title,
    FormattedText? description,
    String? author,
    LinkPreviewType? type,
    bool? hasLargeMedia,
    bool? showLargeMedia,
    bool? showMediaAboveDescription,
    bool? skipConfirmation,
    bool? showAboveText,
    int? instantViewVersion,
    dynamic extra,
    int? clientId,
  }) =>
      LinkPreview(
        url: url ?? this.url,
        displayUrl: displayUrl ?? this.displayUrl,
        siteName: siteName ?? this.siteName,
        title: title ?? this.title,
        description: description ?? this.description,
        author: author ?? this.author,
        type: type ?? this.type,
        hasLargeMedia: hasLargeMedia ?? this.hasLargeMedia,
        showLargeMedia: showLargeMedia ?? this.showLargeMedia,
        showMediaAboveDescription:
            showMediaAboveDescription ?? this.showMediaAboveDescription,
        skipConfirmation: skipConfirmation ?? this.skipConfirmation,
        showAboveText: showAboveText ?? this.showAboveText,
        instantViewVersion: instantViewVersion ?? this.instantViewVersion,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
