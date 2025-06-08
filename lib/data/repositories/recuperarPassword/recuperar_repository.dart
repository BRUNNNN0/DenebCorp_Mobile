import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';

abstract interface class IRecuperarRepository {
  Future<void> recuperarSenha(String login);
}

final class RecuperarRepository implements IRecuperarRepository {
  final IRemoteFireSource _remoteFireSource;

  const RecuperarRepository(this._remoteFireSource);

  @override
  Future<void> recuperarSenha(String login) async {
    try {
      await _remoteFireSource.recoveryPassword(login);
    } on ILoginException catch (e) {
      rethrow;
    } catch (_) {
      throw Exception('Erro inesperado ao recuperar senha.');
    }
  }
}