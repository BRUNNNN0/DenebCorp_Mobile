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
  final IRemoteDataSource _remoteDataSource;
  final INonRelationalDataSource _nonRelationalDataSource;

  const LoginRepository(this._remoteDataSource, this._nonRelationalDataSource);

  @override
  Future<String> authenticationAsync(LoginEntity login) async {
    final HttpResponseEntity httpResponse = (await _remoteDataSource.post(_urlAuthentication, jsonEncode(login.toMap())))!;
    
    if (!httpResponse.toBool()) throw LoginNotFoundException();

    final String token = httpResponse.data as String;
    await _saveTokenAsync(token);
    
    return token;
  }

  Future<bool> _saveTokenAsync(String token) {
    debugPrint("teste: $_nonRelationalDataSource.saveString(DataBaseNoSqlSchemaHelper.kUserToken, token).toString()");
    return _nonRelationalDataSource.saveString(DataBaseNoSqlSchemaHelper.kUserToken, token)!;
  }

  String get _urlAuthentication => _remoteDataSource.environment?.urlAuthentication ?? '';
} 