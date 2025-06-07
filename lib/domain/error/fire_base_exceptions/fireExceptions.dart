

import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';

class FirebaseExceptionMapper {
  static final Map<String, IRegisterException> _errorMap = {
    'invalid-email': RegisterEmailInvalidException(),
    'email-already-in-use': RegisterEmailAlreadyInUseException(),
    'weak-password': RegisterWeakPasswordException(),

  };

  static IRegisterException map(String code) {
    return _errorMap[code] ?? RegisterFailedException();
  }
}