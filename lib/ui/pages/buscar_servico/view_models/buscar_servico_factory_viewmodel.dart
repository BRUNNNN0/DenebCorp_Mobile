import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_sources_factory.dart';
import 'package:i_pet/data/repositories/buscar_servico/buscar_repository.dart';
import 'package:i_pet/data/repositories/login/login_repository.dart';
import 'package:i_pet/ui/pages/buscar_servico/view_models/buscar_servico_viewmodel.dart';


final class BuscarServicoFactoryViewModel implements IFactoryViewModel<BuscarServicoViewmodel> {
  @override
  BuscarServicoViewmodel create(BuildContext context) {
    final IRemoteFireSource remoteFireSource = RemoteFactoryFireSource().create();
    final IBuscarRepository buscarRepository = BuscarRepository(remoteFireSource);
    return BuscarServicoViewmodel(buscarRepository);
  }

  @override
  void dispose(BuildContext context, BuscarServicoViewmodel viewModel) {
    viewModel.close();
  }
}