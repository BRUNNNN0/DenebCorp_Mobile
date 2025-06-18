import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/error/recuperarPassword/recuperar_exception.dart';
import 'package:i_pet/domain/error/recuperarPassword/fireExceptionsRecuperar.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    } on FirebaseException catch (e) {
      throw FirebaseRecuperarExceptionMapper.map(e.code);
    } catch (e) {
      throw RecuperarFailedException();
    }
  }
}