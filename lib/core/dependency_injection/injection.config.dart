// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bluetooth_scanner/core/dependency_injection/injectable_modules/flutter_blue_plus_module.dart'
    as _i6;
import 'package:bluetooth_scanner/features/bluetooth_scan/domain/repositories/bluetooth_repository.dart'
    as _i5;
import 'package:bluetooth_scanner/features/bluetooth_scan/domain/use_cases/scan_bluetooth_devices.dart'
    as _i4;
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final flutterBluePlusModule = _$FlutterBluePlusModule();
    gh.lazySingleton<_i3.FlutterBluePlus>(
        () => flutterBluePlusModule.flutterBluePlus);
    gh.lazySingleton<_i4.ScanBluetoothDevices>(
        () => _i4.ScanBluetoothDevices(gh<_i5.BluetoothRepository>()));
    return this;
  }
}

class _$FlutterBluePlusModule extends _i6.FlutterBluePlusModule {}
