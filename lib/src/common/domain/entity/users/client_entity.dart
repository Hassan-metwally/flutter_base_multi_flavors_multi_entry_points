import '../../../../../core/core.dart';
import '../../../../_provider_app/select_role/provider_app_role.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../enums/store_status_enum.dart';

class ClientEntity extends UserEntity {
  const ClientEntity({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required super.currentProviderRole,
  });

  const ClientEntity.initial()
    : this(id: 0, name: '', mobile: '', avatar: const AttachmentEntity.empty(), isVerified: false, currentProviderRole: null);

  @override
  ClientEntity copyWith({
    int? id,
    String? name,
    String? mobile,
    AttachmentEntity? avatar,
    bool? isVerified,
    bool? isActive,
    StroeStatusEnum? storeStatus,
    bool? clearCurrentProviderRole,
    ProviderAppRoleEnum? currentProviderRole,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      currentProviderRole: clearCurrentProviderRole == true ? null : currentProviderRole ?? this.currentProviderRole,
    );
  }
}
