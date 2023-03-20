import '../entities/bluetooth_device.dart';

abstract class BluetoothRepository {
  bool get scannerActive;

  Future<void> startScan();

  Stream<List<BluetoothDevice>> get bluetoothDevicesStream;
}
