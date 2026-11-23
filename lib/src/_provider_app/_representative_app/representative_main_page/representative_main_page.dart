import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/core.dart';
import '../../../../material/auth_states/logged_user_checker_widget.dart';
import '../../../../material/auth_states/unauthenticated_bottom_sheet.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../../material/offstage.dart';
import '../../../notifications/helpers/firebase/firebase_helper.dart';
import '../../../wallet/presentation/_representative_wallet/representative_wallet_page.dart';
import '../representative_home/presentation/representative_home_page.dart';
import '../representative_more/presentation/representative_more_page/representative_more_page.dart';
import 'models/representative_main_page_tabs_enum.dart';
import 'observer/representative_main_page_observer.dart';

part 'widgets/representative_bottom_navigation_bar.dart';

class RepresentativeMainPage extends StatefulWidget {
  const RepresentativeMainPage({super.key});

  @override
  State<RepresentativeMainPage> createState() => _RepresentativeMainPageState();
}

class _RepresentativeMainPageState extends State<RepresentativeMainPage> with RepresentativeMainPageObserverMixin {
  RepresentativeMainPageTabsEnum _currentTabEnum = RepresentativeMainPageTabsEnum.home;
  final List<RepresentativeMainPageTabsEnum> _loadedPages = [RepresentativeMainPageTabsEnum.home];

  void _addUnAuthenticatedListener() {
    UnAuthenticatedInterceptor.instance.addListener(() {
      UnAuthenticatedBottomSheet.show();
    });
  }

  void _onCurrentTapChanged(RepresentativeMainPageTabsEnum currentTap) {
    if (!_loadedPages.contains(currentTap)) {
      _loadedPages.add(currentTap);
    }
    _currentTabEnum = currentTap;

    setState(() {});
  }

  void _onPop() {
    if (_currentTabEnum != RepresentativeMainPageTabsEnum.home) {
      _onCurrentTapChanged(RepresentativeMainPageTabsEnum.home);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseHelper.setUpNotificationListener();
    initObserver(onTabChanged: _onCurrentTapChanged);
    _addUnAuthenticatedListener();
    // // Pusher Initialize
    // if (!GuestCheckerWidget.isGuest(context)) {
    //   PusherHandler.instance.initialize();
    // }

    // // Deep Links Initialize
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   DeepLinksUtils.intit();
    // });

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
        child: LoggedUserCheckerWidget(
          loggedBuilder: (user) {
            return IndexedStack(
              index: _currentTabEnum.index,
              children: [
                OffStage(isActive: _currentTabEnum == RepresentativeMainPageTabsEnum.home, child: const RepresentativeHomePage()),
                OffStage(
                  isActive: _currentTabEnum == RepresentativeMainPageTabsEnum.myOrders,
                  child: Center(child: Text('Representative My Orders Body')),
                ),
                OffStage(isActive: _currentTabEnum == RepresentativeMainPageTabsEnum.wallet, child: const RepresentativeWalletPage()),
                OffStage(isActive: _currentTabEnum == RepresentativeMainPageTabsEnum.more, child: const RepresentativeMorePage()),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _RepresentativeBottomNavigationBar(selctedTab: _currentTabEnum, onTabChanged: _onCurrentTapChanged),
    );
  }

  @override
  void dispose() {
    super.dispose();
    UnAuthenticatedInterceptor.instance.dispose();
  }
}
