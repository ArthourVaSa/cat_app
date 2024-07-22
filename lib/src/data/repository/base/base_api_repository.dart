// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io' show HttpStatus;

import 'package:cat_app/src/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {

  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok || httpResponse.response.statusCode == HttpStatus.created) {
        log(httpResponse.data.toString());
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      return DataAPiError(error);
    }
  }

}