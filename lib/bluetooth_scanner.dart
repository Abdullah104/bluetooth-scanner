library bluetooth_scanner;

import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart' hide BluetoothDevice;

import './bluetooth_device.dart';

class BluetoothScanner {
  final _flutterBluePlus = FlutterBluePlus.instance;

  BluetoothScanner._();

  static final _instance = BluetoothScanner._();

  static BluetoothScanner get instance => _instance;

  Future<bool> get scannerActive async => _flutterBluePlus.isScanning.last;

  Stream<List<BluetoothDevice>> get bluetoothDevicesStream {
    final scannedBluetoothDevices = <BluetoothDevice>[];
    final controller = StreamController<List<BluetoothDevice>>();

    _flutterBluePlus.startScan(allowDuplicates: true);

    _flutterBluePlus.scanResults.listen((scanResults) {
      for (var scanResult in scanResults) {
        final bluetoothDevice =
            BluetoothDevice.fromFlutterBluePlusScanResult(scanResult);

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

  Future<void> startScan() => _flutterBluePlus.startScan();

  Future<void> stopScan() => _flutterBluePlus.stopScan();
}
