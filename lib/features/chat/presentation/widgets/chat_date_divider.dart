import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme.dart';

/// A calendar-day marker between messages, in the device's local timezone.
class ChatDateDivider extends StatelessWidget {
  const ChatDateDivider({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final local = date.toLocal();
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final label = DateUtils.isSameDay(local, now)
        ? 'Today'
        : DateUtils.isSameDay(local, yesterday)
        ? 'Yesterday'
        : local.year == now.year
        ? DateFormat.MMMMd().format(local)
        : DateFormat.yMMMMd().format(local);
    return Padding(
      padding: const EdgeInsets.only(top: Space.s, bottom: Space.l),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.m),
            child: Text(label, style: context.text.labelSmall),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
