import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart' show BrowserView;

import '../../app/theme.dart';
import '../ai/data/ai.dart';

/// The assistant's browser, live (omni_ai's [BrowserView]): watch what it
/// does, or take over (log in, solve a check it can't) and hand back. It is
/// the same page the browser tools drive.
class BrowserScreen extends ConsumerWidget {
  const BrowserScreen({super.key});

  static Future<void> open(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const BrowserScreen()));

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    backgroundColor: AppColors.bg,
    appBar: AppBar(title: const Text('Browser')),
    body: BrowserView(session: ref.watch(aiProvider).browser.session),
  );
}
