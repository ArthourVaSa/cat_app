import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:cat_app/src/utils/utils.dart';
import 'package:dio/dio.dart';

class MyInterceptor extends AwesomeDioInterceptor {
  final Dio _dio;

  MyInterceptor({
    required Dio dio,
  }) : _dio = dio;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['x-api-key'] = AppConstants.apiKey;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
