abstract interface class IRecuperarException implements Exception {}

final class RecuperarFailedException implements IRecuperarException {}

final class RecuperarInvalidEmailException implements IRecuperarException {}

final class RecuperarUserNotFoundException implements IRecuperarException {}

final class RecuperarTooManyRequestsException implements IRecuperarException {} 