import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/widgets/app_sheet.dart';

/// Text selected in another app, and what to ask about it. Returns the
/// question to send, or null.
Future<String?> showAskSheet(BuildContext context, String selected) =>
    showFormSheet<String>(context, builder: (_) => _AskSheet(selected: selected));

class _AskSheet extends StatefulWidget {
  const _AskSheet({required this.selected});
  final String selected;

  @override
  State<_AskSheet> createState() => _AskSheetState();
}

class _AskSheetState extends State<_AskSheet> {
  final _question = TextEditingController();

  static const _actions = [
    (Icons.lightbulb_outline_rounded, 'Explain', 'Explain this simply'),
    (Icons.short_text_rounded, 'Summarise', 'Summarise this in a few bullet points'),
    (Icons.translate_rounded, 'Translate', 'Translate this into my language'),
    (Icons.fact_check_outlined, 'Fact-check', 'Is this accurate? Check the claims and say what is uncertain'),
    (Icons.reply_rounded, 'Reply ideas', 'Suggest three short replies to this'),
    (Icons.spellcheck_rounded, 'Improve', 'Improve the writing of this, keeping its meaning'),
  ];

  @override
  void dispose() {
    _question.dispose();
    super.dispose();
  }

  String _ask(String question) => '$question:\n\n"""\n${widget.selected}\n"""';

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Icon(Icons.auto_awesome_rounded, color: AppColors.accent),
          const SizedBox(width: Space.s),
          Text('Ask Triangle', style: context.text.titleMedium),
        ],
      ),
      const SizedBox(height: Space.m),
      Container(
        constraints: const BoxConstraints(maxHeight: 160),
        padding: const EdgeInsets.all(Space.m),
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(Radii.m),
          border: Border(left: BorderSide(color: AppColors.accent, width: 3)),
        ),
        child: SingleChildScrollView(child: Text(widget.selected, style: context.text.bodyMedium)),
      ),
      const SizedBox(height: Space.l),
      Wrap(
        spacing: Space.s,
        runSpacing: Space.s,
        children: [
          for (final (icon, label, question) in _actions)
            ActionChip(
              avatar: Icon(icon, size: 18),
              label: Text(label),
              onPressed: () => Navigator.pop(context, _ask(question)),
            ),
        ],
      ),
      const SizedBox(height: Space.l),
      TextField(
        controller: _question,
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'Or ask anything about it',
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_upward_rounded),
            onPressed: () {
              final q = _question.text.trim();
              if (q.isNotEmpty) Navigator.pop(context, _ask(q));
            },
          ),
        ),
        onSubmitted: (q) {
          if (q.trim().isNotEmpty) Navigator.pop(context, _ask(q.trim()));
        },
      ),
    ],
  );
}
