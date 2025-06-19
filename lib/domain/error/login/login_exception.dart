abstract interface class ILoginException implements Exception {}

final class LoginNotFoundInformsException implements ILoginException{}

final class LoginNotFoundException implements ILoginException {}

final class EmailInvalidException implements ILoginException {}

final class PasswordInvalidException implements ILoginException {}

final class PasswordIncorretaException implements ILoginException {}