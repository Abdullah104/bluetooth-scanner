
import 'bluetooth_scanner_platform_interface.dart';

class BluetoothScanner {
  Future<String?> getPlatformVersion() {
    return BluetoothScannerPlatform.instance.getPlatformVersion();
  }
}
