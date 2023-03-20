import 'package:injectable/injectable.dart';

import '../../domain/entities/bluetooth_device.dart';
import '../../domain/repositories/bluetooth_repository.dart';
import '../data_sources/bluetooth_data_source.dart';

@LazySingleton(as: BluetoothRepository)
class BluetoothRepositoryImplemnetation implements BluetoothRepository {
  const BluetoothRepositoryImplemnetation(this._bluetoothDataSource);

  final BluetoothDataSource _bluetoothDataSource;

  @override
  Future<bool> get scannerActive => _bluetoothDataSource.scannerActive;

  @override
  Stream<List<BluetoothDevice>> get bluetoothDevicesStream =>
      _bluetoothDataSource.bluetoothDevicesStream;

  @override
  Future<void> startScan() => _bluetoothDataSource.startScan();

  @override
  Future<void> stopScan() => _bluetoothDataSource.stopScan();
}
