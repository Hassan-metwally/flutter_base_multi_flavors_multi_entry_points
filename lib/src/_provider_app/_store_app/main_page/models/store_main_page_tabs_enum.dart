import '../../../../../core/core.dart';

enum StoreMainPageTabsEnum {
  home,
  storeManagement,
  myOrders,
  more;

  String get filledIc {
    switch (this) {
      case StoreMainPageTabsEnum.home:
        return "";
      case StoreMainPageTabsEnum.storeManagement:
        return "";
      case StoreMainPageTabsEnum.myOrders:
        return "";
      case StoreMainPageTabsEnum.more:
        return "";
    }
  }

  String get outlineIc {
    switch (this) {
      case StoreMainPageTabsEnum.home:
        return "";
      case StoreMainPageTabsEnum.storeManagement:
        return "";
      case StoreMainPageTabsEnum.myOrders:
        return "";
      case StoreMainPageTabsEnum.more:
        return "";
    }
  }

  String get title {
    switch (this) {
      case StoreMainPageTabsEnum.home:
        return appLocalizer.home;
      case StoreMainPageTabsEnum.storeManagement:
        return "";
      case StoreMainPageTabsEnum.myOrders:
        return "";
      case StoreMainPageTabsEnum.more:
        return appLocalizer.more;
    }
  }
}
