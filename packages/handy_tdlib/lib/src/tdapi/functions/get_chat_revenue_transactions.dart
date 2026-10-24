part of '../tdapi.dart';

/// **GetChatRevenueTransactions** *(getChatRevenueTransactions)* - TDLib function
///
/// Returns the list of revenue transactions for a chat. Currently, this method can be used only. for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true.
///
/// * [chatId]: Chat identifier.
/// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of transactions to be returned; up to 100.
///
/// [ChatRevenueTransactions] is returned on completion.
final class GetChatRevenueTransactions extends TdFunction {
  /// **GetChatRevenueTransactions** *(getChatRevenueTransactions)* - TDLib function
  ///
  /// Returns the list of revenue transactions for a chat. Currently, this method can be used only. for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of transactions to be returned; up to 100.
  ///
  /// [ChatRevenueTransactions] is returned on completion.
  const GetChatRevenueTransactions({
    required this.chatId,
    required this.offset,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of transactions to be returned; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [offset]: Offset of the first transaction to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of transactions to be returned; up to 100
  GetChatRevenueTransactions copyWith({
    int? chatId,
    String? offset,
    int? limit,
  }) =>
      GetChatRevenueTransactions(
        chatId: chatId ?? this.chatId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatRevenueTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
