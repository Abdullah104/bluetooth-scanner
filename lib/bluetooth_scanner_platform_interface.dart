import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bluetooth_scanner_method_channel.dart';

abstract class BluetoothScannerPlatform extends PlatformInterface {
  /// Constructs a BluetoothScannerPlatform.
  BluetoothScannerPlatform() : super(token: _token);

  static final Object _token = Object();

  static BluetoothScannerPlatform _instance = MethodChannelBluetoothScanner();

  /// The default instance of [BluetoothScannerPlatform] to use.
  ///
  /// Defaults to [MethodChannelBluetoothScanner].
  static BluetoothScannerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BluetoothScannerPlatform] when
  /// they register themselves.
  static set instance(BluetoothScannerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
