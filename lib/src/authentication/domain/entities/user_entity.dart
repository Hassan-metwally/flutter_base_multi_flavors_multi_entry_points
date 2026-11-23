import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../_provider_app/provider_select_role/provider_app_role.dart';
import '../../../common/domain/enums/store_status_enum.dart';
import '../../data/models/api_user_model.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String mobile;
  final AttachmentEntity avatar;
  final bool? isVerified;
  final StroeStatusEnum? storeStatus;
  final ProviderAppRoleEnum? currentProviderRole;

  const UserEntity({
    required this.id,
    required this.name,
    required this.mobile,
    required this.avatar,
    required this.isVerified,
    required this.currentProviderRole,
    this.storeStatus,
  });

  UserEntity copyWith({
    int? id,
    String? name,
    String? mobile,
    AttachmentEntity? avatar,
    bool? isVerified,
    bool? isActive,
    StroeStatusEnum? storeStatus,
    ProviderAppRoleEnum? currentProviderRole,
    bool? clearCurrentProviderRole,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      storeStatus: storeStatus ?? this.storeStatus,
      currentProviderRole: clearCurrentProviderRole == true ? null : currentProviderRole ?? this.currentProviderRole,
    );
  }

  CacheUserEntity get mapToCacheEntity {
    return CacheUserEntity(id: id, name: name, avatar: avatar.path, mobile: mobile, currentProviderRole: currentProviderRole);
  }

  @override
  List<Object?> get props => [id, name, mobile, avatar, isVerified, storeStatus, currentProviderRole];
}

class PhoneEntity extends Equatable {
  final String phone;
  final String code;
  final String isoCode;

  const PhoneEntity({required this.phone, required this.code, required this.isoCode});

  IntelPhoneNumberEntity get getFieldPhoneMumber => IntelPhoneNumberEntity(number: phone, countryISOCode: isoCode, countryCode: code);

  String get mobileWithCode => "$code$phone";

  Map<String, dynamic> get toMap => {
    kCountryCodeAttributeCacheKey: code,
    kPhoneAttributeCacheKey: phone,
    kCountryIsoCodeAttributeCacheKey: isoCode,
  };

  @override
  List<Object?> get props => [phone, code, isoCode];
}
