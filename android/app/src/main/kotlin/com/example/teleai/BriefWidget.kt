package com.example.teleai

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/// The home-screen widget with the latest brief. Flutter writes the brief
/// into its shared preferences (lib/features/brief/brief_widget.dart) and
/// asks for a redraw over the "teleai/brief_widget" channel; a tap opens
/// the app on the Brief screen.
class BriefWidget : AppWidgetProvider() {
    override fun onUpdate(context: Context, manager: AppWidgetManager, ids: IntArray) {
        for (id in ids) manager.updateAppWidget(id, views(context))
    }

    companion object {
        const val EXTRA_OPEN_BRIEF = "com.example.teleai.OPEN_BRIEF"
        private const val CHANNEL = "teleai/brief_widget"

        private var channel: MethodChannel? = null

        /// A tap that started the app, until Flutter asks for it.
        @Volatile private var pendingOpen = false

        private fun prefs(context: Context) =
            context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)

        private fun views(context: Context): RemoteViews {
            val p = prefs(context)
            val text = p.getString("flutter.widget_brief_text", null)
            val views = RemoteViews(context.packageName, R.layout.brief_widget)
            views.setTextViewText(R.id.brief_title, p.getString("flutter.widget_brief_title", null) ?: "Brief")
            views.setTextViewText(R.id.brief_when, p.getString("flutter.widget_brief_when", null) ?: "")
            views.setTextViewText(
                R.id.brief_text,
                text ?: "No brief yet. Tap to open TeleAI and write one.",
            )
            val open = Intent(context, MainActivity::class.java).apply {
                putExtra(EXTRA_OPEN_BRIEF, true)
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP
            }
            val pending = PendingIntent.getActivity(
                context,
                0,
                open,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
            views.setOnClickPendingIntent(R.id.brief_root, pending)
            look(p, views)
            return views
        }

        /// The look chosen in Settings → Home-screen widget (BriefWidget's
        /// WidgetLook in Flutter, which stores only ints, strings and booleans).
        private fun look(p: android.content.SharedPreferences, views: RemoteViews) {
            fun int(key: String, fallback: Long) = try {
                p.getLong("flutter.$key", fallback)
            } catch (e: ClassCastException) {
                fallback
            }
            fun bool(key: String, fallback: Boolean) = p.getBoolean("flutter.$key", fallback)
            val unit = android.util.TypedValue.COMPLEX_UNIT_SP
            views.setInt(R.id.brief_bg, "setColorFilter", int("widget_background", 0xFF131316).toInt())
            views.setInt(R.id.brief_bg, "setImageAlpha", (int("widget_opacity", 95).coerceIn(0, 100) * 255 / 100).toInt())
            views.setTextViewTextSize(R.id.brief_text, unit, int("widget_font_x10", 125) / 10f)
            views.setTextViewTextSize(R.id.brief_title, unit, int("widget_title_x10", 140) / 10f)
            val title = int("widget_title_color", 0xFFEDEDF0).toInt()
            val body = int("widget_body_color", 0xFFC9C9D1).toInt()
            views.setTextColor(R.id.brief_title, title)
            views.setTextColor(R.id.brief_text, body)
            views.setTextColor(R.id.brief_when, body)
            views.setTextColor(R.id.brief_footer, body)
            views.setInt(R.id.brief_text, "setMaxLines", int("widget_max_lines", 14).toInt().coerceIn(2, 40))
            val show = android.view.View.VISIBLE
            val hide = android.view.View.GONE
            views.setViewVisibility(R.id.brief_when, if (bool("widget_show_time", true)) show else hide)
            views.setViewVisibility(R.id.brief_title, if (bool("widget_show_title", true)) show else hide)
            views.setViewVisibility(R.id.brief_footer, if (bool("widget_show_footer", true)) show else hide)
        }

        fun updateAll(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(ComponentName(context, BriefWidget::class.java))
            for (id in ids) manager.updateAppWidget(id, views(context))
        }

        fun attach(context: Context, engine: FlutterEngine) {
            val app = context.applicationContext
            val ch = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
            ch.setMethodCallHandler { call, result ->
                when (call.method) {
                    "update" -> {
                        updateAll(app)
                        result.success(null)
                    }
                    "takeLaunch" -> {
                        result.success(pendingOpen)
                        pendingOpen = false
                    }
                    else -> result.notImplemented()
                }
            }
            channel = ch
        }

        /// The activity was opened from the widget: show the brief now if
        /// Flutter is listening, or when it asks.
        fun handle(intent: Intent?) {
            if (intent?.getBooleanExtra(EXTRA_OPEN_BRIEF, false) != true) return
            intent.removeExtra(EXTRA_OPEN_BRIEF)
            pendingOpen = true
            channel?.invokeMethod("openBrief", null, object : MethodChannel.Result {
                override fun success(result: Any?) {
                    pendingOpen = false
                }

                override fun error(code: String, message: String?, details: Any?) {}

                override fun notImplemented() {}
            })
        }
    }
}
