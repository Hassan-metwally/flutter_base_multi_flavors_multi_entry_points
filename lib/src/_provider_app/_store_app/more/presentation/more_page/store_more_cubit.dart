import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/di/di.dart';

typedef StoreMoreState = Async<void>;

@kInjectableProviderEnvironment
@Injectable()
class StoreMoreCubit extends Cubit<StoreMoreState> with SafeEmitMixin {
  StoreMoreCubit() : super(const Async.initial());
}
