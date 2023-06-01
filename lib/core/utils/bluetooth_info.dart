import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class BluetoothInfo {
  void initializeBluetoothStream();
  StreamSubscription<bool> get listenToBluetoothStream;

  Future<void> dispose();
}

class BluetoothInfoImp implements BluetoothInfo {
  final FlutterBluePlus blueConnectionChecker;

  BluetoothInfoImp({required this.blueConnectionChecker});

  final StreamController<bool> _streamController = StreamController<bool>();
  late final StreamSubscription<bool> _streamSubscription =
      _streamController.stream.asBroadcastStream().listen((event) => event);
  late StreamSubscription<BluetoothState> _bluetoothConnectionStream;
  @override
  void initializeBluetoothStream() {
    _bluetoothConnectionStream =
        blueConnectionChecker.state.listen((BluetoothState status) {
      switch (status) {
        case BluetoothState.on:
          _streamController.sink.add(true);
          break;
        case BluetoothState.off:
          _streamController.sink.add(false);
          break;
        default:
      }
    });
  }

  @override
  StreamSubscription<bool> get listenToBluetoothStream {
    if (_streamSubscription.isPaused) {
      _streamSubscription.resume();
    }

    return _streamSubscription;
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
    await _bluetoothConnectionStream.cancel();
  }
}
