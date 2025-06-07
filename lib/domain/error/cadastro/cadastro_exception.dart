
abstract interface class IRegisterException implements Exception {}


final class RegisterFailedException implements IRegisterException {}


final class RegisterEmailInvalidException implements IRegisterException {}


final class RegisterPhoneInvalidException implements IRegisterException {}


final class RegisterWeakPasswordException implements IRegisterException {}