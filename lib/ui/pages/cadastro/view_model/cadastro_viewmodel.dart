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

  // Método principal de registro
  void onRegister(CadastroEntity entity) async {
    try {
      // Inicia o processo de registro
      _emitter(RequestProcessingState());

      // Validação do email
      if (entity.email.isEmpty || !entity.email.contains('@')) {
        throw RegisterEmailInvalidException();
      }

      // Validação do telefone
      if (entity.phoneNumber.length < 11) {
        throw RegisterPhoneInvalidException();
      }

      // Validação da senha
      if (entity.password.length < 8) {
        throw RegisterWeakPasswordException();
      }

      // Chamada para o repositório para registrar o usuário
      await _repository.registerAsync(entity);

      // Navegação após o sucesso do cadastro
      _onNavigateGoToLogin();

      // Emitindo o estado de conclusão
      _emitter(const RequestCompletedState());
    } catch (error) {
      // Tratamento de erro e exibição de mensagem de erro
      final String errorMessage = _createErrorDescription(error);
      showSnackBar(errorMessage);
      _emitter(RequestErrorState(error: error));
    }
  }

  // Função para navegar para a tela de login após o cadastro
  void _onNavigateGoToLogin() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kLogin);
  }

  // Função para gerar a mensagem de erro apropriada com base na exceção
  String _createErrorDescription(Object? error) {
    if (error is RegisterEmailInvalidException) return UtilText.labelRegisterInvalidEmail;
    if (error is RegisterPhoneInvalidException) return UtilText.labelRegisterInvalidPhone;
    if (error is RegisterWeakPasswordException) return UtilText.labelRegisterWeakPassword;
    return UtilText.labelRegisterFailure;
  }

  // Função para emitir os estados para a UI
  void _emitter(IRequestState<void> state) {
    if (isClosed) return;
    emit(state);
  }
}
