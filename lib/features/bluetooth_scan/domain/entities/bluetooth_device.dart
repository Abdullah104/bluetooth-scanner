class BluetoothDevice {
  BluetoothDevice({
    required this.macAddress,
    required this.name,
    num? firstRssiReading,
  }) : _rssiReadings = firstRssiReading == null ? const [] : [firstRssiReading];

  final String macAddress;
  final String name;
  final List<num> _rssiReadings;

  @override
  operator ==(Object other) =>
      other is BluetoothDevice &&
      other.macAddress == macAddress &&
      other.name == name &&
      other._rssiReadings == _rssiReadings;

  @override
  int get hashCode => Object.hash(macAddress, name, _rssiReadings);

  num get rssiAverage {
    if (_rssiReadings.isEmpty) return 0;

    var rssiSum = _rssiReadings.fold(
      0.0,
      (previousValue, element) => previousValue + element,
    );

    return rssiSum / _rssiReadings.length;
  }

  void addRssiReading(num rssi) => _rssiReadings.add(rssi);
}
