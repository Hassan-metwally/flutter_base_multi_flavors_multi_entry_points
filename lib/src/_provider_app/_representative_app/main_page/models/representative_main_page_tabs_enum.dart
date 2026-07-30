import '../../../../../core/core.dart';

enum RepresentativeMainPageTabsEnum {
  home,
  myOrders,
  wallet,
  more;

  String get filledIc {
    switch (this) {
      case RepresentativeMainPageTabsEnum.home:
        return "";
      case RepresentativeMainPageTabsEnum.myOrders:
        return "";
      case RepresentativeMainPageTabsEnum.wallet:
        return "";
      case RepresentativeMainPageTabsEnum.more:
        return "";
    }
  }

  String get outlineIc {
    switch (this) {
      case RepresentativeMainPageTabsEnum.home:
        return "";
      case RepresentativeMainPageTabsEnum.myOrders:
        return "";
      case RepresentativeMainPageTabsEnum.wallet:
        return "";
      case RepresentativeMainPageTabsEnum.more:
        return "";
    }
  }

  String get title {
    switch (this) {
      case RepresentativeMainPageTabsEnum.home:
        return appLocalizer.home;
      case RepresentativeMainPageTabsEnum.myOrders:
        return appLocalizer.myOrders;
      case RepresentativeMainPageTabsEnum.wallet:
        return appLocalizer.wallet;
      case RepresentativeMainPageTabsEnum.more:
        return appLocalizer.more;
    }
  }
}
