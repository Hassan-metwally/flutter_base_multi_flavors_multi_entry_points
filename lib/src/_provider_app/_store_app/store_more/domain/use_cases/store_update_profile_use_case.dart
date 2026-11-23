import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../common/domain/entity/users/store_entity.dart';
import '../repository/store_more_repository.dart';

@Injectable()
class StoreUpdateProfileUseCase extends IUseCase<StoreEntity, StoreUpdateProfileParams> {
  final StoreMoreRepository _repository;

  StoreUpdateProfileUseCase(this._repository);
  @override
  Future<Either<Failure, StoreEntity>> call(StoreUpdateProfileParams params) async {
    return await _repository.updateUserData(params);
  }
}

class StoreUpdateProfileParams {
  final AttachmentEntity? image;
  final String name;

  const StoreUpdateProfileParams({required this.image, required this.name});

  Map<String, dynamic> get toMap {
    final MultipartFile? file = image?.path.toMultipartFile;
    return {if (file != null) 'avatar': file, 'name': name, "_method": "put"};
  }
}
