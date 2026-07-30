import 'package:bloc/bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/di/di.dart';
import '../../domain/use_case/_store_register_use_case.dart';

typedef StoreRegisterState = Async<void>;

class StoreRegisterCubit extends Cubit<StoreRegisterState> with SafeEmitMixin {
  StoreRegisterCubit() : super(const Async.initial());

  final StoreRegisterUseCase _registerUseCase = injector();

  void register(StoreRegisterParams params) async {
    emit(const Async.loading());
    final result = await _registerUseCase(params);
    result.fold(
      (failure) {
        emit(Async.failure(failure));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
    emit(const Async.initial());
  }
}
