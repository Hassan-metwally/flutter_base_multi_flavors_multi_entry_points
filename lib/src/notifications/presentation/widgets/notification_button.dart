import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/router/app_routes.dart';
import '../../../../core/di/di.dart';
import '../../../_provider_app/_representative_app/home/presentation/widgets/representative_home_app_bar_icon_button.dart';
import '../../../_provider_app/_store_app/home/presentation/widgets/store_home_app_bar_icon_button.dart';
import '../../../_provider_app/select_role/provider_app_role.dart';
import '../notifications_cubit.dart';
import '../notifications_page.dart';

class NotificationButton extends StatelessWidget {
  final Color? iconColor;
  final ProviderAppRoleEnum appRoleType;
  NotificationButton({
    super.key,
    this.iconColor, // Default icon color
    ProviderAppRoleEnum? userType,
  }) : appRoleType = userType ?? CurrentProviderAppRole.getAppRoleType();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<NotificationsCubit>()..getUnreadedNotificationsCount(),
      child: BlocSelector<NotificationsCubit, NotificationsState, int>(
        selector: (notificationsCount) {
          return notificationsCount.notificationsCountState.data ?? 0;
        },
        builder: (context, notificationsCount) {
          return appRoleType == ProviderAppRoleEnum.representative
              ? RepresentativeHomeAppBarIconButton(
                  iconColor: iconColor,
                  icon: "",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.notificationsPage,
                      arguments: NotificationsPage(
                        onNotificationRead: () {
                          context.read<NotificationsCubit>().getUnreadedNotificationsCount();
                        },
                      ),
                    );
                  },
                  iconBadgeCount: notificationsCount,
                )
              : StoreHomeAppBarIconButton(
                  iconColor: iconColor,
                  icon: "",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.notificationsPage,
                      arguments: NotificationsPage(
                        onNotificationRead: () {
                          context.read<NotificationsCubit>().getUnreadedNotificationsCount();
                        },
                      ),
                    );
                  },
                  iconBadgeCount: notificationsCount,
                );
        },
      ),
    );
  }
}
