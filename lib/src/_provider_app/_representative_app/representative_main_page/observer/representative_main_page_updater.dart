part of 'representative_main_page_observer.dart';

class RepresentativeMainPageUpdater {
  RepresentativeMainPageUpdater._();

  static RepresentativeMainPageUpdater? _instance;

  static RepresentativeMainPageUpdater get instance {
    _instance ??= RepresentativeMainPageUpdater._();
    return _instance!;
  }

  final List<RepresentativeMainPageObserver> _observers = [];

  void attachObserver<T>(RepresentativeMainPageObserver observer) {
    _observers.add(observer);
  }

  void deAttachObserver(RepresentativeMainPageObserver observer) {
    _observers.remove(observer);
  }

  static void notifyOnChangedCallbacks(RepresentativeMainPageTabsEnum value) {
    for (var observer in instance._observers) {
      observer.notifyOnChangedCallbacks(value);
    }
  }

  static void dispose() {
    _instance?._observers.clear();
    _instance = null;
  }
}
