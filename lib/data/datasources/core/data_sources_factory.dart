import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/configs/injection_container.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/data/datasources/core/relational_datasource.dart';
import 'package:i_pet/data/datasources/core/non_relational_datasource.dart';
import 'package:i_pet/data/datasources/core/remote_datasource.dart';
import 'package:i_pet/core/service/clock_helper.dart';
import 'package:i_pet/core/service/http_service.dart';
import 'package:i_pet/core/service/storage_service.dart';
import 'package:i_pet/data/datasources/core/remote_firesource.dart';




final class NonRelationalFactoryDataSource {
  INonRelationalDataSource create() {
    final IStorageService storageService = getIt<IStorageService>();
    final IClockHelper clockHelper = ClockHelper();

    return NonRelationalDataSource(
      storageService,
      clockHelper,
    );
  }
}

final class RelationalFactoryDataSource {
  IRelationalDataSource create() {
    final IStorageService storageService = getIt<IStorageService>();
    final IClockHelper clockHelper = ClockHelper();

    return RelationalDataSource(
      storageService, 
      clockHelper,
    );
  }
}

final class RemoteFactoryDataSource {
  IRemoteDataSource create() {
    final IHttpService httpService = HttpServiceFactory().create();
    final IEnvironmentHelper environmentHelper = getIt<IEnvironmentHelper>();
    final IClockHelper clockHelper = ClockHelper();
    return RemoteDataSource(
      httpService, 
      environmentHelper, 
      clockHelper,
    );
  }
}

final class RemoteFactoryFireSource{
  IRemoteFireSource create() {
    final IEnvironmentHelper environmentHelper = getIt<IEnvironmentHelper>();  
    
    return RemoteFiresource(
      environmentHelper,
    );
  }
    
}