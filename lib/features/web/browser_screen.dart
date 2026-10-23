import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/theme.dart';
import 'browser_session.dart';

/// The assistant's browser, live: watch what it does, or take over (log
/// in, solve a check it can't) and hand back. It is the same page the
/// browser tools drive.
class BrowserScreen extends ConsumerWidget {
  const BrowserScreen({super.key});

  static Future<void> open(BuildContext context) =>
      Navigator.of(context)
          .push(MaterialPageRoute<void>(builder: (_) => const BrowserScreen()));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(browserSessionProvider);
    return ValueListenableBuilder<int>(
      valueListenable: session.revision,
      builder: (context, _, _) {
        final c = session.controller;
        return Scaffold(
          backgroundColor: AppColors.bg,
          appBar: AppBar(
            titleSpacing: 0,
            title: c == null
                ? const Text('Browser')
                : FutureBuilder<String?>(
                    future: c.currentUrl(),
                    builder: (_, snap) => Text(
                      snap.data ?? 'Browser',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
            actions: [
              if (c != null) ...[
                IconButton(
                  tooltip: 'Back',
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  onPressed: () async {
                    if (await c.canGoBack()) await c.goBack();
                  },
                ),
                IconButton(
                  tooltip: 'Reload',
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: c.reload,
                ),
                IconButton(
                  tooltip: 'Close the page',
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () async {
                    await session.close();
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ],
            ],
          ),
          body: c == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(Space.xxl),
                    child: Text(
                      BrowserSession.supported
                          ? 'Nothing open. Ask the assistant to open a site, e.g. "open Wikipedia and summarise the Moon article".'
                          : 'The browser works on Android and iOS.',
                      textAlign: TextAlign.center,
                      style: context.text.bodyMedium?.copyWith(
                        color: AppColors.text2,
                      ),
                    ),
                  ),
                )
              : WebViewWidget(controller: c),
        );
      },
    );
  }
}
