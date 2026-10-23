package com.example.teleai

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

/// TDLib, the watches and the assistant all run in the Dart isolate. A plain
/// FlutterActivity destroys its engine (and so that isolate) whenever the
/// activity goes away: back out of the app, swipe it from recents, or let
/// Android reclaim the activity. The keep-alive service then keeps an empty
/// process running and watches go quiet. So the engine lives in a cache
/// owned by the process instead, and a new activity picks the same one up.
class MainActivity : FlutterActivity() {
    override fun provideFlutterEngine(context: Context): FlutterEngine {
        val cache = FlutterEngineCache.getInstance()
        cache.get(ENGINE_ID)?.let { return it }
        val engine = FlutterEngine(context.applicationContext)
        engine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        cache.put(ENGINE_ID, engine)
        return engine
    }

    override fun shouldDestroyEngineWithHost(): Boolean = false

    companion object {
        private const val ENGINE_ID = "teleai_main"
    }
}
