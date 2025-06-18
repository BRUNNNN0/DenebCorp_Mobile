import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';

abstract interface class IRegisterServiceRepository {
  Future<void> registerServiceAsync(ServiceEntity register, String value);
}

final class RegisterServiceRepository implements IRegisterServiceRepository {
  final IRemoteFireSource _remoteFireSource;

  const RegisterServiceRepository(this._remoteFireSource);
  
  @override
  Future<void> registerServiceAsync(ServiceEntity register, String value) async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      if (user != null) {
        final userToken = user.uid;
        print('UID do usuário logado: $userToken');

        await _remoteFireSource.registerService(register, value, userToken);
      } else {
        throw Exception('Usuário não está logado.');
      }
    } on ILoginException catch (e) {
      rethrow;
    } catch (_) {
      throw Exception('Erro inesperado ao recuperar registrar servico.');
    }
  }
}