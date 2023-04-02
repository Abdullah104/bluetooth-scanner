import '../models/bluetooth_device_model.dart';

abstract class BluetoothDataSource {
  Future<bool> get scannerActive;

  Stream<List<BluetoothDeviceModel>> get bluetoothDevicesStream;

  Future<void> startScan();

  Future<void> stopScan();
}
