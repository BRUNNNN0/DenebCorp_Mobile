abstract interface class IEnvironmentHelper {
  String? get urlAuthentication;
  String? get urlRegister;
  String? get urlUserInformation;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();


  String get _urlBase => 'http://10.0.0.111:8080';

  @override
  String? get urlAuthentication => '$_urlBase/auth/login';

  @override
  String get urlUserInformation => '$_urlBase/users/me';

  String get urlRegister => '$_urlBase/auth/register';

}

