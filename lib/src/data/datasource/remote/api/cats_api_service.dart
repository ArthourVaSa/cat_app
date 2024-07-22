import 'package:cat_app/src/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cats_api_service.g.dart';

@RestApi(parser: Parser.MapSerializable)
abstract class CatsApiService {
  factory CatsApiService(Dio dio) = _CatsApiService;

  @GET('breeds')
  Future<HttpResponse<List<CatEntity>>> getBreeds();

}
