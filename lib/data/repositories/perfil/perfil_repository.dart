import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_pet/configs/data_base_schema_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/core/http_response_entity.dart';
import 'package:i_pet/core/library/extensions.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/domain/entities/user/user_entity.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';


abstract interface class IPerfilRepository {
    getUserDataAsync();
}

final class PerfilRepository implements IPerfilRepository {
  final IRemoteDataSource _remoteDataSource;
  final INonRelationalDataSource _nonRelationalDataSource;

  const PerfilRepository(this._remoteDataSource, this._nonRelationalDataSource);

  @override
  Future<UserEntity> getUserDataAsync() async {
    final token = await _nonRelationalDataSource.loadString(DataBaseNoSqlSchemaHelper.kUserToken);
    debugPrint("tokenProfile: $token");
    final HttpResponseEntity httpResponse = (await _remoteDataSource.get(_urlUserInformation, token))!;
    debugPrint("testeProfile: ${httpResponse.data}");
    final usuario = UserEntity.fromMap(httpResponse.data as Map<String, dynamic>);
    debugPrint("usuario: $usuario");
    return usuario;
  }

  String get _urlUserInformation => _remoteDataSource.environment?.urlUserInformation ?? '';
} 