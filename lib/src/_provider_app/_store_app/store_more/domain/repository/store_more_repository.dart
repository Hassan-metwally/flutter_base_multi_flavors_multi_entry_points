import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../use_cases/store_update_profile_use_case.dart';

abstract class StoreMoreRepository {
  DomainServiceType<StoreEntity> getUserData();
  DomainServiceType<StoreEntity> updateUserData(StoreUpdateProfileParams params);
}
