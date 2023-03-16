import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bluetooth_scanner_platform_interface.dart';

/// An implementation of [BluetoothScannerPlatform] that uses method channels.
class MethodChannelBluetoothScanner extends BluetoothScannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bluetooth_scanner');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
