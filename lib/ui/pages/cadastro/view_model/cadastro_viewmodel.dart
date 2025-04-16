import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/cadastro/cadastro_repository.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/utils/util_text.dart';


final class CadastroViewmodel extends Cubit<IRequestState<void>> {
  final IRegisterRepository _repository;

  CadastroViewmodel(this._repository) : super(const RequestInitiationState());


  void onRegister(CadastroEntity entity) async {
    try {

      _emitter(RequestProcessingState());


      if (entity.email.isEmpty || !entity.email.contains('@')) {
        throw RegisterEmailInvalidException();
      }


      if (entity.phoneNumber.length < 11) {
        throw RegisterPhoneInvalidException();
      }

      if (entity.password.length < 8) {
        throw RegisterWeakPasswordException();
      }


      await _repository.registerAsync(entity);
         debugPrint("teste: $entity");


      _onNavigateGoToLogin();


      _emitter(const RequestCompletedState());
    } catch (error) {

      final String errorMessage = _createErrorDescription(error);
      showSnackBar(errorMessage);
      _emitter(RequestErrorState(error: error));
    }
  }


  void _onNavigateGoToLogin() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kLogin);
  }


  String _createErrorDescription(Object? error) {
    if (error is RegisterEmailInvalidException) return UtilText.labelRegisterInvalidEmail;
    if (error is RegisterPhoneInvalidException) return UtilText.labelRegisterInvalidPhone;
    if (error is RegisterWeakPasswordException) return UtilText.labelRegisterWeakPassword;
    return UtilText.labelRegisterFailure;
  }


  void _emitter(IRequestState<void> state) {
    if (isClosed) return;
    emit(state);
  }
}
