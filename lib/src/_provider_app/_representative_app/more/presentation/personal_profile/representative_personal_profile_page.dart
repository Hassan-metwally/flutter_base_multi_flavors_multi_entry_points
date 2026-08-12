import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../material/app_fail_widget.dart';
import '../../../../../../material/app_loading_widget.dart';
import '../../../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../../../material/inputs/name_field.dart';
import '../../../../../../material/media/app_image.dart';
import '../../../../../../material/spin_kit_loading_widget.dart';
import '../../../../../../material/toast/app_toast.dart';
import '../../../../../common/domain/entity/users/representative_entity.dart';
import '../../../main_page/models/representative_main_page_tabs_enum.dart';
import '../../../main_page/observer/representative_main_page_observer.dart';
import 'representative_personal_profile_cubit.dart';

class RepresentativePersonalProfilePage extends StatelessWidget {
  const RepresentativePersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appLocalizer.personalProfile),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.appbarBorderColor, // border color
            height: 1.0,
          ),
        ),
      ),
      body: BlocSelector<RepresentativePersonalProfileCubit, RepresentativePersonalProfileState, Async<RepresentativeEntity>>(
        selector: (state) {
          return state.getDataState;
        },
        builder: (context, state) {
          final userData = state.data;
          if (state.isSuccess && userData != null) {
            return _PageBody(user: userData);
          } else if (state.isLoading) {
            return const SpinKitLoadingWidget();
          } else if (state.isFailure) {
            return AppFailWidget(onRetry: context.read<RepresentativePersonalProfileCubit>().getData);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _PageBody extends StatefulWidget {
  const _PageBody({required this.user});

  final RepresentativeEntity user;

  @override
  State<_PageBody> createState() => __PageBodyState();
}

class __PageBodyState extends State<_PageBody> {
  final formKey = GlobalKey<FormState>();

  void _onUpdateProfileSuccess() async {
    AppToasts.success(context, message: appLocalizer.personalProfileUpdateSuccessMessage);
    AppAuthenticationBloc.of(context).add(const AuthenticatedEvent());
    await Future.delayed(const Duration(milliseconds: 1500), () {
      RepresentativeMainPageUpdater.notifyOnChangedCallbacks(RepresentativeMainPageTabsEnum.more);
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RepresentativePersonalProfileCubit, RepresentativePersonalProfileState>(
      listener: (context, state) {
        if (state.updateDataState.isSuccess) {
          AppLoadingWidget.removeOverlay();
          _onUpdateProfileSuccess();
        } else if (state.updateDataState.isFailure) {
          AppLoadingWidget.removeOverlay();
          AppToasts.error(context, message: state.updateDataState.errorMessage ?? '');
        } else if (state.updateDataState.isLoading) {
          AppLoadingWidget.overlay();
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppImage.circle(path: widget.user.avatar.path, fit: BoxFit.cover, dimension: 100),
              const SizedBox(height: 20),
              NameField(
                controller: TextEditingController(text: widget.user.name),
                lable: appLocalizer.name,
                readOnly: true,
              ),
              PhoneField(controller: TextEditingController(text: widget.user.mobile), readOnly: true),
            ],
          ),
        ),
      ),
    );
  }
}
