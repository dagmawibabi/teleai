package com.example.teleai

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/// Tells Flutter the app was opened (its screen created from scratch), as
/// opposed to coming back from another app. The engine outlives the screen
/// (see [MainEngine]) and Android doesn't reliably report the screen going
/// away, so Flutter can't tell the two apart by itself; Settings →
/// Appearance decides what an opening shows (a new chat or the last one).
object AppOpenChannel {
    private const val CHANNEL = "teleai/app_open"
    private var channel: MethodChannel? = null

    fun attach(engine: FlutterEngine) {
        channel = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
    }

    fun opened() {
        channel?.invokeMethod("opened", null)
    }
}
