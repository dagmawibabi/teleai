package com.example.teleai

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.util.TypedValue
import android.view.View
import android.widget.RemoteViews
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

/// Home-screen widgets: the latest brief, or a custom widget the person or
/// the assistant made. Flutter writes each widget's rows into its shared
/// preferences ("widget_payload.<id>", lib/features/brief/home_widgets.dart)
/// and which one each widget on the home screen shows ("widget_bindings"),
/// then asks for a redraw over the "teleai/brief_widget" channel. Rows are a
/// scrolling list (WidgetListService); a tap opens the app there.
class BriefWidget : AppWidgetProvider() {
    override fun onUpdate(context: Context, manager: AppWidgetManager, ids: IntArray) {
        for (id in ids) manager.updateAppWidget(id, views(context, id))
        manager.notifyAppWidgetViewDataChanged(ids, R.id.widget_list)
    }

    /// The person's widget look (Settings → Home-screen widget).
    class Look(
        val background: Int,
        val opacity: Int,
        val title: Int,
        val body: Int,
        val bodySize: Float,
        val titleSize: Float,
        val maxLines: Int,
        val showTime: Boolean,
        val showTitle: Boolean,
        val showFooter: Boolean,
        val images: Boolean,
    ) {
        companion object {
            fun read(context: Context): Look {
                val p = prefs(context)
                // Flutter stores ints as longs.
                fun int(key: String, fallback: Long) = try {
                    p.getLong("flutter.$key", fallback)
                } catch (e: ClassCastException) {
                    fallback
                }
                fun bool(key: String, fallback: Boolean) = try {
                    p.getBoolean("flutter.$key", fallback)
                } catch (e: ClassCastException) {
                    fallback
                }
                return Look(
                    background = int("widget_background", 0xFF131316).toInt(),
                    opacity = int("widget_opacity", 95).toInt().coerceIn(0, 100),
                    title = int("widget_title_color", 0xFFEDEDF0).toInt(),
                    body = int("widget_body_color", 0xFFC9C9D1).toInt(),
                    bodySize = int("widget_font_x10", 125) / 10f,
                    titleSize = int("widget_title_x10", 140) / 10f,
                    maxLines = int("widget_max_lines", 14).toInt().coerceIn(2, 40),
                    showTime = bool("widget_show_time", true),
                    showTitle = bool("widget_show_title", true),
                    showFooter = bool("widget_show_footer", true),
                    images = bool("widget_show_images", true),
                )
            }
        }
    }

    companion object {
        const val EXTRA_OPEN_BRIEF = "com.example.teleai.OPEN_BRIEF"
        const val EXTRA_WIDGET = "com.example.teleai.OPEN_WIDGET"
        const val EXTRA_LINK = "com.example.teleai.WIDGET_LINK"
        private const val CHANNEL = "teleai/brief_widget"
        private const val BRIEF = "brief"

        private var channel: MethodChannel? = null

        /// A tap that started the app, until Flutter asks for it.
        @Volatile private var pendingOpen: Map<String, Any?>? = null

        fun prefs(context: Context): SharedPreferences =
            context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)

        /// The widget the home-screen widget [widgetId] shows.
        fun widgetFor(context: Context, widgetId: Int): String {
            val p = prefs(context)
            val bound = try {
                JSONObject(p.getString("flutter.widget_bindings", null) ?: "{}").optString("$widgetId")
            } catch (e: Exception) {
                ""
            }
            return bound.ifEmpty { p.getString("flutter.widget_default", null) ?: BRIEF }
        }

        /// What [widgetId] shows: title, when, empty text and rows. A widget
        /// that was deleted falls back to the brief.
        fun payload(context: Context, widgetId: Int): JSONObject? {
            val p = prefs(context)
            fun read(id: String) = p.getString("flutter.widget_payload.$id", null)?.let {
                try {
                    JSONObject(it)
                } catch (e: Exception) {
                    null
                }
            }
            return read(widgetFor(context, widgetId)) ?: read(BRIEF)
        }

