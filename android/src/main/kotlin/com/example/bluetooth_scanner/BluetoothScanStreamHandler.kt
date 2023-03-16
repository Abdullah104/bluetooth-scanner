package com.example.bluetooth_scanner

import android.bluetooth.BluetoothManager
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.EventChannel.EventSink
import java.util.Random
import java.util.logging.StreamHandler

class BluetoothScanStreamHandler : StreamHandler {
    private var eventSink: EventSink? = null
    var handler: Handler? = null
    private val bluetoothAdapter: BluetoothManager = BluetoothManager.getAdapter()
    private val tag = "BLUETOOTH_SCANNER"

    private val runnable = Runnable {
        sendNewRandomNumber()
    }

    override fun onListen(arguments: Any?, events: EventSink?) {
        eventSink = events
        handler = Handler(Looper.getMainLooper())

        handler!!.postDelayed(runnable, 1000)
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
        handler?.removeCallbacks(runnable)
    }

    private fun sendNewRandomNumber() {
        val randomNumber = Random().nextInt(9)


        eventSink?.success(randomNumber)
        handler?.postDelayed(runnable, 1000)
    }
}