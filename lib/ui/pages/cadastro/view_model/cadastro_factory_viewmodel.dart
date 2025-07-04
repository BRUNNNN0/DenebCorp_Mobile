import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_sources_factory.dart';
import 'package:i_pet/data/repositories/cadastro/cadastro_repository.dart';
import 'package:i_pet/data/repositories/login/login_repository.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_viewmodel.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';

final class CadastroFactoryViewmodel implements IFactoryViewModel<CadastroViewmodel> {
  @override
  CadastroViewmodel create(BuildContext context) {
    final IRemoteFireSource remoteFireSource = RemoteFactoryFireSource().create();
    final INonRelationalDataSource nonRelationalDataSource = NonRelationalFactoryDataSource().create();
    final IRegisterRepository registerRepository = RegisterRepository(remoteFireSource, nonRelationalDataSource);
    return CadastroViewmodel(registerRepository);
  }

  @override
  void dispose(BuildContext context, CadastroViewmodel viewModel) {
    viewModel.close();
  }
}