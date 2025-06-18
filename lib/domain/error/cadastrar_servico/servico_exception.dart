abstract interface class IServicoException implements Exception {}

final class ServicoFailedException implements IServicoException {}

final class ServicoInvalidDataException implements IServicoException {}

final class ServicoPermissionDeniedException implements IServicoException {}

final class ServicoAlreadyExistsException implements IServicoException {}

final class ServicoInvalidLocationException implements IServicoException {} 