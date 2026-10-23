import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/data/settings.dart';

/// Local notifications for watches, and the quiet ongoing notification that
/// keeps the app alive in the background while watches are on.
class AppNotifier {
  AppNotifier({this.isQuiet});

  /// True inside the user's quiet hours: nothing pops up then.
  final bool Function()? isQuiet;

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _ready = false;
  int _nextId = 100;

  /// Conversation ids from tapped notifications, for the chat screen.
  final taps = StreamController<String>.broadcast();

  static const _channel = 'teleai_watches';
  static const _icon = 'ic_stat_teleai';

  Future<void> init() async {
    if (_ready || !(Platform.isAndroid || Platform.isIOS)) return;
    _ready = true;
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings(_icon),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (r) {
        final id = r.payload;
        if (id != null && id.isNotEmpty) taps.add(id);
      },
    );
    // A tap that started the app.
    final launch = await _plugin.getNotificationAppLaunchDetails();
    final payload = launch?.notificationResponse?.payload;
    if (launch?.didNotificationLaunchApp == true && payload != null && payload.isNotEmpty) {
      Future<void>.delayed(const Duration(seconds: 2), () => taps.add(payload));
    }
  }

  Future<void> requestPermission() async {
    await init();
    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  /// Shows a notification; tapping it opens [conversationId] when given.
  Future<void> show(String title, String body, {String? conversationId}) async {
    if (isQuiet?.call() ?? false) return;
    await init();
    if (!_ready) return;
    try {
      await _plugin.show(
        id: _nextId++,
        title: title,
        body: body,
        payload: conversationId,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel,
            'Watches',
            channelDescription: 'New messages and updates from your watches',
            importance: Importance.high,
            priority: Priority.high,
            styleInformation: BigTextStyleInformation(body),
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    } catch (e) {
      debugPrint('[Notify] $e');
    }
  }

  // ---- keep alive -----------------------------------------------------------

  bool _alive = false;

  /// Starts or stops the ongoing notification that keeps the process
  /// running while the app is in the background. TDLib, the watches and the
  /// assistant all live in the app's process, so this is all they need.
  Future<void> keepAlive(bool on, {int watches = 0}) async {
    if (!Platform.isAndroid) return;
    try {
      if (on && !_alive) {
        FlutterForegroundTask.init(
          androidNotificationOptions: AndroidNotificationOptions(
            channelId: 'teleai_keep_alive',
            channelName: 'Watching',
            channelDescription: 'Shown while TeleAI watches your chats in the background',
            channelImportance: NotificationChannelImportance.LOW,
            priority: NotificationPriority.LOW,
            onlyAlertOnce: true,
          ),
          iosNotificationOptions: const IOSNotificationOptions(showNotification: false),
          foregroundTaskOptions: ForegroundTaskOptions(
            eventAction: ForegroundTaskEventAction.nothing(),
            allowWakeLock: true,
            allowWifiLock: true,
          ),
        );
        final r = await FlutterForegroundTask.startService(
          serviceId: 5107,
          serviceTypes: const [ForegroundServiceTypes.specialUse],
          notificationTitle: 'TeleAI is watching',
          notificationText: '$watches watch${watches == 1 ? '' : 'es'} on',
          notificationIcon: const NotificationIcon(metaDataName: 'com.teleai.STAT_ICON'),
          callback: keepAliveEntryPoint,
        );
        _alive = r is ServiceRequestSuccess;
      } else if (on && _alive) {
        await FlutterForegroundTask.updateService(
          notificationTitle: 'TeleAI is watching',
          notificationText: '$watches watch${watches == 1 ? '' : 'es'} on',
        );
      } else if (!on && _alive) {
        await FlutterForegroundTask.stopService();
        _alive = false;
      }
    } catch (e) {
      debugPrint('[KeepAlive] $e');
    }
  }
}

/// The service's own isolate has nothing to do: the work happens in the
/// app's isolate, which the service keeps alive.
@pragma('vm:entry-point')
void keepAliveEntryPoint() => FlutterForegroundTask.setTaskHandler(_IdleHandler());

class _IdleHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {}

  @override
  void onRepeatEvent(DateTime timestamp) {}

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {}
}

final appNotifierProvider = Provider<AppNotifier>(
  (ref) => AppNotifier(isQuiet: () => ref.read(settingsProvider).isQuietNow),
);
