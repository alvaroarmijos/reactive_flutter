import 'package:reactive_flutter/observer/observable/observer.dart';

abstract class Observable<T> {
  void addObserver(Observer<T> observer) {}
  void removeObserver(Observer<T> observer) {}
  void notifyObservers(T newValue) {}
}
