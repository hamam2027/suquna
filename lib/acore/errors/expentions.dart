import 'package:dio/dio.dart';
import 'package:suquna/acore/errors/error_model.dart';

//!ServerException
class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel);
}

//!CacheExeption
class CacheExeption implements Exception {
  final String errorMessage;
  CacheExeption({required this.errorMessage});
}

handleDioException(DioException e) {
  print(e.response!.statusCode!);
  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));

    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));

    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request

          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));

        case 401: //unauthorized
          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));

        case 403: //forbidden
          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));

        case 404: //not found
          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));

        case 409: //cofficient

          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));

        case 504: // Bad request

          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));
        case 422: // Bad request

          throw ServerException(ErrorModel(
              status: e.response!.statusCode,
              message: _getErrorMessage(e.response!.statusCode!)));
      }

    case DioExceptionType.cancel:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));

    case DioExceptionType.unknown:
      throw ServerException(ErrorModel(
          status: e.response!.statusCode,
          message: _getErrorMessage(e.response!.statusCode!)));
  }
}

String _getErrorMessage(int statusCode) {
  switch (statusCode) {
    case 422:
      return "هناك خطا في البريد الالكتروني او كلمة المرور";
    case 400:
      return "طلب غير صالح.";
    case 401:
      return "هناك خطا في البريد الالكتروني او كلمة المرور";
    case 403:
      return "ممنوع الوصول.";
    case 404:
      return "المورد غير موجود.";
    case 409:
      return "تعارض في الطلب.";
    case 504:
      return "انتهت مهلة الخادم.";
    default:
      return "خطأ غير معروف في الاستجابة.";
  }
}
