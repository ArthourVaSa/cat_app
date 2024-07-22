import 'package:cat_app/src/domain/models/models.dart';
import 'package:cat_app/src/utils/utils.dart';

abstract class CatRepository {

  Future<DataState<List<CatEntity>>> getBreeds({
    required GetCatsRequest request,
  });

}