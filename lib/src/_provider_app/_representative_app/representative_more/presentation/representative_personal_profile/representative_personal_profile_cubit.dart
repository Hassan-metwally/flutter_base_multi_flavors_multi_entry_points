import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/representative_entity.dart';
import '../../domain/use_cases/representative_get_profile_use_case.dart';

part 'representative_personal_profile_state.dart';

@Injectable()
class RepresentativePersonalProfileCubit extends Cubit<RepresentativePersonalProfileState> with SafeEmitMixin {
  RepresentativePersonalProfileCubit(this._getUserDataUseCase) : super(const RepresentativePersonalProfileState.initial());

  final RepresentativeGetProfileUseCase _getUserDataUseCase;

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

  @override
  void emit(RepresentativePersonalProfileState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
