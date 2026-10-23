import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// Tells every node in a [JsonTree] to open or close at once.
class JsonTreeController extends ChangeNotifier {
  bool expanded = false;

  void expandAll() {
    expanded = true;
    notifyListeners();
  }

  void collapseAll() {
    expanded = false;
    notifyListeners();
  }
}

/// JSON as a tree of foldable objects and arrays.
class JsonTree extends StatelessWidget {
  const JsonTree({super.key, required this.data, required this.controller});
  final Object? data;
  final JsonTreeController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontFamily: 'monospace', fontSize: 12.5, height: 1.5),
      child: _Node(label: null, value: data, depth: 0, controller: controller),
    );
  }
}

class _Node extends StatefulWidget {
  const _Node({required this.label, required this.value, required this.depth, required this.controller});
  final String? label;
  final Object? value;
  final int depth;
  final JsonTreeController controller;

  @override
  State<_Node> createState() => _NodeState();
}

class _NodeState extends State<_Node> {
  late bool _open = widget.depth < 1 || widget.controller.expanded;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_sync);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_sync);
    super.dispose();
  }

  void _sync() => setState(() => _open = widget.controller.expanded || widget.depth < 1);

  static const _key = Color(0xFF9CC0FF);
  static const _string = Color(0xFFA5D6A7);
  static const _number = Color(0xFFF2C46D);
  static const _literal = Color(0xFFCE9DFF);

  Widget _label() => widget.label == null
      ? const SizedBox.shrink()
      : Text('${widget.label}: ', style: const TextStyle(color: _key));

  @override
  Widget build(BuildContext context) {
    final v = widget.value;
    if (v is Map || v is List) {
      final entries = v is Map ? v.entries.map((e) => ('${e.key}', e.value)).toList() : [for (final (i, x) in (v as List).indexed) ('$i', x)];
      final open = v is Map ? '{' : '[';
      final close = v is Map ? '}' : ']';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_open ? Icons.expand_more_rounded : Icons.chevron_right_rounded, size: 16, color: AppColors.text3),
                _label(),
                Text(_open ? open : '$open … $close', style: const TextStyle(color: AppColors.text2)),
                if (!_open)
                  Text(
                    '  ${entries.length} ${v is Map ? 'keys' : 'items'}',
                    style: const TextStyle(color: AppColors.text3, fontSize: 11.5),
                  ),
              ],
            ),
          ),
          if (_open) ...[
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppColors.line))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final (k, x) in entries)
                      _Node(label: k, value: x, depth: widget.depth + 1, controller: widget.controller),
                  ],
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 16), child: Text(close, style: const TextStyle(color: AppColors.text2))),
          ],
        ],
      );
    }
    final (text, color) = switch (v) {
      String s => ('"$s"', _string),
      num n => ('$n', _number),
      bool b => ('$b', _literal),
      null => ('null', _literal),
      _ => ('$v', AppColors.text),
    };
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SelectableText.rich(
        TextSpan(
          children: [
            if (widget.label != null) TextSpan(text: '${widget.label}: ', style: const TextStyle(color: _key)),
            TextSpan(text: text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
