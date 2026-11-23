import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';

typedef MoreState = Async<void>;

@Injectable()
class RepresentativeMoreCubit extends Cubit<MoreState> with SafeEmitMixin {
  RepresentativeMoreCubit() : super(const Async.initial());
}
