import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';
import '../../../core/widgets/brand_mark.dart';
import '../data/auth_controller.dart';

class _Page {
  const _Page({required this.title, required this.body, required this.art});
  final String title;
  final String body;
  final Widget art;
}

/// A few quiet pages on what the app is, then sign-in.
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key, this.replay = false});

  /// Opened again from Settings: the last page closes it instead of
  /// starting sign-in.
  final bool replay;

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  final _pager = PageController();
  int _page = 0;

  static final _pages = [
    const _Page(
      title: 'Ask your Telegram anything.',
      body: 'How many channels you\'re in, what\'s new today, who\'s waiting on a reply. It reads your chats and shows its sources as chips you can open.',
      art: _Bubbles(lines: ['What did my channels post today?', 'Do I have unread DMs?', 'Catch me up on Hobbies']),
    ),
    const _Page(
      title: 'Briefed, morning and night.',
      body: 'A detailed rundown of everything that happened across your DMs, groups and channels, sorted by what needs you first. On a schedule or whenever you ask.',
      art: _Glyph(icon: Icons.wb_twilight_rounded),
    ),
    const _Page(
      title: 'Does what you can do.',
      body: 'Forward to many chats at once, run polls and quizzes, press bot buttons, translate posts, set chat backgrounds, send GIFs and stickers, check calls and members.',
      art: _FeatureGrid(
        items: [
          (Icons.forward_rounded, 'Forward'),
          (Icons.poll_outlined, 'Polls'),
          (Icons.smart_button_outlined, 'Bots'),
          (Icons.translate_rounded, 'Translate'),
          (Icons.wallpaper_outlined, 'Themes'),
          (Icons.gif_box_outlined, 'GIFs'),
          (Icons.call_outlined, 'Calls'),
          (Icons.groups_outlined, 'Members'),
          (Icons.schedule_send_outlined, 'Schedule'),
        ],
      ),
    ),
    const _Page(
      title: 'A canvas for what matters.',
      body: 'Save posts, DMs and comments into folders, or say "organise the last 10 posts from this channel by topic" and the assistant files them for you.',
      art: _Glyph(icon: Icons.dashboard_customize_outlined),
    ),
    const _Page(
      title: 'Just talk.',
      body: 'Send it voice messages: it understands them and can pass the recording on to a chat. Dictate, hear answers read aloud, record and send voice notes and videos.',
      art: _Glyph(icon: Icons.graphic_eq_rounded),
    ),
    const _Page(
      title: 'Careful by design.',
      body: 'Reading never marks messages as read. Sending, replying and reacting wait for your OK. Deleting and leaving are off until you turn them on, and read-only mode locks everything else.',
      art: _Glyph(icon: Icons.verified_user_outlined),
    ),
    const _Page(
      title: 'Watches while you\'re away.',
      body: 'Tell it to keep an eye on a person, a group or a channel. It notifies you, sums things up, or replies the way you asked.',
      art: _Glyph(icon: Icons.visibility_outlined),
    ),
    const _Page(
      title: 'It browses the web for you.',
      body: 'Reads blogs and docs, fills in forms on real sites, calls APIs, downloads files, and shows you screenshots of what it sees. Watch it live, or take over whenever you like.',
      art: _Bubbles(lines: ['What\'s new on dagmawibabi.com/blog?', 'Send "hi" through this sma.et link', 'Screenshot the page for me']),
    ),
    const _Page(
      title: 'Runs code. Reads GitHub.',
      body: 'A private sandbox on your phone runs Python and JavaScript to crunch numbers, make charts and files. It browses public GitHub repos too: READMEs, code, issues and releases.',
      art: _FeatureGrid(
        items: [
          (Icons.terminal_rounded, 'Python'),
          (Icons.javascript_rounded, 'JavaScript'),
          (Icons.bar_chart_rounded, 'Charts'),
          (Icons.code_rounded, 'GitHub'),
          (Icons.folder_zip_outlined, 'Zip files'),
          (Icons.download_rounded, 'Downloads'),
        ],
      ),
    ),
    const _Page(
      title: 'Reminders and routines.',
      body: '"Remind me to walk in 5 minutes." "Every weekday at 9, catch me up on my channels." One-off or repeating, as plain alarms or as jobs the assistant carries out.',
      art: _Glyph(icon: Icons.alarm_rounded),
    ),
    const _Page(
      title: 'All of Telegram, by asking.',
      body: 'Post and edit stories, organise folders, run your channels with full statistics, give Stars, open t.me links in place, find every file anyone sent you, and keep your account safe with a security check-up.',
      art: _FeatureGrid(
        items: [
          (Icons.amp_stories_outlined, 'Stories'),
          (Icons.folder_copy_outlined, 'Folders'),
          (Icons.query_stats_rounded, 'Statistics'),
          (Icons.star_rounded, 'Stars'),
          (Icons.manage_search_rounded, 'Search all'),
          (Icons.health_and_safety_outlined, 'Security'),
          (Icons.devices_rounded, 'Devices'),
          (Icons.storage_rounded, 'Storage'),
          (Icons.celebration_outlined, 'Effects'),
        ],
      ),
    ),
    const _Page(
      title: 'Your keys. Your phone.',
      body: 'No TeleAI servers. Conversations stay on this phone; AI runs through your own Vercel AI Gateway or OpenRouter key, with tokens and cost shown under every answer.',
      art: _Glyph(icon: Icons.key_rounded),
    ),
  ];

  bool get _last => _page == _pages.length - 1;

  @override
  void dispose() {
    _pager.dispose();
    super.dispose();
  }

  void _next() {
    if (_last) {
      widget.replay ? Navigator.of(context).pop() : ref.read(authControllerProvider.notifier).startSignIn();
    } else {
      _pager.nextPage(duration: const Duration(milliseconds: 380), curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.xxl, Space.l, Space.m, 0),
                  child: Row(
                    children: [
                      const BrandLockup(markSize: 28),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: _last ? 0 : 1,
                        duration: const Duration(milliseconds: 200),
                        child: TextButton(
                          onPressed: _last
                              ? null
                              : () => _pager.animateToPage(
                                  _pages.length - 1,
                                  duration: const Duration(milliseconds: 420),
                                  curve: Curves.easeOutCubic,
                                ),
                          style: TextButton.styleFrom(foregroundColor: AppColors.text2),
                          child: const Text('Skip'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pager,
                    itemCount: _pages.length,
                    onPageChanged: (i) => setState(() => _page = i),
                    itemBuilder: (context, i) {
                      final p = _pages[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Space.xxl),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(flex: 2),
                            Center(child: p.art),
                            const Spacer(flex: 2),
                            Text(p.title, style: context.text.headlineMedium?.copyWith(height: 1.15)),
                            const SizedBox(height: Space.l),
                            Text(p.body, style: context.text.bodyLarge?.copyWith(color: AppColors.text2)),
                            const Spacer(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.xxl, 0, Space.xxl, Space.l),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < _pages.length; i++)
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.only(right: 6),
                              width: i == _page ? 22 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: i == _page ? AppColors.text : AppColors.text3.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: Space.xl),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _next,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              _last ? (widget.replay ? 'Done' : 'Sign in with Telegram') : 'Next',
                              key: ValueKey(_last),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Space.m),
                      Text(
                        'Independent app, not affiliated with Telegram.',
                        style: context.text.bodySmall?.copyWith(color: AppColors.text3),
                      ),
                    ],
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

/// A large outlined glyph in a soft ring.
class _Glyph extends StatelessWidget {
  const _Glyph({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        gradient: RadialGradient(colors: [Colors.white.withValues(alpha: 0.06), Colors.transparent]),
      ),
      child: Center(
        child: Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface2,
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Icon(icon, size: 46, color: AppColors.text),
        ),
      ),
    );
  }
}

/// A few questions in bubbles, as the chat shows them.
class _Bubbles extends StatelessWidget {
  const _Bubbles({required this.lines});
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BrandMark(size: 64),
        const SizedBox(height: Space.xxl),
        for (final (i, line) in lines.indexed)
          Align(
            alignment: i.isOdd ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: Space.s),
              padding: const EdgeInsets.symmetric(horizontal: Space.l, vertical: Space.m),
              decoration: BoxDecoration(
                color: i.isOdd ? AppColors.surface2 : AppColors.surface3,
                borderRadius: BorderRadius.circular(Radii.xl),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Text(line, style: context.text.bodyMedium?.copyWith(color: AppColors.text2)),
            ),
          ),
      ],
    );
  }
}

/// A small grid of what the assistant can do.
class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid({required this.items});
  final List<(IconData, String)> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Wrap(
        spacing: Space.m,
        runSpacing: Space.m,
        alignment: WrapAlignment.center,
        children: [
          for (final (icon, label) in items)
            Container(
              width: 80,
              padding: const EdgeInsets.symmetric(vertical: Space.m),
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(Radii.l),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                children: [
                  Icon(icon, color: AppColors.text, size: 24),
                  const SizedBox(height: 6),
                  Text(label, style: context.text.labelSmall?.copyWith(color: AppColors.text2)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
