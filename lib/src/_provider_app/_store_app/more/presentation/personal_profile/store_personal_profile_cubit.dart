import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../../domain/use_cases/get_store_profile_use_case.dart';
import '../../domain/use_cases/update_store_profile_use_case.dart';

part 'store_personal_profile_state.dart';

@Injectable()
class StorePersonalProfileCubit extends Cubit<StorePersonalProfileState> {
  StorePersonalProfileCubit(this._getUserDataUseCase, this._updateUserDataUseCase) : super(const StorePersonalProfileState.initial());

  final GetStoreProfileUseCase _getUserDataUseCase;
  final UpdateStoreProfileUseCase _updateUserDataUseCase;

  void getData() async {
    emit(state.copyWith(getDataState: const Async.loading()));
    final result = await _getUserDataUseCase(NoParams());
    result.fold(
      (failer) {
        emit(state.copyWith(getDataState: Async.failure(failer)));
      },
      (data) {
        emit(state.copyWith(getDataState: Async.success(data)));
      },
    );
  }

  void updateProfile(UpdateStoreProfileParams params) async {
    emit(state.copyWith(updateDataState: const Async.loading()));
    final result = await _updateUserDataUseCase(params);
    result.fold(
      (failer) {
        emit(state.copyWith(updateDataState: Async.failure(failer)));
      },
      (data) {
        emit(state.copyWith(getDataState: Async.success(data), updateDataState: const Async.successWithoutData()));
      },
    );
    emit(state.copyWith(updateDataState: const Async.initial()));
  }
}
