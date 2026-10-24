part of '../tdapi.dart';

/// **GetOption** *(getOption)* - TDLib function
///
/// Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization. Can be called synchronously for options "version" and "commit_hash".
///
/// * [name]: The name of the option.
///
/// [OptionValue] is returned on completion.
final class GetOption extends TdFunction {
  /// **GetOption** *(getOption)* - TDLib function
  ///
  /// Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization. Can be called synchronously for options "version" and "commit_hash".
  ///
  /// * [name]: The name of the option.
  ///
  /// [OptionValue] is returned on completion.
  const GetOption({
    required this.name,
  });

  /// The name of the option
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: The name of the option
  GetOption copyWith({
    String? name,
  }) =>
      GetOption(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
