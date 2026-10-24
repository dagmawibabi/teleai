part of '../tdapi.dart';

/// **ProfilePhoto** *(profilePhoto)* - basic class
///
/// Describes a user profile photo.
///
/// * [id]: Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos.
/// * [small]: A small (160x160) user profile photo. The file can be downloaded only before the photo is changed.
/// * [big]: A big (640x640) user profile photo. The file can be downloaded only before the photo is changed.
/// * [minithumbnail]: User profile photo minithumbnail; may be null *(optional)*.
/// * [hasAnimation]: True, if the photo has animated variant.
/// * [isPersonal]: True, if the photo is visible only for the current user.
final class ProfilePhoto extends TdObject {
  /// **ProfilePhoto** *(profilePhoto)* - basic class
  ///
  /// Describes a user profile photo.
  ///
  /// * [id]: Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos.
  /// * [small]: A small (160x160) user profile photo. The file can be downloaded only before the photo is changed.
  /// * [big]: A big (640x640) user profile photo. The file can be downloaded only before the photo is changed.
  /// * [minithumbnail]: User profile photo minithumbnail; may be null *(optional)*.
  /// * [hasAnimation]: True, if the photo has animated variant.
  /// * [isPersonal]: True, if the photo is visible only for the current user.
  const ProfilePhoto({
    required this.id,
    required this.small,
    required this.big,
    this.minithumbnail,
    required this.hasAnimation,
    required this.isPersonal,
  });

  /// Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
  final int id;

  /// A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
  final File small;

  /// A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
  final File big;

  /// User profile photo minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// True, if the photo has animated variant
  final bool hasAnimation;

  /// True, if the photo is visible only for the current user
  final bool isPersonal;

  /// Parse from a json
  factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        small: File.fromJson(json['small']),
        big: File.fromJson(json['big']),
        minithumbnail: json['minithumbnail'] == null
            ? null
            : Minithumbnail.fromJson(json['minithumbnail']),
        hasAnimation: json['has_animation'],
        isPersonal: json['is_personal'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "small": small.toJson(),
      "big": big.toJson(),
      "minithumbnail": minithumbnail?.toJson(),
      "has_animation": hasAnimation,
      "is_personal": isPersonal,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
  /// * [small]: A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
  /// * [big]: A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
  /// * [minithumbnail]: User profile photo minithumbnail; may be null
  /// * [has_animation]: True, if the photo has animated variant
  /// * [is_personal]: True, if the photo is visible only for the current user
  ProfilePhoto copyWith({
    int? id,
    File? small,
    File? big,
    Minithumbnail? minithumbnail,
    bool? hasAnimation,
    bool? isPersonal,
  }) =>
      ProfilePhoto(
        id: id ?? this.id,
        small: small ?? this.small,
        big: big ?? this.big,
        minithumbnail: minithumbnail ?? this.minithumbnail,
        hasAnimation: hasAnimation ?? this.hasAnimation,
        isPersonal: isPersonal ?? this.isPersonal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
