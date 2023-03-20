import 'package:injectable/injectable.dart';

import '../../../../core/use_case.dart';
import '../entities/bluetooth_device.dart';
import '../repositories/bluetooth_repository.dart';

@lazySingleton
class ScanBluetoothDevices
    implements UseCase<Future<Stream<List<BluetoothDevice>>>, EmptyParameters> {
  const ScanBluetoothDevices(this._bluetoothRepository);

  final BluetoothRepository _bluetoothRepository;

  @override
  Future<Stream<List<BluetoothDevice>>> call(EmptyParameters _) async {
    if (!_bluetoothRepository.scannerActive) {
      await _bluetoothRepository.startScan();
    }

    return _bluetoothRepository.bluetoothDevicesStream;
  }
}
