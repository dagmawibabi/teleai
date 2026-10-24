package com.example.teleai

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/// Starts TeleAI in the background after the phone restarts (when "Start
/// when the phone restarts" is on) and after an update (when it was
/// running in the background before).
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val start = when (intent.action) {
            Intent.ACTION_BOOT_COMPLETED, "android.intent.action.QUICKBOOT_POWERON" -> MainEngine.startsOnBoot(context)
            Intent.ACTION_MY_PACKAGE_REPLACED -> MainEngine.startsOnBoot(context) || MainEngine.wantedInBackground(context)
            else -> false
        }
        if (start) MainEngine.ensure(context)
    }
}
