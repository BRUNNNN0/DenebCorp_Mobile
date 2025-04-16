import 'package:flutter/material.dart';

export 'package:flutter/material.dart';
export 'package:i_pet/configs/environment_helper.dart';
export 'package:i_pet/configs/injection_container.dart';
export 'package:i_pet/data/datasources/core/data_source.dart';
export 'package:i_pet/data/datasources/core/non_relational_datasource.dart';
export 'package:i_pet/data/datasources/core/relational_datasource.dart';
export 'package:i_pet/core/service/IApp_Service.dart';
export 'package:i_pet/core/service/clock_helper.dart';
export 'package:i_pet/core/service/storage_service.dart';

abstract interface class IFactoryViewModel<T> {
  T create(BuildContext context);
  void dispose(BuildContext context, T viewModel);
}