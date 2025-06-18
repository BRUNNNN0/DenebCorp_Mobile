import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/injection_container.dart';
import 'package:i_pet/core/service/IApp_Service.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/cadastrar_servico/cadastrarServico_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/domain/error/cadastrar_servico/servico_exception.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/utils/util_text.dart';

class CadastroDeServicoViewModel extends Cubit<IRequestState<void>> {
  final IRegisterServiceRepository _repository;

  CadastroDeServicoViewModel(this._repository) : super(const RequestInitiationState());

  void cadastrarServico({required ServiceEntity service, required String preco}) async {
    _emitter(RequestProcessingState());

    try {
      await _repository.registerServiceAsync(service, preco);

      _onNavigate();
      _emitter(const RequestCompletedState());
    } catch (error) {
      final String errorMessage = _createErrorDescription(error);
      showSnackBar(errorMessage);
      _emitter(RequestErrorState(error: error));
    }
  }

  String _createErrorDescription(Object error) {
    if (error is ServicoInvalidDataException) return UtilText.labelServicoInvalidData;
    if (error is ServicoPermissionDeniedException) return UtilText.labelServicoPermissionDenied;
    if (error is ServicoAlreadyExistsException) return UtilText.labelServicoAlreadyExists;
    if (error is ServicoInvalidLocationException) return UtilText.labelServicoInvalidLocation;
    return UtilText.labelServicoFailure;
  }

  void _onNavigate() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kbuscarservico);
  }

  void _emitter(IRequestState<void> state) {
    if (!isClosed) emit(state);
  }
}