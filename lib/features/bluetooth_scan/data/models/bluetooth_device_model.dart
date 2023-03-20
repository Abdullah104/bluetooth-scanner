import 'package:flutter_blue_plus/flutter_blue_plus.dart' hide BluetoothDevice;

import '../../domain/entities/bluetooth_device.dart';

class BluetoothDeviceModel extends BluetoothDevice {
  BluetoothDeviceModel({
    required super.macAddress,
    required super.name,
  });

  factory BluetoothDeviceModel.fromFlutterBluePlusScanResult(
    ScanResult scanResult,
  ) {
    final bluetoothDevice = BluetoothDeviceModel(
      macAddress: scanResult.device.id.id,
      name: scanResult.device.name,
    );

    bluetoothDevice.addRssiReading(scanResult.rssi);

    return bluetoothDevice;
  }
}
