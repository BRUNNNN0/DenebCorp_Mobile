import 'package:i_pet/domain/error/cadastrar_servico/servico_exception.dart';

class FirebaseServicoExceptionMapper {
  static final Map<String, IServicoException> _errorMap = {
    'permission-denied': ServicoPermissionDeniedException(),
    'invalid-data': ServicoInvalidDataException(),
    'already-exists': ServicoAlreadyExistsException(),
    'invalid-location': ServicoInvalidLocationException(),
  };

  static IServicoException map(String code) {
    return _errorMap[code] ?? ServicoFailedException();
  }
} 