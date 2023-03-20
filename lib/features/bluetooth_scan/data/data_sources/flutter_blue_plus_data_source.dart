import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';

import '../models/bluetooth_device_model.dart';
import 'bluetooth_data_source.dart';

@LazySingleton(as: BluetoothDataSource)
class FlutterBluePlusDataSource implements BluetoothDataSource {
  const FlutterBluePlusDataSource(this._flutterBluePlus);

  final FlutterBluePlus _flutterBluePlus;

  @override
  Future<bool> get scannerActive => _flutterBluePlus.isScanning.last;

  @override
  Future<void> startScan() => _flutterBluePlus.startScan();

  @override
  Stream<List<BluetoothDeviceModel>> get bluetoothDevicesStream {
    final scannedBluetoothDevices = <BluetoothDeviceModel>[];
    final controller = StreamController<List<BluetoothDeviceModel>>();

    _flutterBluePlus.startScan();

    _flutterBluePlus.scanResults.listen((scanResults) {
      for (var scanResult in scanResults) {
        final bluetoothDevice =
            BluetoothDeviceModel.fromFlutterBluePlusScanResult(scanResult);

        bool exists = false;

        for (var device in scannedBluetoothDevices) {
          if (device.macAddress == bluetoothDevice.macAddress) {
            device.addRssiReading(scanResult.rssi);

            exists = true;

            break;
          }
        }

        if (!exists) scannedBluetoothDevices.add(bluetoothDevice);
      }

      controller.add(scannedBluetoothDevices);
    });

    return controller.stream;
  }

  @override
  Future<void> stopScan() => _flutterBluePlus.stopScan();
}
