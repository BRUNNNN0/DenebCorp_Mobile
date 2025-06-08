import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/recuperarPassword/recuperar_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';
import 'package:i_pet/utils/util_text.dart';
import 'package:i_pet/utils/util_validator.dart';


final class RecuperarSenhaViewModel extends Cubit<IRequestState<void>> {
  final IRecuperarRepository _repository;

  RecuperarSenhaViewModel(this._repository)
      : super(const RequestInitiationState());

  void onRecuperarSenha(String email) async {
    try {
      _emitter(const RequestProcessingState());

      if (!UtilValidator.isValidEmail(email)) {
        throw EmailInvalidException();
      }

      await _repository.recuperarSenha(email);

      showSnackBar('E-mail de redefinição enviado com sucesso!');
      _emitter(const RequestCompletedState(value: null));
    } catch (error) {
      final String message = _createErrorDescription(error);
      showSnackBar(message);
      _emitter(RequestErrorState(error: message));
    }
  }

  String _createErrorDescription(Object error) {
    if (error is EmailInvalidException) {
      return UtilText.labelLoginInvalidEmail;
    }
    return UtilText.labelLoginFailure;
  }

  void _emitter(IRequestState<void> state) {
    if (isClosed) return;
    emit(state);
  }
}
