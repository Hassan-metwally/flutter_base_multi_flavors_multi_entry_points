import '../../../../../core/core.dart';
import '../../../../_provider_app/select_role/provider_app_role.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../enums/store_status_enum.dart';

class RepresentativeEntity extends UserEntity {
  final bool isActive;

  const RepresentativeEntity({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required super.storeStatus,
    required super.currentProviderRole,
    required this.isActive,
  });

  const RepresentativeEntity.initial()
    : this(
        id: 0,
        name: '',
        mobile: '',
        avatar: const AttachmentEntity.empty(),
        isVerified: false,
        isActive: false,
        storeStatus: StroeStatusEnum.closed,
        currentProviderRole: null,
      );

  @override
  RepresentativeEntity copyWith({
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
    return RepresentativeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      storeStatus: storeStatus ?? this.storeStatus,
      currentProviderRole: currentProviderRole ?? this.currentProviderRole,
    );
  }

  @override
  List<Object?> get props => super.props..add(isActive);
}
