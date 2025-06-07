import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/login/login_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/utils/util_text.dart';
import 'package:i_pet/utils/util_validator.dart';

final class LoginViewModel extends Cubit<IRequestState<String>> {
  final ILoginRepository _repository;
  
  LoginViewModel(this._repository) : super(const RequestInitiationState());

  void onAuthentication(LoginEntity user) async {
    
    try {
      _emitter(RequestProcessingState());

      if (!UtilValidator.isValidEmail(user.login)) throw EmailInvalidException();
      if (!UtilValidator.isValidPassword(user.password)) throw PasswordInvalidException();

      final String token = await _repository.authenticationAsync(user)!;

print(token);

      if (token.trim().isNotEmpty) _onNavigateGoPerfil();

      _emitter(RequestCompletedState(value: token));

    } catch (error) {
      final String erorrDescription = _createErrorDescription(error);
      showSnackBar(erorrDescription);
      _emitter(RequestErrorState(error: error));
    }
  }

  void _onNavigateGoPerfil() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kPerfil);
  }

  String _createErrorDescription(Object? error) {
    if(error is LoginNotFoundInformsException) return UtilText.labelLoginNotf;
    if (error is EmailInvalidException) return UtilText.labelLoginInvalidEmail;
    if (error is PasswordIncorretaException) return UtilText.labelLoginInvalidEmailPass;
    return UtilText.labelLoginFailure;
  }

  void _emitter(IRequestState<String> state) {
    if (isClosed) return;
    emit(state);
  }
}
