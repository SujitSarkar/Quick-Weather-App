part of 'remote_imports.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;
  Options options = Options();

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiEndpointUrl.baseUrl);
    dio = Dio(baseOptions);
    options = Options(headers: {'Content-Type': 'application/json'});
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    await _checkInternetConnection();
    try {
      final Response response = await dio.get(path,
          queryParameters: queryParameters, options: options);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (error) {
      throw ApiException(message: '$error', statusCode: null);
    }
  }

  Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    await _checkInternetConnection();
    try {
      final Response response = await dio.post(path,
          data: body != null ? jsonEncode(body) : body, options: options);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (error) {
      throw ApiException(message: '$error', statusCode: null);
    }
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    await _checkInternetConnection();
    try {
      final Response response = await dio.put(path,
          data: body != null ? jsonEncode(body) : body, options: options);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (error) {
      throw ApiException(message: '$error', statusCode: null);
    }
  }

  Future<Response> patchRequest({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      throw ApiException(message: 'No internet connection', statusCode: null);
    }
    try {
      final Response response = await dio.patch(path,
          data: body != null ? jsonEncode(body) : body, options: options);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (error) {
      throw ApiException(message: '$error', statusCode: null);
    }
  }

  Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    await _checkInternetConnection();
    try {
      final Response response = await dio.delete(path,
          data: body != null ? jsonEncode(body) : body, options: options);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (error) {
      throw ApiException(message: '$error', statusCode: null);
    }
  }

  void logResponse(Response response) {
    debugPrint('URL             : ${response.requestOptions.uri}');
    debugPrint('STATUS CODE     : ${response.statusCode}');
    debugPrint('RESPONSE        : ${response.data}\n');
  }

  Future<ApiException?> _checkInternetConnection() async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      throw ApiException(message: 'No internet connection', statusCode: null);
    }
    return null;
  }

  Response _processResponse(Response response) {
    // hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    logResponse(response);
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 300) {
      return response;
    } else {
      throw ApiException(
          message: response.statusMessage, statusCode: response.statusCode);
    }
  }

  ApiException _handleDioException(DioException e) {
    // hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (e.response != null) {
      logResponse(e.response!);
      switch (e.response?.statusCode) {
        case 401:
          sessionExpiredAction();
          throw ApiException(
              message: 'Token expired', statusCode: e.response?.statusCode);
        case 404:
          throw ApiException(
              message: e.response?.data['message'],
              statusCode: e.response?.statusCode);
        default:
          throw ApiException(
              message: e.response?.data['message'],
              statusCode: e.response?.data['cod']);
      }
    } else {
      throw ApiException(
          message: e.message, statusCode: e.response?.statusCode);
    }
  }

  void sessionExpiredAction() async {
    // AuthService.instance.logout();
  }
}
