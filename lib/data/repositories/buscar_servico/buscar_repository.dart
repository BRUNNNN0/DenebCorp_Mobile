
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';

abstract interface class IBuscarRepository {
  Future<List<CombinedServiceOffer>?>  getServico();
}

final class BuscarRepository implements IBuscarRepository {
  final IRemoteFireSource _remoteFireSource;

  const BuscarRepository(this._remoteFireSource);

  @override
  Future<List<CombinedServiceOffer>?> getServico() async {
    try {
      final lista = await _remoteFireSource.getServices();
      return lista;
    } catch (e) {
      print('Erro ao buscar serviços: $e');
      rethrow;
    }
  }
}
