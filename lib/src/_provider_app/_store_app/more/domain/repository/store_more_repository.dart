import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../use_cases/update_store_profile_use_case.dart';

abstract class StoreMoreRepository {
  DomainServiceType<StoreEntity> getUserData();
  DomainServiceType<StoreEntity> updateUserData(UpdateStoreProfileParams params);
}
