sealed class CatErrors implements Exception {
  CatErrors({
    this.error,
    this.code,
    this.description,
  });

  String? error;
  String? code;
  String? description;
}

class CatApiError extends CatErrors {
  CatApiError({
    required String error,
    required String code,
    required String description,
  }) : super(
          error: error,
          code: code,
          description: description,
        );
}

class CatUnknownError extends CatErrors {
  CatUnknownError({
    required String error,
    required String code,
    required String description,
  }) : super(
          error: error,
          code: code,
          description: description,
        );
}