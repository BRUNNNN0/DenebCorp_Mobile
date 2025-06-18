import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/buscar_servico/buscar_repository.dart';
import 'package:i_pet/data/repositories/login/login_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';
import 'package:i_pet/domain/error/buscar_servico/buscar_exception.dart';
import 'package:i_pet/utils/util_text.dart';

final class BuscarServicoViewmodel extends Cubit<IRequestState<List<CombinedServiceOffer>?>> {
  final IBuscarRepository _repository;
  
  BuscarServicoViewmodel(this._repository) : super(const RequestInitiationState());

  void findServices() async {
    try {
      _emitter(RequestProcessingState());

      final List<CombinedServiceOffer>? lista = await _repository.getServico();

      _emitter(RequestCompletedState(value: lista));
    } catch (error) {
      final String errorMessage = _createErrorDescription(error);
      showSnackBar(errorMessage);
      _emitter(RequestErrorState(error: error));
    }
  }

  String _createErrorDescription(Object error) {
    if (error is BuscarNotFoundException) return UtilText.labelBuscarNotFound;
    if (error is BuscarInvalidQueryException) return UtilText.labelBuscarInvalidQuery;
    if (error is BuscarPermissionDeniedException) return UtilText.labelBuscarPermissionDenied;
    if (error is BuscarInvalidLocationException) return UtilText.labelBuscarInvalidLocation;
    return UtilText.labelBuscarFailure;
  }

  void _emitter(IRequestState<List<CombinedServiceOffer>?> state) {
    if (isClosed) return;
    emit(state);
  }
}