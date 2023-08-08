library bluetooth_scanner;

import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart' hide BluetoothDevice;

import 'bluetooth_beacon.dart';

class BluetoothScanner {
  BluetoothScanner._();

  static final _instance = BluetoothScanner._();

  static BluetoothScanner get instance => _instance;

  Future<bool> get scannerActive async => FlutterBluePlus.isScanning.last;

  Stream<List<BluetoothBeacon>> get bluetoothBeaconsStream {
    final scannedBluetoothBeacons = <BluetoothBeacon>[];
    final controller = StreamController<List<BluetoothBeacon>>();

    FlutterBluePlus.startScan(allowDuplicates: true);

    FlutterBluePlus.scanResults.listen((scanResults) {
      for (var scanResult in scanResults) {
        final bluetoothDevice =
            BluetoothBeacon.fromFlutterBluePlusScanResult(scanResult);

        bool exists = false;

        for (var beacon in scannedBluetoothBeacons) {
          if (beacon.macAddress == bluetoothDevice.macAddress) {
            beacon.addRssiReading(scanResult.rssi);

            exists = true;

            break;
          }
        }

        if (!exists) scannedBluetoothBeacons.add(bluetoothDevice);
      }

      controller.add(scannedBluetoothBeacons);
    });

    return controller.stream;
  }

  Future<void> startScan() => FlutterBluePlus.startScan();

  Future<void> stopScan() => FlutterBluePlus.stopScan();
}
