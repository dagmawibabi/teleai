part of '../tdapi.dart';

/// **GetBankCardInfo** *(getBankCardInfo)* - TDLib function
///
/// Returns information about a bank card.
///
/// * [bankCardNumber]: The bank card number.
///
/// [BankCardInfo] is returned on completion.
final class GetBankCardInfo extends TdFunction {
  /// **GetBankCardInfo** *(getBankCardInfo)* - TDLib function
  ///
  /// Returns information about a bank card.
  ///
  /// * [bankCardNumber]: The bank card number.
  ///
  /// [BankCardInfo] is returned on completion.
  const GetBankCardInfo({
    required this.bankCardNumber,
  });

  /// The bank card number
  final String bankCardNumber;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bank_card_number": bankCardNumber,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bank_card_number]: The bank card number
  GetBankCardInfo copyWith({
    String? bankCardNumber,
  }) =>
      GetBankCardInfo(
        bankCardNumber: bankCardNumber ?? this.bankCardNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBankCardInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
