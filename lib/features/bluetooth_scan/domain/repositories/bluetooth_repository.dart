import '../entities/bluetooth_device.dart';

abstract class BluetoothRepository {
  Future<bool> get scannerActive;

  Stream<List<BluetoothDevice>> get bluetoothDevicesStream;

  Future<void> startScan();

  Future<void> stopScan();
}
