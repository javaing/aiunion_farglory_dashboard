import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  static final baseUrl = "http://192.168.0.109";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> _request(String path, {required String method}) async {
    Response response;
    try {
      response = await _dio.request(path, options: Options(method: method));
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> get(String path) async {
    return _request(path, method: 'get');
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
  }
}