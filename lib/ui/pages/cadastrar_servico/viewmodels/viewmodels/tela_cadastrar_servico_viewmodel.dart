import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/injection_container.dart';
import 'package:i_pet/core/service/IApp_Service.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/cadastrar_servico/cadastrarServico_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_pet/routing/routingHelper.dart';

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

      _emitter(RequestErrorState(error: error));
    }
  }


  void _onNavigate() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kbuscarservico);
  }



  void _emitter(IRequestState<void> state) {
    if (!isClosed) return
     emit(state);
  }
}