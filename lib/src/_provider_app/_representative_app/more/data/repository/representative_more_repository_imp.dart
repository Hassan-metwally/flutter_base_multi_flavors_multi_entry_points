import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/data/models/users/api_representative_model.dart';
import '../../../../../common/domain/entity/users/representative_entity.dart';
import '../../domain/repository/representative_more_repository.dart';

@Injectable(as: RepresentativeMoreRepository)
class RepresentativeMoreRepositoryImp implements RepresentativeMoreRepository {
  final DioHelper _apiHelper;

  const RepresentativeMoreRepositoryImp(this._apiHelper);

  @override
  DomainServiceType<RepresentativeEntity> getUserData() async {
    return await failureCollect<RepresentativeEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.flavorApi("auth/profile"));
      final data = ApiRepresentativeModel.fromJson(result['data']);
      return Right(data.map);
    });
  }
}
