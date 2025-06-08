import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_sources_factory.dart';
import 'package:i_pet/data/repositories/login/login_repository.dart';
import 'package:i_pet/data/repositories/recuperarPassword/recuperar_repository.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/ui/pages/recovery_Password/view_models/tela_recuperar_viewmodel.dart';

final class RecuperarSenhaFactoryViewModel implements IFactoryViewModel<RecuperarSenhaViewModel> {
  @override
  RecuperarSenhaViewModel create(BuildContext context) {
    final IRemoteFireSource remoteFireSource = RemoteFactoryFireSource().create();
    final IRecuperarRepository recuperarRepository = RecuperarRepository(remoteFireSource);
    return RecuperarSenhaViewModel(recuperarRepository);
  }

  @override
  void dispose(BuildContext context, RecuperarSenhaViewModel viewModel) {
    viewModel.close();
  }
}