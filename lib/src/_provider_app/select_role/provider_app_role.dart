class CurrentProviderAppRole {
  static ProviderAppRoleEnum? providerAppRole;

  static void setProviderAppRole(ProviderAppRoleEnum providerRole) {
    providerAppRole = providerRole;
  }

  static ProviderAppRoleEnum getAppRoleType() {
    return providerAppRole ?? ProviderAppRoleEnum.store; // Default to store if not set
  }

  static bool get isStore => providerAppRole == ProviderAppRoleEnum.store;

  static bool get isRepresentative => providerAppRole == ProviderAppRoleEnum.representative;
}

enum ProviderAppRoleEnum {
  store("store"),
  representative("representative");

  final String apiValue;

  const ProviderAppRoleEnum(this.apiValue);

  static ProviderAppRoleEnum? fromJson(String apiValue) {
    switch (apiValue) {
      case "store":
        return ProviderAppRoleEnum.store;
      case "representative":
        return ProviderAppRoleEnum.representative;
    }
    return null;
  }

  String get title {
    switch (this) {
      case ProviderAppRoleEnum.store:
        return "";
      case ProviderAppRoleEnum.representative:
        return "";
    }
  }
}