        private fun views(context: Context, widgetId: Int): RemoteViews {
            val payload = payload(context, widgetId)
            val shown = widgetFor(context, widgetId)
            val isBrief = shown == BRIEF || payload?.optBoolean("brief") == true
            val views = RemoteViews(context.packageName, R.layout.brief_widget)
            views.setTextViewText(R.id.brief_title, payload?.optString("title")?.ifEmpty { null } ?: "Brief")
            views.setTextViewText(R.id.brief_when, payload?.optString("when") ?: "")
            views.setTextViewText(
                R.id.widget_empty,
                payload?.optString("empty")?.ifEmpty { null } ?: "No brief yet. Tap to open Triangle and write one.",
            )

            val list = Intent(context, WidgetListService::class.java).apply {
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId)
                // A distinct address per widget, so each gets its own rows.
                data = Uri.parse(toUri(Intent.URI_INTENT_SCHEME))
            }
            views.setRemoteAdapter(R.id.widget_list, list)
            views.setEmptyView(R.id.widget_list, R.id.widget_empty)

            val open = Intent(context, MainActivity::class.java).apply {
                if (isBrief) putExtra(EXTRA_OPEN_BRIEF, true) else putExtra(EXTRA_WIDGET, shown)
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP
            }
            views.setOnClickPendingIntent(
                R.id.brief_root,
                PendingIntent.getActivity(context, widgetId, open, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE),
            )
            // Rows add their link to this (so it must be mutable); a link opens
            // straight in the browser (WidgetTapActivity).
            views.setPendingIntentTemplate(
                R.id.widget_list,
                PendingIntent.getActivity(
                    context,
                    100000 + widgetId,
                    Intent(open).setClass(context, WidgetTapActivity::class.java),
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE,
                ),
            )
            look(context, views)
            return views
        }

        private fun look(context: Context, views: RemoteViews) {
            val l = Look.read(context)
            val unit = TypedValue.COMPLEX_UNIT_SP
            views.setInt(R.id.brief_bg, "setColorFilter", l.background)
            views.setInt(R.id.brief_bg, "setImageAlpha", l.opacity * 255 / 100)
            views.setTextViewTextSize(R.id.widget_empty, unit, l.bodySize)
            views.setTextViewTextSize(R.id.brief_title, unit, l.titleSize)
            views.setTextColor(R.id.brief_title, l.title)
            views.setTextColor(R.id.widget_empty, l.body)
            views.setTextColor(R.id.brief_when, l.body)
            views.setTextColor(R.id.brief_footer, l.body)
            views.setViewVisibility(R.id.brief_when, if (l.showTime) View.VISIBLE else View.GONE)
            views.setViewVisibility(R.id.brief_title, if (l.showTitle) View.VISIBLE else View.GONE)
            views.setViewVisibility(R.id.brief_footer, if (l.showFooter) View.VISIBLE else View.GONE)
        }

        fun updateAll(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(ComponentName(context, BriefWidget::class.java))
            for (id in ids) manager.updateAppWidget(id, views(context, id))
            manager.notifyAppWidgetViewDataChanged(ids, R.id.widget_list)
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
                    "instances" -> {
                        val manager = AppWidgetManager.getInstance(app)
                        result.success(manager.getAppWidgetIds(ComponentName(app, BriefWidget::class.java)).toList())
                    }
                    "takeLaunch" -> {
                        result.success(pendingOpen)
                        pendingOpen = null
                    }
                    else -> result.notImplemented()
                }
            }
            channel = ch
        }

        /// The activity was opened from a widget: show the brief, or the
        /// custom widget (and its row's link), now if Flutter is listening,
        /// or when it asks.
        fun handle(intent: Intent?) {
            if (intent == null) return
            val brief = intent.getBooleanExtra(EXTRA_OPEN_BRIEF, false)
            val widget = intent.getStringExtra(EXTRA_WIDGET)
            if (!brief && widget == null) return
            val link = intent.getStringExtra(EXTRA_LINK)
            intent.removeExtra(EXTRA_OPEN_BRIEF)
            intent.removeExtra(EXTRA_WIDGET)
            intent.removeExtra(EXTRA_LINK)
            val open: Map<String, Any?> = if (brief) mapOf("brief" to true) else mapOf("id" to widget, "link" to link)
            pendingOpen = open
            val method = if (brief) "openBrief" else "openWidget"
            channel?.invokeMethod(method, if (brief) null else open, object : MethodChannel.Result {
                override fun success(result: Any?) {
                    pendingOpen = null
                }

                override fun error(code: String, message: String?, details: Any?) {}

                override fun notImplemented() {}
            })
        }
    }
}
