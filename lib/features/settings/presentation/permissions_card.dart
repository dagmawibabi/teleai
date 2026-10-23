import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:record/record.dart';

import '../../../app/theme.dart';

/// What Android lets the app do, with a way to fix each. Checked again
/// whenever the app comes back to the front, since the answers usually
/// change in Android's own settings.
class PermissionsCard extends StatefulWidget {
  const PermissionsCard({super.key});

  @override
  State<PermissionsCard> createState() => _PermissionsCardState();
}

class _PermissionsCardState extends State<PermissionsCard> with WidgetsBindingObserver {
  bool? _notifications;
  bool? _background;
  LocationPermission? _location;
  bool? _microphone;

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

  Future<void> _check() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    try {
      final n = await FlutterForegroundTask.checkNotificationPermission();
      final b = Platform.isAndroid ? await FlutterForegroundTask.isIgnoringBatteryOptimizations : true;
      final l = await Geolocator.checkPermission();
      if (!mounted) return;
      setState(() {
        _notifications = n == NotificationPermission.granted;
        _background = b;
        _location = l;
      });
    } catch (e) {
      debugPrint('[Permissions] $e');
    }
  }

  Future<void> _askNotifications() async {
    final r = await FlutterForegroundTask.requestNotificationPermission();
    if (r == NotificationPermission.permanently_denied) await Geolocator.openAppSettings();
    await _check();
  }

  Future<void> _askBackground() async {
    final ok = await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    if (!ok) await FlutterForegroundTask.openIgnoreBatteryOptimizationSettings();
    await _check();
  }

  Future<void> _askLocation() async {
    var p = await Geolocator.checkPermission();
    if (p == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    } else {
      p = await Geolocator.requestPermission();
    }
    await _check();
  }

  Future<void> _askMicrophone() async {
    final ok = await AudioRecorder().hasPermission();
    if (mounted) setState(() => _microphone = ok);
  }

  @override
  Widget build(BuildContext context) {
    final locationOk = _location == LocationPermission.always || _location == LocationPermission.whileInUse;
    return Column(
      children: [
        _Row(
          icon: Icons.notifications_none_rounded,
          title: 'Notifications',
          why: 'For watch updates and approvals',
          ok: _notifications,
          action: 'Allow',
          onFix: _askNotifications,
        ),
        _Row(
          icon: Icons.battery_saver_outlined,
          title: 'Run in the background',
          why: 'Lets watches keep listening when the screen is off',
          ok: _background,
          action: 'Allow',
          onFix: _askBackground,
        ),
        _Row(
          icon: Icons.location_on_outlined,
          title: 'Location',
          why: 'Only when you share your location',
          ok: _location == null ? null : locationOk,
          action: _location == LocationPermission.deniedForever ? 'Open settings' : 'Allow',
          onFix: _askLocation,
        ),
        _Row(
          icon: Icons.mic_none_rounded,
          title: 'Microphone',
          why: 'For dictation',
          ok: _microphone,
          action: _microphone == null ? 'Check' : 'Allow',
          onFix: _askMicrophone,
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
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
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(why, style: context.text.bodySmall),
      trailing: ok == true
          ? const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_rounded, size: 18, color: AppColors.success),
                SizedBox(width: 4),
                Text('Allowed', style: TextStyle(fontSize: 12.5, color: AppColors.success)),
              ],
            )
          : TextButton(onPressed: onFix, child: Text(action)),
    );
  }
}
