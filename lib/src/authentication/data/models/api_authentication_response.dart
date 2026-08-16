import '../../../../core/core.dart';
import '../../../../environment_configs.dart';
import '../../../_provider_app/select_role/provider_app_role.dart';
import 'api_user_model.dart';

class ApiLoggedUserResponse {
  final String accessToken;
  final ApiUserModel user;

  const ApiLoggedUserResponse({required this.accessToken, required this.user});

  factory ApiLoggedUserResponse.fromJson(Map<String, dynamic> json) {
    return ApiLoggedUserResponse(accessToken: json["token"] ?? '', user: ApiUserModel.fromJson(_userJsonForEnvironment(json)));
  }

  static Map<String, dynamic> _userJsonForEnvironment(Map<String, dynamic> json) {
    switch (EnvironmentsConfig.appEnvironment) {
      case AppEnvironmentEnum.client:
        return json["user"];
      case AppEnvironmentEnum.provider:
        if (CurrentProviderAppRole.isStore) {
          return json["user"];
        } else if (CurrentProviderAppRole.isRepresentative) {
          return json["user"];
        }
    }
    throw Exception('Invalid app environment or provider role');
  }

  TokenModel get getTokenForSingleSession {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel.forSingleSession(token: accessToken);
  }

  TokenModel get getAsValidTokenModel {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel(token: accessToken);
  }

  ApiUserModel get getUserModel {
    return user;
  }
}
