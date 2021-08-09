import 'dart:async';

import 'package:tirta_kita/model/orderModel.dart';

class CounterBloc {
  int _counter = 1;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == 'add') {
        _counter++;
        orderModel[0].jumlah++;
      } else if (event == 'minus') {
        _counter--;
        orderModel[0].jumlah--;
        if (_counter < 1 && orderModel[0].jumlah == 1) {
          _counter = 1;
          orderModel[0].jumlah = 1;
        }
      }
      _sinkOut.add(orderModel[0].jumlah);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
