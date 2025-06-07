import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_sources_factory.dart';
import 'package:i_pet/data/repositories/perfil/perfil_repository.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_viewmodel.dart';

final class TelaPerfilFactoryViewmodel implements IFactoryViewModel<TelaPerfilViewModel> {
  @override
  TelaPerfilViewModel create(BuildContext context) {
    final IRemoteDataSource remoteDataSource = RemoteFactoryDataSource().create();
    final INonRelationalDataSource nonRelationalDataSource = NonRelationalFactoryDataSource().create();
    final IPerfilRepository perfilRepository = PerfilRepository(remoteDataSource, nonRelationalDataSource);
    return TelaPerfilViewModel(perfilRepository);
  }

  @override
  void dispose(BuildContext context, TelaPerfilViewModel viewModel) {
    viewModel.close();
  }
}