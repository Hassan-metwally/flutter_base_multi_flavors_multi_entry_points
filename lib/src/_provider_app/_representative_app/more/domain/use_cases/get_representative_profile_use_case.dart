import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/representative_entity.dart';
import '../repository/representative_more_repository.dart';

@Injectable()
class GetRepresentativeProfileUseCase extends IUseCase<RepresentativeEntity, NoParams> {
  final RepresentativeMoreRepository _repository;

  GetRepresentativeProfileUseCase(this._repository);
  @override
  Future<Either<Failure, RepresentativeEntity>> call(NoParams params) async {
    return await _repository.getUserData();
  }
}
