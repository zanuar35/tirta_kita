import 'dart:async';

import 'package:tirta_kita/model/orderModel.dart';

class PaymentBloc {
  String _payment;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  Stream get output => _outputController.stream;

  PaymentBloc() {
    _inputController.stream.listen((event) {
      if (event == 'transfer bank') {
        print('tf bank');
        orderModel[0].payment = 'Transfer Bank';
        _payment = 'Transfer Bank';
      } else if (event == 'dana') {
        _payment = 'Dana';
        orderModel[0].payment = 'Dana';
        print('Dana');
      } else if (event == 'ovo') {
        _payment = 'Ovo';
        orderModel[0].payment = 'Ovo';
        print('ovo');
      } else if (event == 'cod') {
        _payment = 'Cash on Delivery';
        orderModel[0].payment = 'Cash on Delivery';
        print('COD');
      }
      _sinkOut.add(_payment);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
