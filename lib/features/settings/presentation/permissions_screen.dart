import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:record/record.dart';

import '../../../app/theme.dart';
import '../../assistant/watch_engine.dart';
import '../../device/device.dart';

/// What Android lets Triangle do, why each matters, and how to fix it.
/// Rechecked whenever the app comes back to the front, since the answers
/// change in Android's own settings.
class PermissionsScreen extends ConsumerStatefulWidget {
  const PermissionsScreen({super.key});

  @override
  ConsumerState<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends ConsumerState<PermissionsScreen> with WidgetsBindingObserver {
  bool? _notifications;
  bool? _battery;
  bool? _exactAlarms;
  LocationPermission? _location;
  bool? _microphone;
  Map<String, bool> _device = const {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _check();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _check();
  }

  AndroidFlutterLocalNotificationsPlugin? get _android => FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  Future<void> _check() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    try {
      final n = await FlutterForegroundTask.checkNotificationPermission();
      final b = Platform.isAndroid ? await FlutterForegroundTask.isIgnoringBatteryOptimizations : true;
      final a = await _android?.canScheduleExactNotifications() ?? true;
      final l = await Geolocator.checkPermission();
      final d = await Device.status([for (final p in Device.all) p.id]);
      if (!mounted) return;
      setState(() {
        _notifications = n == NotificationPermission.granted;
        _battery = b;
        _exactAlarms = a;
        _location = l;
        _device = d;
      });
    } catch (e) {
      debugPrint('[Permissions] $e');
    }
  }

  Future<void> _fixNotifications() async {
    final r = await FlutterForegroundTask.requestNotificationPermission();
    if (r == NotificationPermission.permanently_denied) await Geolocator.openAppSettings();
    await _check();
  }

  Future<void> _fixBattery() async {
    final ok = await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    if (!ok) await FlutterForegroundTask.openIgnoreBatteryOptimizationSettings();
    await _check();
  }

  Future<void> _fixAlarms() async {
    await _android?.requestExactAlarmsPermission();
    await _check();
  }

  Future<void> _fixLocation() async {
    if (await Geolocator.checkPermission() == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    } else {
      await Geolocator.requestPermission();
    }
    await _check();
  }

  Future<void> _fixDevice(DevicePermission p) async {
    final r = await Device.request([p.id]);
    if (r[p.id] != true) await Device.openAppSettings();
    await _check();
  }

  Future<void> _fixMicrophone() async {
    final ok = await AudioRecorder().hasPermission();
    if (mounted) setState(() => _microphone = ok);
  }

