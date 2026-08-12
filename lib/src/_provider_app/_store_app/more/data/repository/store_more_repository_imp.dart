import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../../environment_configs.dart';
import '../../../../../common/data/models/users/api_store_model.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../../../../select_role/provider_app_role.dart';
import '../../domain/repository/store_more_repository.dart';
import '../../domain/use_cases/update_store_profile_use_case.dart';

@Injectable(as: StoreMoreRepository)
class StoreMoreRepositoryImp implements StoreMoreRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorage;

  const StoreMoreRepositoryImp(this._apiHelper, this._secureStorage);

  @override
  DomainServiceType<StoreEntity> getUserData() async {
    return await failureCollect<StoreEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.addToApiUrlPath("auth/profile"));
      final data = ApiStoreModel.fromJson(result['data']);
      return Right(data.map);
    });
  }

  @override
  DomainServiceType<StoreEntity> updateUserData(UpdateStoreProfileParams params) async {
    return await failureCollect<StoreEntity>(() async {
      final result = await _apiHelper.post(url: ApiConstants.addToApiUrlPath("auth/update-profile"), body: params.toMap);
      StoreEntity data = ApiStoreModel.fromJson(List.from(result['data']).firstOrNull).map;
      switch (EnvironmentsConfig.appEnvironment) {
        case AppEnvironmentEnum.client:
          data = data.copyWith(clearCurrentProviderRole: true);
        case AppEnvironmentEnum.provider:
          if (CurrentProviderAppRole.isStore) {
            data = data.copyWith(currentProviderRole: ProviderAppRoleEnum.store);
          } else if (CurrentProviderAppRole.isRepresentative) {
            data = data.copyWith(currentProviderRole: ProviderAppRoleEnum.representative);
          }
      }

      await _secureStorage.setCachedUser(data.mapToCacheEntity);
      return Right(data);
    });
  }
}
