import 'package:i_pet/domain/error/perfil/perfil_exception.dart';

class FirebasePerfilExceptionMapper {
  static final Map<String, IPerfilException> _errorMap = {
    'permission-denied': PerfilFailedException(),
    'not-found': PerfilNotFoundException(),
    'invalid-data': PerfilInvalidDataException(),
    'update-failed': PerfilUpdateFailedException(),
    'delete-failed': PerfilDeleteFailedException(),
  };

  static IPerfilException map(String code) {
    return _errorMap[code] ?? PerfilFailedException();
  }
} 