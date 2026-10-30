package com.example.teleai

import android.media.audiofx.Visualizer
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/// How loud the phone's own audio output is, for voice mode's orb. It works
/// for every voice engine (the device voice and cloud audio) because it reads
/// the output mix. Some phones refuse this; Flutter then animates the orb
/// from "is speaking" alone.
object VoiceLevelChannel {
    private const val CHANNEL = "teleai/voice_level"
    private var visualizer: Visualizer? = null

    fun attach(engine: FlutterEngine) {
        MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "start" -> result.success(start())
                "level" -> result.success(level())
                "stop" -> {
                    stop()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun start(): Boolean {
        if (visualizer != null) return true
        return try {
            visualizer = Visualizer(0).apply {
                captureSize = Visualizer.getCaptureSizeRange()[0]
                measurementMode = Visualizer.MEASUREMENT_MODE_PEAK_RMS
                enabled = true
            }
            true
        } catch (_: Exception) {
            stop()
            false
        }
    }

    /// 0 (silent) to 1 (loud).
    private fun level(): Double {
        val v = visualizer ?: return 0.0
        return try {
            val m = Visualizer.MeasurementPeakRms()
            v.getMeasurementPeakRms(m)
            // Millibels: about -6000 is barely audible and 0 is the loudest.
            ((m.mRms + 5000) / 4000.0).coerceIn(0.0, 1.0)
        } catch (_: Exception) {
            0.0
        }
    }

    private fun stop() {
        try {
            visualizer?.enabled = false
            visualizer?.release()
        } catch (_: Exception) {
        }
        visualizer = null
    }
}
