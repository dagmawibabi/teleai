part of '../tdapi.dart';

/// **SearchUserByPhoneNumber** *(searchUserByPhoneNumber)* - TDLib function
///
/// Searches a user by their phone number. Returns a 404 error if the user can't be found.
///
/// * [phoneNumber]: Phone number to search for.
/// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
///
/// [User] is returned on completion.
final class SearchUserByPhoneNumber extends TdFunction {
  /// **SearchUserByPhoneNumber** *(searchUserByPhoneNumber)* - TDLib function
  ///
  /// Searches a user by their phone number. Returns a 404 error if the user can't be found.
  ///
  /// * [phoneNumber]: Phone number to search for.
  /// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
  ///
  /// [User] is returned on completion.
  const SearchUserByPhoneNumber({
    required this.phoneNumber,
    required this.onlyLocal,
  });

  /// Phone number to search for
  final String phoneNumber;

  /// Pass true to get only locally available information without sending network requests
  final bool onlyLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "only_local": onlyLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: Phone number to search for
  /// * [only_local]: Pass true to get only locally available information without sending network requests
  SearchUserByPhoneNumber copyWith({
    String? phoneNumber,
    bool? onlyLocal,
  }) =>
      SearchUserByPhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        onlyLocal: onlyLocal ?? this.onlyLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchUserByPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
