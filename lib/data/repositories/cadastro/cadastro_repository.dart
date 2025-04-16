import 'dart:convert';

import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/core/library/extensions.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';

abstract interface class IRegisterRepository {
  Future<void> registerAsync(CadastroEntity register);
}

final class RegisterRepository implements IRegisterRepository {
  final IRemoteDataSource _remoteDataSource;
  final INonRelationalDataSource _nonRelationalDataSource;

  const RegisterRepository(this._remoteDataSource, this._nonRelationalDataSource);

  @override
  Future<void> registerAsync(CadastroEntity register) async {
    final response = await _remoteDataSource.post(
      _urlRegister,
      jsonEncode(register.toMap()),
    );

   
    if (response == null || response.statusCode != 200) {
      
      final String? error = response?.data?.toString().toLowerCase();

      if (error != null) {
        if (error.contains('email')) {
          throw RegisterEmailInvalidException();
        } else if (error.contains('phone')) {
          throw RegisterPhoneInvalidException();
        } else if (error.contains('password')) {
          throw RegisterWeakPasswordException();
        }
      }

      throw RegisterFailedException();
    }
  }


  String get _urlRegister => _remoteDataSource.environment?.urlRegister ?? '';
}