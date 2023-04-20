// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bluetooth_scanner/core/dependency_injection/injectable_modules/flutter_blue_plus_module.dart'
    as _i8;
import 'package:bluetooth_scanner/features/bluetooth_scan/data/data_sources/bluetooth_data_source.dart'
    as _i3;
import 'package:bluetooth_scanner/features/bluetooth_scan/data/data_sources/flutter_blue_plus_data_source.dart'
    as _i4;
import 'package:bluetooth_scanner/features/bluetooth_scan/data/repositories/bluetooth_repository_implementation.dart'
    as _i6;
import 'package:bluetooth_scanner/features/bluetooth_scan/domain/repositories/bluetooth_repository.dart'
    as _i5;
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.lazySingleton<_i3.BluetoothDataSource>(
        () => _i4.FlutterBluePlusDataSource());
    gh.lazySingleton<_i5.BluetoothRepository>(() =>
        _i6.BluetoothRepositoryImplemnetation(gh<_i3.BluetoothDataSource>()));
    gh.lazySingleton<_i7.FlutterBluePlus>(
        () => flutterBluePlusModule.flutterBluePlus);
    return this;
  }
}

class _$FlutterBluePlusModule extends _i8.FlutterBluePlusModule {}
