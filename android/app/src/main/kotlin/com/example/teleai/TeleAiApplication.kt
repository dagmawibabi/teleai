package com.example.teleai

import io.flutter.app.FlutterApplication

/// When Android starts the process without a screen (it restarted the
/// background service after killing the app, say), the watches come back
/// with it instead of leaving an ongoing notification over nothing.
class TeleAiApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        if (!MainEngine.justBooted() && MainEngine.wantedInBackground(this)) {
            MainEngine.ensure(this)
        }
    }
}
