import 'dart:async';

import 'package:rxdart/subjects.dart';

class CartBloc {
  final _cart = [];

  Sink<String> get addition => _additionController.sink;

  final _additionController = StreamController<String>();

  Stream<int> get itemCount => _itemCountSubject.stream;

  final _itemCountSubject = BehaviorSubject<int>();

  CartBloc() {
    _additionController.stream.listen(_handle);
  }

  void _handle(String product) {
    _cart.add(product);
    _itemCountSubject.add(_cart.length);
  }
}
