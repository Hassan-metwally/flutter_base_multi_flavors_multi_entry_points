import '../../../../../core/core.dart';
import '../../../../_provider_app/select_role/provider_app_role.dart';
import '../../../../authentication/data/models/api_user_model.dart';
import '../../../domain/entity/users/representative_entity.dart';
import '../../../domain/enums/store_status_enum.dart';

class ApiRepresentativeModel extends ApiUserModel {
  final bool? isActive;

  ApiRepresentativeModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required this.isActive,
    required super.providerStatus,
  });

  factory ApiRepresentativeModel.fromJson(Map<String, dynamic> json) => ApiRepresentativeModel(
    id: json["id"],
    name: json["name"],
    mobile: json["phone"],
    avatar: json["avatar"] != null ? AttachmentEntity.fromNetwork(url: json["avatar"]) : null,
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    providerStatus: json["provider_status"] != null ? StroeStatusEnum.fromString(json["provider_status"]) : null,
  );
}

extension ApiRepresentativeProfileModelEXT on ApiRepresentativeModel {
  RepresentativeEntity get map => RepresentativeEntity(
    id: id ?? 0,
    name: name ?? '',
    mobile: mobile ?? '',
    avatar: avatar ?? const AttachmentEntity.empty(),
    isVerified: isVerified,
    isActive: isActive ?? false,
    storeStatus: providerStatus ?? StroeStatusEnum.closed,
    currentProviderRole: ProviderAppRoleEnum.representative,
  );
}
