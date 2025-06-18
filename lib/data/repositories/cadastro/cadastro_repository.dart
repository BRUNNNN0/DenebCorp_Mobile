import 'dart:convert';

import 'package:i_pet/configs/data_base_schema_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/core/library/extensions.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';

abstract interface class IRegisterRepository {
  Future<void> registerAsync(CadastroEntity register);
}

final class RegisterRepository implements IRegisterRepository {
  final IRemoteFireSource _remoteFireSource;
  final INonRelationalDataSource _nonRelationalDataSource;


  const RegisterRepository(this._remoteFireSource, this._nonRelationalDataSource);

  @override
Future<void> registerAsync(CadastroEntity register) async {
  final token = await _nonRelationalDataSource.loadString(DataBaseNoSqlSchemaHelper.kUserToken);
  try {

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