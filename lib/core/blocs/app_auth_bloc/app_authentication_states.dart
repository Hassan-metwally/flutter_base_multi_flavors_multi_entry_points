part of core;

abstract class AppAuthenticationState extends Equatable {
  const AppAuthenticationState();
  ProviderAppRoleEnum? get providerAppRole => null;

  @override
  List<Object?> get props => [];
}

class AuthAuthenticatedState extends AppAuthenticationState {
  final CachedUser user;

  const AuthAuthenticatedState({required this.user});

  @override
  ProviderAppRoleEnum? get providerAppRole => user.currentProviderRole;

  @override
  List<Object?> get props => [user];
}

class AuthUninitialized extends AppAuthenticationState {}

class AuthLogInPageState extends AppAuthenticationState {}

class AuthLogOutState extends AppAuthenticationState {}

class GuestState extends AppAuthenticationState {
  @override
  ProviderAppRoleEnum? get providerAppRole => null;
}

class AuthUnauthenticated extends AppAuthenticationState {}
