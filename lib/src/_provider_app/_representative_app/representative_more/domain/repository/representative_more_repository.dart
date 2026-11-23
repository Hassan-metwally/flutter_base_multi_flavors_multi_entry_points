import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/representative_entity.dart';

abstract class RepresentativeMoreRepository {
  DomainServiceType<RepresentativeEntity> getUserData();
}
