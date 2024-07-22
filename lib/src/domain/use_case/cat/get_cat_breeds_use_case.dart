import 'dart:developer';

import 'package:cat_app/src/domain/errors/cat/cat_errors.dart';
import 'package:cat_app/src/domain/models/models.dart';
import 'package:cat_app/src/domain/repository/repository.dart';
import 'package:cat_app/src/utils/utils.dart';

class GetCatBreedsUseCase {
  final CatRepository _catRepository;

  GetCatBreedsUseCase({
    required CatRepository catRepository,
  }) : _catRepository = catRepository;

  Future<Either<CatErrors, List<CatEntity>>> call() async {
    try {
      final response = await _catRepository.getBreeds(
        request: GetCatsRequest(
          limit: 10,
          page: 0,
        ),
      );

      if (response is DataAPiError) {
        throw CatApiError(
          error: "Ha ocurrido un error al traer las razas de los gatitos. Por favor, intenta de nuevo.",
          code: response.error!.response!.statusCode.toString(),
          description: response.error!.message.toString(),
        );
      } 

      return Right(response.data!);

    } on CatErrors catch (e) {
      return Left(e);
    } catch (e) {

      log(e.toString());

      return Left(
        CatUnknownError(
          error: "Ha ocurrido un error desconocido.",
          code: "UNKNOWN_ERROR",
          description: e.toString(),
        ),
      );
    }
  }
}
