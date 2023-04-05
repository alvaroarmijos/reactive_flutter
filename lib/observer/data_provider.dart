import 'observable/observable.dart';
import 'observable/observer.dart';

class DataProvider implements Observable<int> {
  static final DataProvider _instance = DataProvider._internal();

  factory DataProvider() {
    return _instance;
  }

  DataProvider._internal();

  final List<Observer> _observerList = [];
  int _count = 0;

  void changeCount() {
    _count++;
    notifyObservers(_count);
  }

  @override
  void addObserver(Observer<int> observer) {
    _observerList.add(observer);
  }

  @override
  void removeObserver(Observer<int> observer) {
    _observerList.remove(observer);
  }

  @override
  void notifyObservers(int newValue) {
    for (var observer in _observerList) {
      observer.notifyChange(newValue);
    }
  }
}
