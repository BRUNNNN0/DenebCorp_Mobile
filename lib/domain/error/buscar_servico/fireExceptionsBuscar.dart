import 'package:i_pet/domain/error/buscar_servico/buscar_exception.dart';

class FirebaseBuscarExceptionMapper {
  static final Map<String, IBuscarException> _errorMap = {
    'permission-denied': BuscarPermissionDeniedException(),
    'not-found': BuscarNotFoundException(),
    'invalid-query': BuscarInvalidQueryException(),
    'invalid-location': BuscarInvalidLocationException(),
  };

  static IBuscarException map(String code) {
    return _errorMap[code] ?? BuscarFailedException();
  }
} 