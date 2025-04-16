abstract interface class IEnvironmentHelper {
  String? get urlAuthentication;
  String? get urlRegister;
  String? get urlUserInformation;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();


  String get _urlBase => 'http://192.168.0.215:8080';

  @override
  String? get urlAuthentication => '$_urlBase/auth/login';

  @override
  String get urlRegister => '$_urlBase/auth/register';

  @override
  String get urlUserInformation => '$_urlBase/user_information';
}

