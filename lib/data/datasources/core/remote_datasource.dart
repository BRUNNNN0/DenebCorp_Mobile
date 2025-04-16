
import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/core/http_response_entity.dart';
import 'package:i_pet/core/service/clock_helper.dart';
import 'package:i_pet/core/service/http_service.dart';

base class RemoteDataSource implements IRemoteDataSource {
  final IHttpService _http;
  final IEnvironmentHelper _environment;
  final IClockHelper _clockHelper;
  const RemoteDataSource(this._http, this._environment, this._clockHelper);

@override
Future<HttpResponseEntity> get(String url, [String? token]) async {
  try {
    // Prepare headers with the token if provided
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // Call the _http.get method with options containing the headers
    return await _http.get(
      url,
      headers: headers, // passing headers as part of the parameters
    );
  } catch (_) {
    rethrow;
  }
}

  @override
  Future<HttpResponseEntity?> post(String url, [String? data]) async {
    try {
      return await _http.post(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> put(String url, [String? data]) async {
    try {
      return await _http.put(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> patch(String url, [String? data]) async {
    try {
      return await _http.patch(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> delete(String url, [String? data]) async {
    try {
      return await _http.delete(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  IEnvironmentHelper get environment => _environment;

  @override
  DateTime get currentDateTime => _clockHelper.currentDateTime!;
}