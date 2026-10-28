import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// The app's standard bottom sheet: drag handle, surface colour, safe area,
/// and a body that scrolls with the sheet as it is dragged taller.
Future<T?> showAppSheet<T>(
  BuildContext context, {
  required Widget Function(BuildContext context, ScrollController scroll) builder,
  double initialSize = 0.86,
  double minSize = 0.4,
}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  showDragHandle: true,
  backgroundColor: AppColors.surface,
  builder: (context) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: initialSize,
    minChildSize: minSize,
    maxChildSize: 1,
    builder: builder,
  ),
);

/// A sheet sized to its content (forms, short editors), lifted above the
/// keyboard while typing.
Future<T?> showFormSheet<T>(BuildContext context, {required WidgetBuilder builder}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  showDragHandle: true,
  backgroundColor: AppColors.surface,
  builder: (context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
    child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(Space.xl, 0, Space.xl, Space.xl),
      child: builder(context),
    ),
  ),
);

/// A round initial on a colour picked from [name], for people without a
/// photo.
class LetterAvatar extends StatelessWidget {
  const LetterAvatar(this.name, {super.key, this.size = 34});
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final letter = name.trim().isEmpty ? '?' : name.trim().characters.first.toUpperCase();
    final hue = (name.hashCode % 360).abs().toDouble();
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: HSLColor.fromAHSL(1, hue, 0.45, 0.42).toColor(), shape: BoxShape.circle),
      child: Text(letter, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: size * 0.42)),
    );
  }
}

/// Asks before something is deleted or cleared. True when confirmed.
Future<bool> confirmDelete(
  BuildContext context, {
  required String title,
  String message = 'This can\'t be undone.',
  String action = 'Delete',
}) async =>
    await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.surface,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.xl, 0, Space.xl, Space.l),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.delete_outline_rounded, size: 32, color: AppColors.danger),
              const SizedBox(height: Space.m),
              Text(title, style: context.text.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: Space.s),
              Text(message, style: context.text.bodySmall, textAlign: TextAlign.center),
              const SizedBox(height: Space.xl),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.danger, foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context, true),
                child: Text(action),
              ),
              const SizedBox(height: Space.s),
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            ],
          ),
        ),
      ),
    ) ??
    false;
