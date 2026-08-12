import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../repository/store_more_repository.dart';

@Injectable()
class UpdateStoreProfileUseCase extends IUseCase<StoreEntity, UpdateStoreProfileParams> {
  final StoreMoreRepository _repository;

  UpdateStoreProfileUseCase(this._repository);
  @override
  Future<Either<Failure, StoreEntity>> call(UpdateStoreProfileParams params) async {
    return await _repository.updateUserData(params);
  }
}

class UpdateStoreProfileParams {
  final AttachmentEntity? image;
  final String name;

  const UpdateStoreProfileParams({required this.image, required this.name});

  Map<String, dynamic> get toMap {
    final MultipartFile? file = image?.path.toMultipartFile;
    return {if (file != null) 'avatar': file, 'name': name};
  }
}
