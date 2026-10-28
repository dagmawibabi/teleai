package com.example.teleai

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.OpenableColumns
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

/// What other apps hand to Triangle: text or files shared to it (Share →
/// Triangle), and text selected anywhere ("Ask Triangle" in the selection
/// menu). Files are copied into the app's cache, since Dart can't read
/// content:// links, and the lot goes to Dart as one map.
object ShareChannel {
    private const val CHANNEL = "teleai/share"
    private var channel: MethodChannel? = null
    private var appContext: Context? = null

    /// Arrived before Dart listened (it launched the app); taken once.
    private var pending: Map<String, Any?>? = null

    fun attach(context: Context, engine: FlutterEngine) {
        appContext = context.applicationContext
        val ch = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
        ch.setMethodCallHandler { call, result ->
            when (call.method) {
                "takeLaunch" -> {
                    result.success(pending)
                    pending = null
                }
                else -> result.notImplemented()
            }
        }
        channel = ch
    }

    fun handle(context: Context, intent: Intent?) {
        val payload = read(context, intent ?: return) ?: return
        // Handled: a later configuration change mustn't share it again.
        intent.action = Intent.ACTION_MAIN
        val ch = channel
        if (ch == null) {
            pending = payload
            return
        }
        ch.invokeMethod("shared", payload, object : MethodChannel.Result {
            override fun success(result: Any?) {}
            override fun error(code: String, message: String?, details: Any?) {
                pending = payload
            }
            override fun notImplemented() {
                pending = payload
            }
        })
    }

    private fun read(context: Context, intent: Intent): Map<String, Any?>? = when (intent.action) {
        Intent.ACTION_PROCESS_TEXT -> {
            val text = intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT)?.toString()
            if (text.isNullOrBlank()) null else mapOf("kind" to "selection", "text" to text)
        }
        Intent.ACTION_SEND -> {
            val uri = stream(intent)
            val text = listOfNotNull(
                intent.getStringExtra(Intent.EXTRA_SUBJECT),
                intent.getCharSequenceExtra(Intent.EXTRA_TEXT)?.toString(),
            ).filter { it.isNotBlank() }.distinct().joinToString("\n\n")
            val files = listOfNotNull(uri?.let { copy(context, it) })
            if (text.isBlank() && files.isEmpty()) null else mapOf("kind" to "share", "text" to text, "files" to files)
        }
        Intent.ACTION_SEND_MULTIPLE -> {
            val files = streams(intent).mapNotNull { copy(context, it) }
            val text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT)?.toString() ?: ""
            if (files.isEmpty() && text.isBlank()) null else mapOf("kind" to "share", "text" to text, "files" to files)
        }
        else -> null
    }

    @Suppress("DEPRECATION")
    private fun stream(intent: Intent): Uri? =
        if (Build.VERSION.SDK_INT >= 33) intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri::class.java)
        else intent.getParcelableExtra(Intent.EXTRA_STREAM)

    @Suppress("DEPRECATION")
    private fun streams(intent: Intent): List<Uri> =
        (if (Build.VERSION.SDK_INT >= 33) intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM, Uri::class.java)
        else intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM)) ?: emptyList()

    /// [uri] copied into the cache under its own name.
    private fun copy(context: Context, uri: Uri): Map<String, Any?>? = try {
        val resolver = context.contentResolver
        var name = "shared"
        resolver.query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)?.use { c ->
            if (c.moveToFirst()) name = c.getString(0) ?: name
        }
        val dir = File(context.cacheDir, "shared/${System.currentTimeMillis()}").apply { mkdirs() }
        val file = File(dir, name.replace(Regex("[\\\\/]"), "_"))
        resolver.openInputStream(uri)?.use { input -> file.outputStream().use { input.copyTo(it) } }
        mapOf("path" to file.absolutePath, "name" to name, "mime" to resolver.getType(uri))
    } catch (e: Exception) {
        null
    }
}
