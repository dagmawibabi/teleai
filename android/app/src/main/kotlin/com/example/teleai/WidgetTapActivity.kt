package com.example.teleai

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.os.Bundle

/// A tap on a home-screen widget's row, without a screen of its own: a row
/// with a link opens it in the browser (or the app that handles it);
/// anything else opens Triangle on the brief or the widget.
class WidgetTapActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val link = intent.getStringExtra(BriefWidget.EXTRA_LINK)?.takeIf { it.startsWith("https://") || it.startsWith("http://") }
        val opened = link != null && try {
            startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(link)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
            true
        } catch (e: ActivityNotFoundException) {
            false
        }
        if (!opened) {
            startActivity(
                Intent(this, MainActivity::class.java)
                    .putExtras(intent)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP),
            )
        }
        finish()
    }
}
