import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/core/widgets/show_dialog_widget.dart';
import 'package:i_pet/data/repositories/perfil/perfil_repository.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/user/user_entity.dart';
import 'package:i_pet/domain/error/perfil/perfil_exception.dart';
import 'package:i_pet/utils/util_text.dart';

final class TelaPerfilViewModel extends Cubit<IRequestState<UserEntity>> {
  final IPerfilRepository _repository;
  
  TelaPerfilViewModel(this._repository) : super(const RequestInitiationState());

  void pegarUsuario() async {
    try {
      _emitter(RequestProcessingState());

      final UserEntity user = await _repository.getUserDataAsync()!;
  
      _emitter(RequestCompletedState(value: user));
      
    } catch (error) {
      final String erorrDescription = _createErrorDescription(error);
      showSnackBar(erorrDescription);
      _emitter(RequestErrorState(error: error));
    }
  }

  String _createErrorDescription(Object? error) {
    if (error is PerfilNotFoundException) return UtilText.labelPerfilNotFound;
    if (error is PerfilUpdateFailedException) return UtilText.labelPerfilUpdateFailed;
    if (error is PerfilDeleteFailedException) return UtilText.labelPerfilDeleteFailed;
    if (error is PerfilInvalidDataException) return UtilText.labelPerfilInvalidData;
    return UtilText.labelPerfilFailure;
  }

  void _emitter(IRequestState<UserEntity> state) {
    if (isClosed) return;
    emit(state);
  }
}

