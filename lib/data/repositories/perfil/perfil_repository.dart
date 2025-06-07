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
  final IRemoteFireSource _remoteFireSource;
  final INonRelationalDataSource _nonRelationalDataSource;

  const PerfilRepository(this._remoteFireSource, this._nonRelationalDataSource);

  @override
  Future<UserEntity> getUserDataAsync() async {
    final token = await _nonRelationalDataSource.loadString(DataBaseNoSqlSchemaHelper.kUserToken);
    
    try{
      final usuario = (await _remoteFireSource.getUserInfo(token))!;
      final usuarioMAP = UserEntity.fromMap(usuario as Map<String, dynamic>);
    
      return usuarioMAP;
    } on ILoginException catch (e) {
    rethrow;
   }
  } 
}