import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/core/service/IApp_Service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:i_pet/core/service/migrate_service.dart';
import 'package:i_pet/core/service/storage_service.dart';



final GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// #region EnvironmentHelper
  final IEnvironmentHelper environmentHelper = EnvironmentHelper();
  getIt.registerSingleton<IEnvironmentHelper>(environmentHelper);

  /// #region AppService
  getIt.registerSingleton<IAppService>(AppService(GlobalKey<NavigatorState>()));

  /// #region StorageService
  getIt.registerSingleton<IStorageService>(StorageService(MigrateService(), await SharedPreferences.getInstance()));
}
