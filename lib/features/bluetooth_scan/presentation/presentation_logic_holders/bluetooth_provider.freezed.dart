// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothState {
  Option<Stream<List<BluetoothDevice>>> get stream =>
      throw _privateConstructorUsedError;
  bool get isStartingScan => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothStateCopyWith<BluetoothState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothStateCopyWith<$Res> {
  factory $BluetoothStateCopyWith(
          BluetoothState value, $Res Function(BluetoothState) then) =
      _$BluetoothStateCopyWithImpl<$Res, BluetoothState>;
  @useResult
  $Res call(
      {Option<Stream<List<BluetoothDevice>>> stream, bool isStartingScan});
}

/// @nodoc
class _$BluetoothStateCopyWithImpl<$Res, $Val extends BluetoothState>
    implements $BluetoothStateCopyWith<$Res> {
  _$BluetoothStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = null,
    Object? isStartingScan = null,
  }) {
    return _then(_value.copyWith(
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Option<Stream<List<BluetoothDevice>>>,
      isStartingScan: null == isStartingScan
          ? _value.isStartingScan
          : isStartingScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothStateCopyWith<$Res>
    implements $BluetoothStateCopyWith<$Res> {
  factory _$$_BluetoothStateCopyWith(
          _$_BluetoothState value, $Res Function(_$_BluetoothState) then) =
      __$$_BluetoothStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Stream<List<BluetoothDevice>>> stream, bool isStartingScan});
}

/// @nodoc
class __$$_BluetoothStateCopyWithImpl<$Res>
    extends _$BluetoothStateCopyWithImpl<$Res, _$_BluetoothState>
    implements _$$_BluetoothStateCopyWith<$Res> {
  __$$_BluetoothStateCopyWithImpl(
      _$_BluetoothState _value, $Res Function(_$_BluetoothState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = null,
    Object? isStartingScan = null,
  }) {
    return _then(_$_BluetoothState(
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Option<Stream<List<BluetoothDevice>>>,
      isStartingScan: null == isStartingScan
          ? _value.isStartingScan
          : isStartingScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BluetoothState implements _BluetoothState {
  _$_BluetoothState({required this.stream, required this.isStartingScan});

  @override
  final Option<Stream<List<BluetoothDevice>>> stream;
  @override
  final bool isStartingScan;

  @override
  String toString() {
    return 'BluetoothState(stream: $stream, isStartingScan: $isStartingScan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothState &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.isStartingScan, isStartingScan) ||
                other.isStartingScan == isStartingScan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stream, isStartingScan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothStateCopyWith<_$_BluetoothState> get copyWith =>
      __$$_BluetoothStateCopyWithImpl<_$_BluetoothState>(this, _$identity);
}

abstract class _BluetoothState implements BluetoothState {
  factory _BluetoothState(
      {required final Option<Stream<List<BluetoothDevice>>> stream,
      required final bool isStartingScan}) = _$_BluetoothState;

  @override
  Option<Stream<List<BluetoothDevice>>> get stream;
  @override
  bool get isStartingScan;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothStateCopyWith<_$_BluetoothState> get copyWith =>
      throw _privateConstructorUsedError;
}
