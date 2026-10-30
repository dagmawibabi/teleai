import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

import 'app/controller.dart';
import 'app/home_screen.dart';
import 'core/tailscale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final controller = await CompanionController.create();

  await windowManager.waitUntilReadyToShow(
    const WindowOptions(
      title: 'Triangle Companion',
      size: Size(1040, 760),
      minimumSize: Size(760, 560),
      center: true,
    ),
    () async {
      await windowManager.setPreventClose(true);
      await windowManager.show();
      await windowManager.focus();
    },
  );

  controller.onApprovalNeeded = () async {
    await windowManager.show();
    await windowManager.focus();
  };
  await controller.start();
  runApp(CompanionApp(controller: controller));
}

class CompanionApp extends StatefulWidget {
  const CompanionApp({super.key, required this.controller});
  final CompanionController controller;

  @override
  State<CompanionApp> createState() => _CompanionAppState();
}

class _CompanionAppState extends State<CompanionApp> with WindowListener, TrayListener {
  CompanionController get c => widget.controller;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    trayManager.addListener(this);
    _setUpTray();
    c.config.addListener(_setUpTray);
    c.clients.addListener(_setUpTray);
  }

  Future<void> _setUpTray() async {
    await trayManager.setIcon('assets/tray.ico');
    final live = c.clients.value.values.any((x) => x.liveSessions > 0);
    await trayManager.setToolTip(c.config.value.paused
        ? 'Triangle Companion (paused)'
        : live
            ? 'Triangle Companion: Triangle is watching live'
            : c.anyConnected
                ? 'Triangle Companion: Triangle connected'
                : 'Triangle Companion');
    await trayManager.setContextMenu(Menu(items: [
      MenuItem(key: 'open', label: 'Open Triangle Companion'),
      MenuItem(key: 'pause', label: c.config.value.paused ? 'Resume' : 'Pause'),
      MenuItem.separator(),
      MenuItem(key: 'quit', label: 'Quit'),
    ]));
  }

  @override
  void onWindowClose() {
    // Closing keeps it running in the tray.
    windowManager.hide();
  }

  @override
  void onTrayIconMouseDown() {
    windowManager.show();
    windowManager.focus();
  }

  @override
  void onTrayIconRightMouseDown() => trayManager.popUpContextMenu();

  @override
  Future<void> onTrayMenuItemClick(MenuItem item) async {
    switch (item.key) {
      case 'open':
        await windowManager.show();
        await windowManager.focus();
      case 'pause':
        await c.change((x) => x.copyWith(paused: !x.paused));
      case 'quit':
        await Tailscale.stopServing();
        await c.server.dispose();
        await trayManager.destroy();
        await windowManager.setPreventClose(false);
        await windowManager.destroy();
        exit(0);
    }
  }

  @override
  void dispose() {
    c.config.removeListener(_setUpTray);
    c.clients.removeListener(_setUpTray);
    windowManager.removeListener(this);
    trayManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF6E56CF);
    return MaterialApp(
      title: 'Triangle Companion',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(colorSchemeSeed: seed, brightness: Brightness.light, useMaterial3: true),
      darkTheme: ThemeData(colorSchemeSeed: seed, brightness: Brightness.dark, useMaterial3: true),
      home: HomeScreen(controller: c),
    );
  }
}
