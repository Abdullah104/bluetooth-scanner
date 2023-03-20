import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/use_case.dart';
import '../../domain/entities/bluetooth_device.dart';
import '../../domain/repositories/bluetooth_repository.dart';
import '../../domain/use_cases/scan_bluetooth_devices.dart';

part 'bluetooth_provider.freezed.dart';
part 'bluetooth_provider.g.dart';

@freezed
class BluetoothState with _$BluetoothState {
  factory BluetoothState({
    required Option<Stream<List<BluetoothDevice>>> stream,
    required bool isStartingScan,
  }) = _BluetoothState;
}

@riverpod
class Bluetooth extends _$Bluetooth {
  late final ScanBluetoothDevices _scanBluetoothDevices;
  late final BluetoothRepository _bluetoothRepository;

  Bluetooth()
      : _scanBluetoothDevices = getIt(),
        _bluetoothRepository = getIt();

  @override
  BluetoothState build() =>
      BluetoothState(stream: none(), isStartingScan: false);

  Future<void> scanForDevices() async {
    state = state.copyWith(isStartingScan: true);

    final stream = await _scanBluetoothDevices(EmptyParameters());

    state = state.copyWith(isStartingScan: false, stream: some(stream));
  }

  Future<void> stopScan() => _bluetoothRepository.stopScan();
}
