import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../repository/store_more_repository.dart';

@Injectable()
class StoreGetProfileUseCase extends IUseCase<StoreEntity, NoParams> {
  final StoreMoreRepository _repository;

  StoreGetProfileUseCase(this._repository);
  @override
  Future<Either<Failure, StoreEntity>> call(NoParams params) async {
    return await _repository.getUserData();
  }
}
