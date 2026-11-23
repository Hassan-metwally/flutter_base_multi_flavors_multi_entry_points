part of 'store_main_page_observer.dart';

class StoreMainPageUpdater {
  StoreMainPageUpdater._();

  static StoreMainPageUpdater? _instance;

  static StoreMainPageUpdater get instance {
    _instance ??= StoreMainPageUpdater._();
    return _instance!;
  }

  final List<StoreMainPageObserver> _observers = [];

  void attachObserver<T>(StoreMainPageObserver observer) {
    _observers.add(observer);
  }

  void deAttachObserver(StoreMainPageObserver observer) {
    _observers.remove(observer);
  }

  static void notifyOnChangedCallbacks(StoreMainPageTabsEnum value) {
    for (var observer in instance._observers) {
      observer.notifyOnChangedCallbacks(value);
    }
  }

  static void dispose() {
    _instance?._observers.clear();
    _instance = null;
  }
}
