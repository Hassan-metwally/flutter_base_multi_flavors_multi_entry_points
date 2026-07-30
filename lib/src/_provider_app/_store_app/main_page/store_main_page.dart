import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/core.dart';
import '../../../../material/auth_states/guest_checker_widget.dart';
import '../../../../material/auth_states/unauthenticated_bottom_sheet.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../../material/offstage.dart';
import '../../../notifications/helpers/firebase/firebase_helper.dart';
import '../home/presentation/store_home_page.dart';
import '../more/presentation/more_page/store_more_page.dart';
import 'models/store_main_page_tabs_enum.dart';
import 'observer/store_main_page_observer.dart';

part 'widgets/store_bottom_navigation_bar.dart';

class StoreMainPage extends StatefulWidget {
  const StoreMainPage({super.key});

  @override
  State<StoreMainPage> createState() => _StoreMainPageState();
}

class _StoreMainPageState extends State<StoreMainPage> with StoreMainPageObserverMixin {
  StoreMainPageTabsEnum _currentTabEnum = StoreMainPageTabsEnum.home;
  final List<StoreMainPageTabsEnum> _loadedPages = [StoreMainPageTabsEnum.home];

  void _addUnAuthenticatedListener() {
    UnAuthenticatedInterceptor.instance.addListener(() {
      UnAuthenticatedBottomSheet.show();
    });
  }

  void _onCurrentTapChanged(StoreMainPageTabsEnum currentTap) {
    if (!_loadedPages.contains(currentTap)) {
      _loadedPages.add(currentTap);
    }
    _currentTabEnum = currentTap;

    setState(() {});
  }

  void _onPop() {
    if (_currentTabEnum != StoreMainPageTabsEnum.home) {
      _onCurrentTapChanged(StoreMainPageTabsEnum.home);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
    FirebaseHelper.setUpNotificationListener();
    initObserver(onTabChanged: _onCurrentTapChanged);
    _addUnAuthenticatedListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, _) {
          _onPop();
        },
        child: IndexedStack(
          index: _currentTabEnum.index,
          children: [
            OffStage(isActive: _currentTabEnum == StoreMainPageTabsEnum.home, child: const StoreHomePage()),
            OffStage(
              isActive: _currentTabEnum == StoreMainPageTabsEnum.storeManagement,
              child: const GuestCheckerWidget(replaceWithDefaultGuestWidget: true, child: SizedBox()),
            ),

            OffStage(
              isActive: _currentTabEnum == StoreMainPageTabsEnum.myOrders,
              child: const GuestCheckerWidget(replaceWithDefaultGuestWidget: true, child: SizedBox.shrink()),
            ),
            OffStage(isActive: _currentTabEnum == StoreMainPageTabsEnum.more, child: const StoreMorePage()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _StoreBottomNavigationBar(selctedTab: _currentTabEnum, onTabChanged: _onCurrentTapChanged),
    );
  }

  @override
  void dispose() {
    super.dispose();
    UnAuthenticatedInterceptor.instance.dispose();
  }
}
