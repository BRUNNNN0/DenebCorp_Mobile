abstract interface class IPerfilException implements Exception {}

final class PerfilFailedException implements IPerfilException {}

final class PerfilNotFoundException implements IPerfilException {}

final class PerfilUpdateFailedException implements IPerfilException {}

final class PerfilDeleteFailedException implements IPerfilException {}

final class PerfilInvalidDataException implements IPerfilException {} 