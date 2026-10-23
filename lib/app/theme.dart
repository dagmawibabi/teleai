import 'package:flutter/material.dart';

/// The palette: near-black surfaces, one cool accent, three text tones.
abstract final class AppColors {
  static const bg = Color(0xFF0B0B0D);
  static const surface = Color(0xFF131316);
  static const surface2 = Color(0xFF1A1A1E);
  static const surface3 = Color(0xFF222227);
  static const line = Color(0xFF26262C);
  static const text = Color(0xFFEDEDF0);
  static const text2 = Color(0xFFA3A3AD);
  static const text3 = Color(0xFF6C6C76);
  /// The accent chosen in Settings (monochrome by default).
  static Color activeAccent = const Color(0xFFF4F4F5);
  static Color activeAccentDim = const Color(0xFFF4F4F5).withValues(alpha: 0.16);
  static Color get accent => activeAccent;
  static Color get accentDim => activeAccentDim;
  static void applyAccent(Color color) {
    activeAccent = color;
    activeAccentDim = color.withValues(alpha: color.computeLuminance() > 0.6 ? 0.16 : 0.18);
  }

  static const success = Color(0xFF6FCF97);
  static const warning = Color(0xFFF2C46D);
  static const danger = Color(0xFFFF7A7A);
}

abstract final class Space {
  static const double xs = 4;
  static const double s = 8;
  static const double m = 12;
  static const double l = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double x4 = 32;
}

abstract final class Radii {
  static const double s = 8;
  static const double m = 12;
  static const double l = 16;
  static const double xl = 22;
}

const tabularFigures = [FontFeature.tabularFigures()];

ThemeData buildTheme({
  Color? accent,
  double chatFontSize = 15.5,
}) {
  accent ??= AppColors.accent;
  final scheme = ColorScheme.dark(
    surface: AppColors.bg,
    primary: accent,
    onPrimary: Color(0xFF0B1220),
    secondary: accent,
    onSurface: AppColors.text,
    onSurfaceVariant: AppColors.text2,
    outline: AppColors.line,
    outlineVariant: AppColors.line,
    error: AppColors.danger,
    surfaceContainerLowest: AppColors.bg,
    surfaceContainerLow: AppColors.surface,
    surfaceContainer: AppColors.surface,
    surfaceContainerHigh: AppColors.surface2,
    surfaceContainerHighest: AppColors.surface3,
  );
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    brightness: Brightness.dark,
  );
  final text = base.textTheme.apply(
    bodyColor: AppColors.text,
    displayColor: AppColors.text,
  );
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: text.copyWith(
      headlineMedium: text.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
      ),
      headlineSmall: text.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
      ),
      titleLarge: text.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      titleSmall: text.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      bodyLarge: text.bodyLarge?.copyWith(height: 1.5, fontSize: chatFontSize),
      bodyMedium: text.bodyMedium?.copyWith(
        height: 1.45,
        color: AppColors.text,
        fontSize: chatFontSize - 1,
      ),
      bodySmall: text.bodySmall?.copyWith(color: AppColors.text2),
      labelSmall: text.labelSmall?.copyWith(
        color: AppColors.text3,
        letterSpacing: 0.2,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.line,
      thickness: 1,
      space: 1,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
      dragHandleColor: AppColors.text3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface2,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface2,
      hintStyle: const TextStyle(color: AppColors.text3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radii.l),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radii.l),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radii.l),
        borderSide: BorderSide(color: AppColors.accent, width: 1.2),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 50),
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.bg,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.l),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.accent),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surface2,
      selectedColor: AppColors.accentDim,
      side: const BorderSide(color: AppColors.line),
      labelStyle: const TextStyle(fontSize: 13, color: AppColors.text),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      showCheckmark: false,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? AppColors.text
              : AppColors.surface,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? AppColors.bg : AppColors.text2,
        ),
        side: const WidgetStatePropertyAll(BorderSide(color: AppColors.line)),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.accent,
      inactiveTrackColor: AppColors.surface3,
      thumbColor: AppColors.text,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (s) =>
            s.contains(WidgetState.selected) ? AppColors.bg : AppColors.text3,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected)
            ? AppColors.accent
            : AppColors.surface3,
      ),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.surface3,
      contentTextStyle: TextStyle(color: AppColors.text),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.surface2,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radii.l),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.accent,
    ),
  );
}

extension ThemeX on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
}

OverlayEntry? _toast;

/// A short message that slides in at the top of the screen and leaves on
/// its own, rather than a snackbar over the input box.
void showSnack(
  BuildContext context,
  String message, {
  IconData icon = Icons.check_circle_outline_rounded,
}) {
  final overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;
  _toast?.remove();
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (context) => _Toast(
      message: message,
      icon: icon,
      onDone: () {
        if (_toast == entry) _toast = null;
        if (entry.mounted) entry.remove();
      },
    ),
  );
  _toast = entry;
  overlay.insert(entry);
}

class _Toast extends StatefulWidget {
  const _Toast({
    required this.message,
    required this.icon,
    required this.onDone,
  });
  final String message;
  final IconData icon;
  final VoidCallback onDone;

  @override
  State<_Toast> createState() => _ToastState();
}

class _ToastState extends State<_Toast> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  )..forward();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 2200), () async {
      if (!mounted) return;
      await _c.reverse();
      widget.onDone();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + Space.s;
    final curve = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    return Positioned(
      top: top,
      left: Space.l,
      right: Space.l,
      child: IgnorePointer(
        child: FadeTransition(
          opacity: curve,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, -0.6),
              end: Offset.zero,
            ).animate(curve),
            child: Center(
              child: Material(
                color: AppColors.surface3,
                elevation: 8,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                  side: const BorderSide(color: AppColors.line),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Space.l,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, size: 16, color: AppColors.text2),
                      const SizedBox(width: Space.s),
                      Flexible(
                        child: Text(
                          widget.message,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13.5,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
