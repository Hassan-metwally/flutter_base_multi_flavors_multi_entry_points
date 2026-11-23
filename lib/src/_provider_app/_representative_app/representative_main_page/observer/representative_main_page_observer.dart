import 'package:flutter/material.dart';

import '../models/representative_main_page_tabs_enum.dart';

part "representative_main_page_mixin.dart";
part 'representative_main_page_updater.dart';

class RepresentativeMainPageObserver<RepresentativeMainPageTabsEnum> {
  final void Function(RepresentativeMainPageTabsEnum tab)? onTabChanged;

  RepresentativeMainPageObserver({this.onTabChanged}) {
    RepresentativeMainPageUpdater.instance.attachObserver(this);
  }

  void dispose() {
    RepresentativeMainPageUpdater.instance.deAttachObserver(this);
  }

  void notifyOnChangedCallbacks(RepresentativeMainPageTabsEnum tab) {
    if (onTabChanged != null) {
      onTabChanged!(tab);
    }
  }
}
