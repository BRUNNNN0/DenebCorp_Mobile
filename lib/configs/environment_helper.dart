abstract interface class IEnvironmentHelper {
  String? get urlAuthentication;
  String? get urlUserInformation;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();

  String get _urlBase => 'http://localhost:8080';

  @override
  String? get urlAuthentication => '$_urlBase/auth/login';

  @override
  String get urlUserInformation => '$_urlBase/user_information';
}
