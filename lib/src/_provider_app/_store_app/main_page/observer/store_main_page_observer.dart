import 'package:flutter/material.dart';

import '../models/store_main_page_tabs_enum.dart';

part "store_main_page_mixin.dart";
part 'store_main_page_updater.dart';

class StoreMainPageObserver<StoreMainPageTabsEnum> {
  final void Function(StoreMainPageTabsEnum tab)? onTabChanged;

  StoreMainPageObserver({this.onTabChanged}) {
    StoreMainPageUpdater.instance.attachObserver(this);
  }

  void dispose() {
    StoreMainPageUpdater.instance.deAttachObserver(this);
  }

  void notifyOnChangedCallbacks(StoreMainPageTabsEnum tab) {
    if (onTabChanged != null) {
      onTabChanged!(tab);
    }
  }
}
