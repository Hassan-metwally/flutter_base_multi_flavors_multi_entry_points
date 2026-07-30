part of 'store_main_page_observer.dart';

mixin StoreMainPageObserverMixin<T extends StatefulWidget> on State<T> {
  StoreMainPageObserver? mainPageObserver;

  void initObserver<E extends StoreMainPageTabsEnum, K>({void Function(StoreMainPageTabsEnum tab)? onTabChanged}) {
    mainPageObserver = StoreMainPageObserver<StoreMainPageTabsEnum>(onTabChanged: onTabChanged);
  }

  @override
  void dispose() {
    mainPageObserver?.dispose();
    super.dispose();
  }
}
