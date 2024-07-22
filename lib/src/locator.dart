import 'package:cat_app/src/domain/use_case/use_cases.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:cat_app/src/data/datasource/remote/api/cats_api_service.dart';
import 'package:cat_app/src/data/repository/repository_impl.dart';
import 'package:cat_app/src/domain/repository/repository.dart';
import 'package:cat_app/src/utils/utils.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Remote Configuration Dependencies Injection
  final Dio dio = Dio();
  dio.interceptors.add(MyInterceptor(
    dio: dio,
  ));
  dio.options.baseUrl = AppConstants.apiUrl;

  locator.registerSingleton<Dio>(dio);

  // Remote Data Sources Dependencies Injection
  locator.registerSingleton<CatsApiService>(
    CatsApiService(
      dio,
    ),
  );

  // Remote Repository Dependencies Injection
  locator.registerSingleton<CatRepository>(
    CatRepositoryImpl(
      catsApiService: locator<CatsApiService>(),
    ),
  );

  // Domain Use Cases Dependencies Injection
  locator.registerSingleton<GetCatBreedsUseCase>(
    GetCatBreedsUseCase(
      catRepository: locator<CatRepository>(),
    ),
  );
}
