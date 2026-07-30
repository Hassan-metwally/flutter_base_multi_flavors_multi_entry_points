part of core;

typedef CachedUser = CacheUserEntity;

class CacheUserEntity extends Equatable {
  final int id;
  final String name;
  final String avatar;
  final String mobile;
  final ProviderAppRoleEnum? currentProviderRole;

  const CacheUserEntity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.mobile,
    required this.currentProviderRole,
  });

  CacheUserEntity copyWith({
    int? id,
    String? name,
    String? avatar,
    String? mobile,
    ProviderAppRoleEnum? currentProviderRole,

  }) {
    return CacheUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      mobile: mobile ?? this.mobile,
      currentProviderRole: currentProviderRole ?? this.currentProviderRole,

    );
  }

  @override
  List<Object?> get props => [id, name, avatar, mobile, currentProviderRole];

  @override
  String toString() {
    return "[CachedUser] ----------------------------\n"
        "[ID] $id\n"
        "[Name] $name\n"
        "[Avatar] $avatar\n"
        "[Mobile] $mobile\n"
        "[Current Provider Role] $currentProviderRole\n"
        "-----------------------------------------";
  }
}
