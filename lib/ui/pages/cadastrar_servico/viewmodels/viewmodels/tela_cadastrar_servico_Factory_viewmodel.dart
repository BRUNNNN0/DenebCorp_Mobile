import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_sources_factory.dart';
import 'package:i_pet/data/repositories/cadastrar_servico/cadastrarServico_repository.dart';
import 'package:i_pet/ui/pages/cadastrar_servico/viewmodels/viewmodels/tela_cadastrar_servico_viewmodel.dart';

final class CadastroServicoFactoryViewmodel implements IFactoryViewModel<CadastroDeServicoViewModel>{

@override
CadastroDeServicoViewModel create(BuildContext context) {
  final IRemoteFireSource remoteFireSource = RemoteFactoryFireSource().create();
  final IRegisterServiceRepository registerServiceRepository = RegisterServiceRepository(remoteFireSource);
  return CadastroDeServicoViewModel(registerServiceRepository);
}

@override
void dispose(BuildContext context, CadastroDeServicoViewModel viewModel) {
  viewModel.close();
}
}