package com.example.teleai

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

/// A plain FlutterActivity destroys its engine (and so the isolate TDLib,
/// the watches and the assistant run in) whenever the activity goes away:
/// back out of the app, swipe it from recents, or let Android reclaim it.
/// So the activity borrows the process's engine (see [MainEngine]), which
/// may already be running in the background, and leaves it running.
class MainActivity : FlutterActivity() {
    override fun provideFlutterEngine(context: Context): FlutterEngine = MainEngine.ensure(context)

    override fun shouldDestroyEngineWithHost(): Boolean = false
}
