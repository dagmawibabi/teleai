import '../features/telegram/presentation/chat_list_screen.dart' show clock24;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../core/widgets/brand_mark.dart';
import '../features/auth/data/auth_controller.dart';
import '../features/auth/presentation/code_screen.dart';
import '../features/auth/presentation/password_screen.dart';
import '../features/auth/presentation/phone_screen.dart';
import '../features/auth/presentation/qr_screen.dart';
import '../features/auth/presentation/unsupported_screen.dart';
import '../features/auth/presentation/welcome_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/settings/data/settings.dart';
import '../infrastructure/telegram/telegram_client.dart';
import 'theme.dart';
import '../features/telegram/presentation/link_opener.dart';

/// Lets screens know when another route covers them.
final appRouteObserver = RouteObserver<ModalRoute<void>>();

class TeleAiApp extends ConsumerWidget {
  const TeleAiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    clock24 = ref.watch(settingsProvider.select((s) => s.use24h));
    final settings = ref.watch(settingsProvider);
    AppColors.applyAccent(Color(settings.accent.value));
    return MaterialApp(
      title: 'TeleAI',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(
        accent: Color(settings.accent.value),
        chatFontSize: settings.chatFontSize,
      ),
      darkTheme: buildTheme(
        accent: Color(settings.accent.value),
        chatFontSize: settings.chatFontSize,
      ),
      themeMode: ThemeMode.dark,
      navigatorKey: appNavigatorKey,
      navigatorObservers: [appRouteObserver],
      home: const AppGate(),
    );
  }
}

/// Shows the screen TDLib's authorization state calls for, the way
/// telegrive's router does: the sign-in steps follow TDLib rather than being
/// pushed by hand.
class AppGate extends ConsumerStatefulWidget {
  const AppGate({super.key});

  @override
  ConsumerState<AppGate> createState() => _AppGateState();
}

class _AppGateState extends ConsumerState<AppGate> with WidgetsBindingObserver {
  /// Online while on screen and allowed; offline in the background.
  void _syncOnline() {
    final resumed = WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    final allowed = ref.read(settingsProvider).appearOnline;
    ref.read(telegramClientProvider).setOnline(resumed && allowed);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => _syncOnline();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.listenManual(settingsProvider, (_, _) => _syncOnline());
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncOnline());
    // TDLib itself was started with the process (see startRuntime).
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authStateProvider).value;
    final ui = ref.watch(authControllerProvider);

    final Widget screen;
    if (auth is td.AuthorizationStateReady) {
      screen = const ChatScreen(key: ValueKey('chat'));
    } else if (!asksToSignIn(auth)) {
      screen = const SplashScreen(key: ValueKey('splash'));
    } else if (!ui.startedSignIn &&
        auth is td.AuthorizationStateWaitPhoneNumber) {
      screen = const WelcomeScreen(key: ValueKey('welcome'));
    } else if (ui.editingPhone ||
        auth is td.AuthorizationStateWaitPhoneNumber) {
      screen = const PhoneScreen(key: ValueKey('phone'));
    } else {
      screen = switch (auth) {
        td.AuthorizationStateWaitCode() => const CodeScreen(
          key: ValueKey('code'),
        ),
        td.AuthorizationStateWaitPassword() => const PasswordScreen(
          key: ValueKey('password'),
        ),
        td.AuthorizationStateWaitOtherDeviceConfirmation() => const QrScreen(
          key: ValueKey('qr'),
        ),
        _ => const UnsupportedAuthScreen(key: ValueKey('unsupported')),
      };
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: screen,
    );
  }
}

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(telegramClientProvider);
    // Pure black with the bare triangle, like the native splash before it.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Space.xxl),
          child: ValueListenableBuilder<String?>(
            valueListenable: client.fatalError,
            builder: (context, error, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BrandMark(size: 160, background: null),
                const SizedBox(height: Space.l),
                if (error == null)
                  const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.6,
                      color: Colors.white54,
                    ),
                  )
                else
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      style: context.text.bodyMedium?.copyWith(
                        color: AppColors.danger,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
