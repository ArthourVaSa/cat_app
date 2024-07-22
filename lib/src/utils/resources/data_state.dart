import 'dart:math';

import 'package:dio/dio.dart';

abstract class DataState<T> {

  final T? data;
  final DioException? error;
  final Exception? exception;

  const DataState({
    this.data,
    this.error,
    this.exception,
  });

}

class DataSuccess<T> extends DataState<T> {

  const DataSuccess(T data) : super(data: data);

}

class DataAPiError<T> extends DataState<T> {

  const DataAPiError(DioException error) : super(error: error);

}

class DataExternalServiceError<T> extends DataState<T> {

  const DataExternalServiceError(Exception exception) : super(exception: exception);

}