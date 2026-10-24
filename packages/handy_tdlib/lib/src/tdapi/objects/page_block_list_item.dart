part of '../tdapi.dart';

/// **PageBlockListItem** *(pageBlockListItem)* - basic class
///
/// Describes an item of a list page block.
///
/// * [label]: Item label.
/// * [blocks]: Item blocks.
/// * [hasCheckbox]: True, if the item has a checkbox.
/// * [isChecked]: True, if the item is checked.
/// * [value]: Value of the item; 0 for unordered lists.
/// * [type]: Type of item numbering; must be one of "a" for lowercase letters, "A" for uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals,. "1" for decimal numbers, or an empty string for unordered lists.
final class PageBlockListItem extends TdObject {
  /// **PageBlockListItem** *(pageBlockListItem)* - basic class
  ///
  /// Describes an item of a list page block.
  ///
  /// * [label]: Item label.
  /// * [blocks]: Item blocks.
  /// * [hasCheckbox]: True, if the item has a checkbox.
  /// * [isChecked]: True, if the item is checked.
  /// * [value]: Value of the item; 0 for unordered lists.
  /// * [type]: Type of item numbering; must be one of "a" for lowercase letters, "A" for uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals,. "1" for decimal numbers, or an empty string for unordered lists.
  const PageBlockListItem({
    required this.label,
    required this.blocks,
    required this.hasCheckbox,
    required this.isChecked,
    required this.value,
    required this.type,
  });

  /// Item label
  final String label;

  /// Item blocks
  final List<PageBlock> blocks;

  /// True, if the item has a checkbox
  final bool hasCheckbox;

  /// True, if the item is checked
  final bool isChecked;

  /// Value of the item; 0 for unordered lists
  final int value;

  /// Type of item numbering; must be one of "a" for lowercase letters, "A" for uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals,. "1" for decimal numbers, or an empty string for unordered lists
  final String type;

  /// Parse from a json
  factory PageBlockListItem.fromJson(Map<String, dynamic> json) =>
      PageBlockListItem(
        label: json['label'],
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
            .toList()),
        hasCheckbox: json['has_checkbox'],
        isChecked: json['is_checked'],
        value: json['value'],
        type: json['type'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "label": label,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "has_checkbox": hasCheckbox,
      "is_checked": isChecked,
      "value": value,
      "type": type,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [label]: Item label
  /// * [blocks]: Item blocks
  /// * [has_checkbox]: True, if the item has a checkbox
  /// * [is_checked]: True, if the item is checked
  /// * [value]: Value of the item; 0 for unordered lists
  /// * [type]: Type of item numbering; must be one of "a" for lowercase letters, "A" for uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals,. "1" for decimal numbers, or an empty string for unordered lists
  PageBlockListItem copyWith({
    String? label,
    List<PageBlock>? blocks,
    bool? hasCheckbox,
    bool? isChecked,
    int? value,
    String? type,
  }) =>
      PageBlockListItem(
        label: label ?? this.label,
        blocks: blocks ?? this.blocks,
        hasCheckbox: hasCheckbox ?? this.hasCheckbox,
        isChecked: isChecked ?? this.isChecked,
        value: value ?? this.value,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockListItem';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
