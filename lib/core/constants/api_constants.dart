part of core;

class ApiConstants {
  const ApiConstants._();

  static const String apiBaseUrl = "https://api-zahab.dev-moltaqa.cloud";
  // static const String apiBaseUrl = "https://api-zahab-moltaqa.cloud";

  static String storeApi(String url) => "/api/v1/client/$url";
  static String representativeApi(String url) => "/api/v1/client/$url";
  static String currentApi(String url) => "/api/v1/client/$url";
  static String sharedApi(String url) => "/api/v1/client/$url";

  static String addToApiUrlPath(String url) {
    switch (EnvironmentsConfig.appEnvironment) {
      case AppEnvironmentEnum.client:
        return currentApi(url);
      case AppEnvironmentEnum.provider:
        if (CurrentProviderAppRole.isStore) {
          return storeApi(url);
        } else if (CurrentProviderAppRole.isRepresentative) {
          return representativeApi(url);
        }
    }
    throw Exception('Invalid app environment or provider role');
  }

  static String apiKey =
      "eyJpdiI6IjF3cUZNaEs1NVh3RUZNdlVJTDk3Y2c9PSIsInZhbHVlIjoiQzlndGhNSUVZeTRVUmwvZnR3WGZuaDNaTUxObVZ6RXBNbmFITkRKWUtsTDFXUUIrQkkxMzkvWG9KTDc1K2Z0NiIsIm1hYyI6IjNkNWVlYWI5NjBmMGYxZWU5YzIzYWQzZjk1YjRjMDA3NWFhMDVkMmU3NmExM2ExYzBmM2ExYzNhNmEwOTU4N2IiLCJ0YWciOiIifQ==";

  static const bool isDebug = kDebugMode;
  static const bool canLog = true;
}
