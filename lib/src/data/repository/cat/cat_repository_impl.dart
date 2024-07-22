import 'package:cat_app/src/data/datasource/datasource.dart';
import 'package:cat_app/src/data/repository/base/base_api_repository.dart';
import 'package:cat_app/src/domain/models/models.dart';
import 'package:cat_app/src/domain/repository/repository.dart';
import 'package:cat_app/src/utils/resources/data_state.dart';

class CatRepositoryImpl extends BaseApiRepository implements CatRepository {
  final CatsApiService _catsApiService;

  CatRepositoryImpl({
    required CatsApiService catsApiService,
  }) : _catsApiService = catsApiService;

  @override
  Future<DataState<List<CatEntity>>> getBreeds(
      {required GetCatsRequest request}) {
    return getStateOf(
      request: () => _catsApiService.getBreeds(),
    );
  }
}
