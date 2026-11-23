part of 'representative_main_page_observer.dart';

mixin RepresentativeMainPageObserverMixin<T extends StatefulWidget> on State<T> {
  RepresentativeMainPageObserver? mainPageObserver;

  void initObserver<E extends RepresentativeMainPageTabsEnum, K>({void Function(RepresentativeMainPageTabsEnum tab)? onTabChanged}) {
    mainPageObserver = RepresentativeMainPageObserver<RepresentativeMainPageTabsEnum>(onTabChanged: onTabChanged);
  }

  @override
  void dispose() {
    mainPageObserver?.dispose();
    super.dispose();
  }
}
