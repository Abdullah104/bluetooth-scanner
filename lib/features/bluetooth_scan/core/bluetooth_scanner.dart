import '../data/data_sources/flutter_blue_plus_data_source.dart';
import '../data/repositories/bluetooth_repository_implementation.dart';
import '../domain/entities/bluetooth_device.dart';
import '../domain/repositories/bluetooth_repository.dart';

class BluetoothScanner {
  BluetoothScanner._();

  static final _bluetoothScanner = BluetoothScanner._();

  final BluetoothRepository _bluetoothRepository =
      BluetoothRepositoryImplemnetation(
    FlutterBluePlusDataSource(),
  );

  static BluetoothScanner get instance => _bluetoothScanner;

  Stream<List<BluetoothDevice>> startBluetoothScan() =>
      _bluetoothRepository.bluetoothDevicesStream;

  Future<void> stopBluetoothScan() => _bluetoothRepository.stopScan();
}
