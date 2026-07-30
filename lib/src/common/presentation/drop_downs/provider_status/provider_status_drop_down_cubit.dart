import '../../../../../../core/core.dart';
import '../../../domain/enums/store_status_enum.dart';
import '../drop_downs/drop_down_cubit.dart';

class ServicesDropDownCubit extends DropDownCubit<StroeStatusEnum> {
  ServicesDropDownCubit();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    emit(Async.success([StroeStatusEnum.opened, StroeStatusEnum.closed]));
  }
}
