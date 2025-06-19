import 'package:i_pet/domain/error/recuperarPassword/recuperar_exception.dart';

class FirebaseRecuperarExceptionMapper {
  static final Map<String, IRecuperarException> _errorMap = {
    'invalid-email': RecuperarInvalidEmailException(),
    'user-not-found': RecuperarUserNotFoundException(),
    'too-many-requests': RecuperarTooManyRequestsException(),
  };

  static IRecuperarException map(String code) {
    return _errorMap[code] ?? RecuperarFailedException();
  }
} 