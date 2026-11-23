import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/data/models/users/api_store_model.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../../domain/repository/store_more_repository.dart';
import '../../domain/use_cases/store_update_profile_use_case.dart';

@Injectable(as: StoreMoreRepository)
class StoreMoreRepositoryImp implements StoreMoreRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorage;

  const StoreMoreRepositoryImp(this._apiHelper, this._secureStorage);

  @override
  DomainServiceType<StoreEntity> getUserData() async {
    return await failureCollect<StoreEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.addToApiUrlPath("profile"));
      final data = ApiStoreModel.fromJson(result['data']["user"]);
      return Right(data.map);
    });
  }

  @override
  DomainServiceType<StoreEntity> updateUserData(StoreUpdateProfileParams params) async {
    return await failureCollect<StoreEntity>(() async {
      final result = await _apiHelper.post(url: ApiConstants.addToApiUrlPath("profile"), body: params.toMap);
      final data = ApiStoreModel.fromJson(result['data']["user"]).map;
      await _secureStorage.setCachedUser(data.mapToCacheEntity);
      return Right(data);
    });
  }
}
