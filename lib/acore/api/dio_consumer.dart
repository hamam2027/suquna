import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:suquna/acore/api/api_consumer.dart';
import 'package:suquna/acore/errors/expentions.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    // dio.options.baseUrl = ApiLinks.base;
  }

//!POST
  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, String>? headers,
  }) async {
    if (await checkConnection()) {
      try {
        final res = await dio.post(
          options: Options(headers: headers),
          path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        );
        print(res.data);
        return res.data;
      } on DioException catch (e) {
        print(e.type);

        print("dio exeption");
        handleDioException(e);
      }
    } else {
      showToust(
          message: "لا يوجداتصال بالانترنت",
          textcolor: AppColors.whiteClr,
          backgroundclr: Colors.red);
    }
  }

//!GET
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      print(res.data);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var res = await dio.delete(
        options: Options(headers: headers),
        path,
        data: data,
        queryParameters: queryParameters,
      );
      print(res.data);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, String>? headers,
  }) async {
    try {
      var res = await dio.patch(
        options: Options(headers: headers),
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
