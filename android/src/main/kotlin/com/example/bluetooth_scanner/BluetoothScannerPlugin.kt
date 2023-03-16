package com.example.bluetooth_scanner

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** BluetoothScannerPlugin */
class BluetoothScannerPlugin : FlutterPlugin, ActivityAware, MethodCallHandler,
    ActivityResultListener, RequestPermissionsResultListener {
    companion object {
        private val TAG = BluetoothScannerPlugin::class.java.name
        private const val REQUEST_BLUETOOTH = 7338
        private const val REQUEST_PERMISSION = 242346
        private const val ACTION_NEW_DEVICE = "action_new_device"
        private const val ACTION_START_SCAN = "action_start_scan"
        private const val ACTION_STOP_SCAN = "action_stop_scan"
        private const val ACTION_SCAN_STOPPED = "action_scan_stopped"
        private const val ACTION_REQUEST_PERMISSIONS = "action_request_permissions"
    }

    private lateinit var activityBinding: ActivityPluginBinding
    private lateinit var channel: MethodChannel

    private var adapter: BluetoothAdapter? = null

    private var onPermissionGranted: (() -> Unit)? = null
    private var onPermissionRefused: ((code: String, message: String) -> Unit)? = null

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent?) {
            if (BluetoothDevice.ACTION_FOUND == intent?.action) {
                val device: BluetoothDevice? =
                    intent?.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE)

                if (device != null) channel.invokeMethod(ACTION_NEW_DEVICE, toMap(device))
            }
        }
    }

    private fun toMap(device: BluetoothDevice): Map<String, String> {
        val map = HashMap<String, String>()
    }

//    private val streamChannelName = "com.scfs.bluetooth_scanner/scan"
//    private val channelName = "$streamChannelName/scan"
//    lateinit var eventChannel: EventChannel
//
//    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPluginBinding) {
//        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
//        channel.setMethodCallHandler(this)
//
//        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, streamChannelName)
//        eventChannel.setStreamHandler(BluetoothScanStreamHandler())
//    }
//
//    override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {
//        eventChannel.setStreamHandler(null)
//    }
//
//    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//        if (call.method == "getPlatformVersion") {
//            result.success("Android ${android.os.Build.VERSION.RELEASE}")
//        } else {
//            result.notImplemented()
//        }
//    }
}
