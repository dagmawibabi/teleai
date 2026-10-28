package com.example.teleai

import android.app.Activity
import android.content.Intent
import android.os.Bundle

/// Receives what other apps send — Share → Triangle, and "Ask Triangle" in
/// the text selection menu — without a screen of its own. It reads the
/// shared text and files while it holds permission to (ShareChannel copies
/// them), then brings Triangle forward in its own task and closes. Opening
/// MainActivity straight from another app would put a second copy of it in
/// that app's task, sharing the one Flutter engine.
class ShareActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // The engine (and the channel Dart listens on) may not exist yet.
        MainEngine.ensure(this)
        ShareChannel.handle(this, intent)
        startActivity(
            Intent(this, MainActivity::class.java).addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_REORDER_TO_FRONT,
            ),
        )
        finish()
    }
}
