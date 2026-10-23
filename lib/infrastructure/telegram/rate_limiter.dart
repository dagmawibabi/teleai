import 'dart:async';
import 'dart:math';

/// Paces requests that reach Telegram's servers.
///
/// Telegram doesn't publish fixed limits; it answers a client that asks too
/// fast with FLOOD_WAIT_X and expects it to stop for X seconds, and keeps
/// lengthening the wait for clients that don't. So requests go through a
/// token bucket (a short burst, then a steady trickle), and a flood wait
/// pauses everything that goes through here until it has passed.
class RateLimiter {
  RateLimiter({this.capacity = 20, this.refillEvery = const Duration(milliseconds: 1200)})
    : _tokens = capacity.toDouble();

  /// How many requests may go out back to back.
  final int capacity;

  /// One more request is allowed this often once the burst is spent.
  final Duration refillEvery;

  double _tokens;
  DateTime _last = DateTime.now();
  DateTime? _pausedUntil;
  Future<void> _queue = Future.value();

  /// When a flood wait ends, while one is in force.
  DateTime? get pausedUntil {
    final until = _pausedUntil;
    return until != null && until.isAfter(DateTime.now()) ? until : null;
  }

  void _refill() {
    final now = DateTime.now();
    final gained = now.difference(_last).inMicroseconds / refillEvery.inMicroseconds;
    _tokens = min(capacity.toDouble(), _tokens + gained);
    _last = now;
  }

  /// Waits for a turn. Callers queue in order so a burst can't jump ahead.
  Future<void> acquire() {
    final turn = _queue.then((_) async {
      final paused = pausedUntil;
      if (paused != null) await Future<void>.delayed(paused.difference(DateTime.now()));
      _refill();
      if (_tokens < 1) {
        final waitUs = ((1 - _tokens) * refillEvery.inMicroseconds).ceil();
        await Future<void>.delayed(Duration(microseconds: waitUs));
        _refill();
      }
      _tokens -= 1;
    });
    _queue = turn.catchError((_) {});
    return turn;
  }

  /// Telegram asked for [seconds] of quiet.
  void floodWait(int seconds) {
    final until = DateTime.now().add(Duration(seconds: seconds + 1));
    if (_pausedUntil == null || until.isAfter(_pausedUntil!)) _pausedUntil = until;
    _tokens = 0;
  }
}
