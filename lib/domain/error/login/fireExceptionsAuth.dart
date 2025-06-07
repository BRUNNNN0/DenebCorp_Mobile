
import 'package:i_pet/domain/error/login/login_exception.dart';

class FirebaseLoginExceptionMapper {

  static final Map<String, ILoginException> _errorMap = {
    'user-not-found': LoginNotFoundInformsException(),
    'invalid-email': EmailInvalidException(),
    'wrong-password': PasswordIncorretaException(),
  };

  static ILoginException map(String code) {
    return _errorMap[code] ?? LoginNotFoundException(); 
  }
}