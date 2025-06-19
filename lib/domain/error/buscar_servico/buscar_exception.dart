abstract interface class IBuscarException implements Exception {}

final class BuscarFailedException implements IBuscarException {}

final class BuscarNotFoundException implements IBuscarException {}

final class BuscarInvalidQueryException implements IBuscarException {}

final class BuscarPermissionDeniedException implements IBuscarException {}

final class BuscarInvalidLocationException implements IBuscarException {} 