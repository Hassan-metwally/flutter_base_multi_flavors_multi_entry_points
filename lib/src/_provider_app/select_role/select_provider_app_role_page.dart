import 'package:flutter/material.dart';

import '../../../core/config/router/app_routes.dart';
import '../../../core/core.dart';
import '../../../material/buttons/app_button.dart';
import '../../../material/media/app_image.dart';
import '../../../material/media/svg_icon.dart';
import '../../../material/toast/app_toast.dart';
import '../../../material/widgets/animated_slide_opacity_widget.dart';
import 'provider_app_role.dart';

class SelectProviderAppRolePage extends StatefulWidget {
  const SelectProviderAppRolePage({super.key});

  @override
  State<SelectProviderAppRolePage> createState() => _SelectProviderAppRolePageState();
}

class _SelectProviderAppRolePageState extends State<SelectProviderAppRolePage> {
  ProviderAppRoleEnum? providerAppRole;

  void _onNextTapped() {
    switch (providerAppRole) {
      case ProviderAppRoleEnum.store:
        CurrentProviderAppRole.setProviderAppRole(providerAppRole!);
        AppRouter.pushNamed(AppRoutes.storeLoginPage);
        break;
      case ProviderAppRoleEnum.representative:
        CurrentProviderAppRole.setProviderAppRole(providerAppRole!);
        AppRouter.pushNamed(AppRoutes.representativeLoginPage);
        break;
      default:
        AppToasts.hint(context, message: appLocalizer.pleaseSelectRoleFirst);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppSvgIcon(path: ""),
                const SizedBox(height: 16),
                Text(
                  appLocalizer.chooseUserType,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold18.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 16),
                Text(
                  appLocalizer.selectRoleDescreption,
                  textAlign: TextAlign.center,
                  style: TextStyles.medium14.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 32),
                AnimatedSlideWithOpacityWidget(
                  slideDirection: AlignmentDirectional.centerStart,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        providerAppRole = ProviderAppRoleEnum.store;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(4).copyWith(top: 43),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [AppColors.boxShadow],
                            color: providerAppRole == ProviderAppRoleEnum.store ? AppColors.primary100 : AppColors.white,
                            border: providerAppRole == ProviderAppRoleEnum.store ? Border.all(color: AppColors.primary, width: 1.5) : null,
                          ),
                          child: Text("", textAlign: TextAlign.end, style: TextStyles.medium18),
                        ),
                        Positioned.directional(
                          start: 16,
                          bottom: 14,
                          textDirection: Directionality.of(context),
                          child: AppImage(path: "", height: 100, width: 100),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSlideWithOpacityWidget(
                  slideDirection: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        providerAppRole = ProviderAppRoleEnum.representative;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(3).copyWith(top: 42),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [AppColors.boxShadow],
                            color: providerAppRole == ProviderAppRoleEnum.representative ? AppColors.primary100 : AppColors.white,
                            border: providerAppRole == ProviderAppRoleEnum.representative
                                ? Border.all(color: AppColors.primary, width: 1.5)
                                : null,
                          ),
                          child: Text("", textAlign: TextAlign.start, style: TextStyles.medium18),
                        ),
                        Positioned.directional(
                          end: 16,
                          bottom: 12,
                          textDirection: Directionality.of(context),
                          child: AppImage(path: "", height: 100, width: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: (providerAppRole != null)
          ? AnimatedSlideWithOpacityWidget(
              slideDirection: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 28),
                  child: AppButton(text: appLocalizer.next, onPressed: _onNextTapped),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