  @override
  Widget build(BuildContext context) {
    final locationOk = _location == null
        ? null
        : _location == LocationPermission.always || _location == LocationPermission.whileInUse;
    final essentials = [_notifications, _battery, _exactAlarms];
    final missing = essentials.where((x) => x == false).length;
    final checked = essentials.every((x) => x != null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        actions: [IconButton(tooltip: 'Check again', onPressed: _check, icon: const Icon(Icons.refresh_rounded))],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
        children: [
          // At a glance: can watches and reminders work right now?
          Container(
            padding: const EdgeInsets.all(Space.l),
            decoration: BoxDecoration(
              color: (missing == 0 ? AppColors.success : AppColors.warning).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(Radii.l),
              border: Border.all(color: (missing == 0 ? AppColors.success : AppColors.warning).withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Icon(
                  !checked
                      ? Icons.hourglass_empty_rounded
                      : missing == 0
                      ? Icons.verified_rounded
                      : Icons.warning_amber_rounded,
                  color: missing == 0 ? AppColors.success : AppColors.warning,
                  size: 30,
                ),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        !checked
                            ? 'Checking…'
                            : missing == 0
                            ? 'Ready for the background'
                            : '$missing thing${missing == 1 ? '' : 's'} need${missing == 1 ? 's' : ''} attention',
                        style: context.text.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      ValueListenableBuilder<WatchStatus>(
                        valueListenable: ref.read(watchEngineProvider).status,
                        builder: (context, st, _) => Text(
                          st.background
                              ? 'The background service is running now.'
                              : 'The background service isn\'t running right now.',
                          style: context.text.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Space.l),
          Text('FOR WATCHES AND REMINDERS', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          _PermissionCard(
            icon: Icons.battery_saver_outlined,
            title: 'Unrestricted battery',
            why: 'Android pauses apps that save battery. Without this, watches stop listening soon after the screen '
                'turns off, and the app can\'t start itself after a restart.',
            ok: _battery,
            action: 'Allow',
            onFix: _fixBattery,
          ),
          _PermissionCard(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            why: 'Shows what watches find, approvals they wait for, mentions and reminders. Watches still run without '
                'it, but quietly.',
            ok: _notifications,
            action: 'Allow',
            onFix: _fixNotifications,
          ),
          _PermissionCard(
            icon: Icons.alarm_rounded,
            title: 'Alarms & reminders',
            why: 'Lets reminders ring on the minute. Without it Android may deliver them a few minutes late.',
            ok: _exactAlarms,
            action: 'Allow',
            onFix: _fixAlarms,
          ),
          const SizedBox(height: Space.l),
          Text('FOR SOME FEATURES', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          _PermissionCard(
            icon: Icons.mic_none_rounded,
            title: 'Microphone',
            why: 'For dictation and recording voice messages. Asked the first time you use them.',
            ok: _microphone,
            action: _microphone == null ? 'Check' : 'Allow',
            onFix: _fixMicrophone,
          ),
          _PermissionCard(
            icon: Icons.location_on_outlined,
            title: 'Location',
            why: 'Only when you ask the assistant to share your location or a live location.',
            ok: locationOk,
            action: _location == LocationPermission.deniedForever ? 'Open settings' : 'Allow',
            onFix: _fixLocation,
          ),
          if (Platform.isAndroid) ...[
            const SizedBox(height: Space.l),
            Text('FOR DEVICE TOOLS', style: context.text.labelSmall),
            const SizedBox(height: Space.s),
            for (final p in Device.all)
              _PermissionCard(
                icon: switch (p.id.split('.').last) {
                  'READ_SMS' => Icons.sms_outlined,
                  'SEND_SMS' => Icons.outgoing_mail,
                  'READ_CALL_LOG' => Icons.call_received_rounded,
                  'READ_CONTACTS' => Icons.contacts_outlined,
                  _ => Icons.call_outlined,
                },
                title: p.title,
                why: '${p.why} Asked the first time a tool needs it.',
                ok: _device[p.id],
                action: 'Allow',
                onFix: () => _fixDevice(p),
              ),
          ],
          const SizedBox(height: Space.l),
          Container(
            padding: const EdgeInsets.all(Space.l),
            decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_android_rounded, size: 18, color: AppColors.text2),
                    const SizedBox(width: Space.s),
                    Text('Phone makers\' battery savers', style: context.text.titleSmall),
                  ],
                ),
                const SizedBox(height: Space.s),
                Text(
                  'Samsung, Xiaomi, Huawei, Oppo and others add their own battery savers on top of Android\'s. If '
                  'watches still stop, find Triangle in your phone\'s battery settings and set it to "Unrestricted" or '
                  '"No restrictions", allow auto-start, and lock it in the recent apps.',
                  style: context.text.bodySmall?.copyWith(height: 1.4),
                ),
                const SizedBox(height: Space.m),
                OutlinedButton.icon(
                  onPressed: Geolocator.openAppSettings,
                  icon: const Icon(Icons.settings_outlined, size: 18),
                  label: const Text('Open Triangle in Android settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PermissionCard extends StatelessWidget {
  const _PermissionCard({
    required this.icon,
    required this.title,
    required this.why,
    required this.ok,
    required this.action,
    required this.onFix,
  });
  final IconData icon;
  final String title;
  final String why;
  final bool? ok;
  final String action;
  final VoidCallback onFix;

  @override
  Widget build(BuildContext context) {
    final color = ok == null
        ? AppColors.text3
        : ok!
        ? AppColors.success
        : AppColors.warning;
    return Container(
      margin: const EdgeInsets.only(bottom: Space.s),
      padding: const EdgeInsets.all(Space.m),
      decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(Radii.s)),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: Space.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(title, style: context.text.titleSmall)),
                    if (ok == true)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle_rounded, size: 16, color: AppColors.success),
                          SizedBox(width: 4),
                          Text('Allowed', style: TextStyle(fontSize: 12, color: AppColors.success)),
                        ],
                      )
                    else
                      // A small pill beside the title, not a full-size button.
                      Material(
                        color: AppColors.accentDim,
                        shape: const StadiumBorder(),
                        child: InkWell(
                          customBorder: const StadiumBorder(),
                          onTap: onFix,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            child: Text(
                              action,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.accent),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(why, style: context.text.bodySmall?.copyWith(height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
