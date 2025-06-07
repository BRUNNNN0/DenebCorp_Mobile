import 'dart:convert';

import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/core/library/extensions.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';

abstract interface class IRegisterRepository {
  Future<void> registerAsync(CadastroEntity register);
}

final class RegisterRepository implements IRegisterRepository {
  final IRemoteFireSource _remoteFireSource;

  const RegisterRepository(this._remoteFireSource);

  @override
Future<void> registerAsync(CadastroEntity register) async {
  try {
    // 1. Cria o usuário no Firebase Auth e obtém o userId
    final userId = await _remoteFireSource.registerAuth(
      register.email,
      register.password,
    );

    final userMap = register.toMap();
    await _remoteFireSource.registerInfoUser(userId, userMap);
    
  } on IRegisterException catch (e) {
    rethrow;
  } catch (e) {
    throw RegisterFailedException();
  }
}
}