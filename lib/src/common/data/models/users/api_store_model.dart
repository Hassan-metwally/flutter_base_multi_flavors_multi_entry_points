import '../../../../../core/core.dart';
import '../../../../_provider_app/select_role/provider_app_role.dart';
import '../../../../authentication/data/models/api_user_model.dart';
import '../../../domain/entity/users/store_entity.dart';
import '../../../domain/enums/store_status_enum.dart';

class ApiStoreModel extends ApiUserModel {
  final bool? isActive;

  ApiStoreModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required this.isActive,
    required super.providerStatus,
  });

  factory ApiStoreModel.fromJson(Map<String, dynamic> json) => ApiStoreModel(
    id: json["id"],
    name: json["name"],
    mobile: json["phone"],
    avatar: json["avatar"] != null ? AttachmentEntity.fromNetwork(url: json["avatar"]) : null,
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    providerStatus: json["provider_status"] != null ? StroeStatusEnum.fromString(json["provider_status"]) : null,
  );
}

extension ApiStoreProfileModelEXT on ApiStoreModel {
  StoreEntity get map => StoreEntity(
    id: id ?? 0,
    name: name ?? '',
    mobile: mobile ?? '',
    avatar: avatar ?? const AttachmentEntity.empty(),
    isVerified: isVerified,
    isActive: isActive ?? false,
    storeStatus: providerStatus ?? StroeStatusEnum.closed,
    currentProviderRole: ProviderAppRoleEnum.store,
  );
}
