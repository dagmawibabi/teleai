import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../features/assistant/watch_engine.dart';
import '../features/telegram/data/telegram_store.dart';
import '../infrastructure/telegram/telegram_client.dart';

/// What runs whether or not a screen is showing: TDLib, the store that
/// mirrors it, and (once signed in) the watches, reminders and briefs.
///
/// Android may start the app's process with no screen at all (after a
/// reboot, or to restart the background service), so none of this may wait
/// for a widget to be built.
void startRuntime(ProviderContainer container) {
  // The store listens from the first update, so nothing TDLib reports
  // before a screen opens is missed.
  container.read(telegramStoreProvider);
  container.read(telegramClientProvider).start().catchError((_) {});
  container.listen<AsyncValue<td.AuthorizationState>>(authStateProvider, (_, next) {
    if (next.value is td.AuthorizationStateReady) container.read(watchEngineProvider).start();
  }, fireImmediately: true);
}
