import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_pet/configs/data_base_schema_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/core/http_response_entity.dart';
import 'package:i_pet/core/library/extensions.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';


abstract interface class ILoginRepository {
  Future<String>? authenticationAsync(LoginEntity login);
}

final class LoginRepository implements ILoginRepository {
  final IRemoteFireSource _remoteFireSource;
  final INonRelationalDataSource _nonRelationalDataSource;
  const LoginRepository(this._remoteFireSource, this._nonRelationalDataSource);

  @override
  Future<String> authenticationAsync(LoginEntity login) async {
    
    try {
      final respokey = await _remoteFireSource.acessar(login);

      final String token = respokey as String;
      
      await _saveTokenAsync(token);
      
      return token;
 } on ILoginException catch (e) {
    rethrow;
  }
  }
  Future<bool> _saveTokenAsync(String token) {
    return _nonRelationalDataSource.saveString(DataBaseNoSqlSchemaHelper.kUserToken, token)!;
  }
}