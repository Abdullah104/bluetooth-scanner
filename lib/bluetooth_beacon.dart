import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothBeacon {
  BluetoothBeacon({
    required this.macAddress,
    required this.name,
    num? firstRssiReading,
  }) : _rssiReadings = firstRssiReading == null ? [] : [firstRssiReading];

  factory BluetoothBeacon.fromFlutterBluePlusScanResult(
    ScanResult scanResult,
  ) {
    final bluetoothDevice = BluetoothBeacon(
      macAddress: scanResult.device.id.id,
      name: scanResult.device.name,
    );

    bluetoothDevice.addRssiReading(scanResult.rssi);

    return bluetoothDevice;
  }

  final String macAddress;
  final String name;
  final List<num> _rssiReadings;

  @override
  operator ==(Object other) =>
      other is BluetoothBeacon &&
      other.macAddress == macAddress &&
      other.name == name;

  @override
  int get hashCode => Object.hash(macAddress, name);

  num get rssiAverage {
    if (_rssiReadings.isEmpty) return 0;

    var rssiSum = _rssiReadings.fold(
      0.0,
      (previousValue, element) => previousValue + element,
    );

    return rssiSum / _rssiReadings.length;
  }

  void addRssiReading(num rssi) {
    if (_rssiReadings.length == 100) _rssiReadings.removeAt(0);

    _rssiReadings.add(rssi);
  }
}
