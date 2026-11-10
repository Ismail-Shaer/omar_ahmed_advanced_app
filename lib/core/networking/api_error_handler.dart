import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

// Keep existing names for backward compatibility.
// ignore_for_file: constant_identifier_names

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  CONFLICT,
  API_LOGIC_ERROR,
  TOO_MANY_REQUESTS,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  TRANSFORM_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  BAD_CERTIFICATE,
  DEFAULT,
}

abstract final class ResponseCode {
  // HTTP success codes
  static const int SUCCESS = 200;
  static const int CREATED = 201;
  static const int NO_CONTENT = 204;

  // HTTP client errors
  static const int BAD_REQUEST = 400;
  static const int UNAUTORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int CONFLICT = 409;
  static const int API_LOGIC_ERROR = 422;
  static const int TOO_MANY_REQUESTS = 429;

  // HTTP server errors
  static const int INTERNAL_SERVER_ERROR = 500;

  // Local error codes
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int BAD_CERTIFICATE = -8;
  static const int TRANSFORM_TIMEOUT = -9;
}

abstract final class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String NOT_FOUND = ApiErrors.notFoundError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;

  static const String CONFLICT =
      'The requested operation conflicts with existing data.';

  static const String API_LOGIC_ERROR = ApiErrors.badRequestError;

  static const String TOO_MANY_REQUESTS =
      'Too many requests. Please try again later.';

  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String TRANSFORM_TIMEOUT = ApiErrors.timeoutError;

  static const String CANCEL = ApiErrors.defaultError;
  static const String CACHE_ERROR = ApiErrors.cacheError;

  static const String NO_INTERNET_CONNECTION =
      'Unable to connect to the server. Check your connection.';

  static const String BAD_CERTIFICATE =
      'Unable to establish a secure connection.';

  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    return switch (this) {
      DataSource.NO_CONTENT => ApiErrorModel(
        code: ResponseCode.NO_CONTENT,
        message: ResponseMessage.NO_CONTENT,
      ),
      DataSource.BAD_REQUEST => ApiErrorModel(
        code: ResponseCode.BAD_REQUEST,
        message: ResponseMessage.BAD_REQUEST,
      ),
      DataSource.FORBIDDEN => ApiErrorModel(
        code: ResponseCode.FORBIDDEN,
        message: ResponseMessage.FORBIDDEN,
      ),
      DataSource.UNAUTORISED => ApiErrorModel(
        code: ResponseCode.UNAUTORISED,
        message: ResponseMessage.UNAUTORISED,
      ),
      DataSource.NOT_FOUND => ApiErrorModel(
        code: ResponseCode.NOT_FOUND,
        message: ResponseMessage.NOT_FOUND,
      ),
      DataSource.CONFLICT => ApiErrorModel(
        code: ResponseCode.CONFLICT,
        message: ResponseMessage.CONFLICT,
      ),
      DataSource.API_LOGIC_ERROR => ApiErrorModel(
        code: ResponseCode.API_LOGIC_ERROR,
        message: ResponseMessage.API_LOGIC_ERROR,
      ),
      DataSource.TOO_MANY_REQUESTS => ApiErrorModel(
        code: ResponseCode.TOO_MANY_REQUESTS,
        message: ResponseMessage.TOO_MANY_REQUESTS,
      ),
      DataSource.INTERNAL_SERVER_ERROR => ApiErrorModel(
        code: ResponseCode.INTERNAL_SERVER_ERROR,
        message: ResponseMessage.INTERNAL_SERVER_ERROR,
      ),
      DataSource.CONNECT_TIMEOUT => ApiErrorModel(
        code: ResponseCode.CONNECT_TIMEOUT,
        message: ResponseMessage.CONNECT_TIMEOUT,
      ),
      DataSource.CANCEL => ApiErrorModel(
        code: ResponseCode.CANCEL,
        message: ResponseMessage.CANCEL,
      ),
      DataSource.RECIEVE_TIMEOUT => ApiErrorModel(
        code: ResponseCode.RECIEVE_TIMEOUT,
        message: ResponseMessage.RECIEVE_TIMEOUT,
      ),
      DataSource.SEND_TIMEOUT => ApiErrorModel(
        code: ResponseCode.SEND_TIMEOUT,
        message: ResponseMessage.SEND_TIMEOUT,
      ),
      DataSource.TRANSFORM_TIMEOUT => ApiErrorModel(
        code: ResponseCode.TRANSFORM_TIMEOUT,
        message: ResponseMessage.TRANSFORM_TIMEOUT,
      ),
      DataSource.CACHE_ERROR => ApiErrorModel(
        code: ResponseCode.CACHE_ERROR,
        message: ResponseMessage.CACHE_ERROR,
      ),
      DataSource.NO_INTERNET_CONNECTION => ApiErrorModel(
        code: ResponseCode.NO_INTERNET_CONNECTION,
        message: ResponseMessage.NO_INTERNET_CONNECTION,
      ),
      DataSource.BAD_CERTIFICATE => ApiErrorModel(
        code: ResponseCode.BAD_CERTIFICATE,
        message: ResponseMessage.BAD_CERTIFICATE,
      ),
      DataSource.DEFAULT => ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: ResponseMessage.DEFAULT,
      ),
    };
  }
}

class ErrorHandler implements Exception {
  final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(Object? error) : apiErrorModel = _mapError(error);

  static ApiErrorModel _mapError(Object? error) {
    if (error is ErrorHandler) {
      return error.apiErrorModel;
    }

    if (error is DioException) {
      return _handleDioException(error);
    }

    return DataSource.DEFAULT.getFailure();
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();

      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();

      case DioExceptionType.transformTimeout:
        return DataSource.TRANSFORM_TIMEOUT.getFailure();

      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();

      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();

      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE.getFailure();

      case DioExceptionType.badResponse:
        return _handleHttpResponse(error.response);

      case DioExceptionType.unknown:
        if (error.response != null) {
          return _handleHttpResponse(error.response);
        }

        return DataSource.DEFAULT.getFailure();
    }
  }

  static ApiErrorModel _handleHttpResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;

    if (statusCode == null) {
      return DataSource.DEFAULT.getFailure();
    }

    // This handler is intended for HTTP failures.
    if (statusCode < 400) {
      return DataSource.DEFAULT.getFailure();
    }

    final fallbackMessage = _getStatusMessage(statusCode);

    // Allow API validation messages for 4xx errors.
    // Do not expose raw server messages for 5xx errors.
    final serverMessage =
        statusCode < 500 ? _extractServerMessage(response?.data) : null;

    return ApiErrorModel(
      code: statusCode,
      message: serverMessage ?? fallbackMessage,
    );
  }

  static String _getStatusMessage(int statusCode) {
    return switch (statusCode) {
      400 => ResponseMessage.BAD_REQUEST,
      401 => ResponseMessage.UNAUTORISED,
      403 => ResponseMessage.FORBIDDEN,
      404 => ResponseMessage.NOT_FOUND,
      408 => ResponseMessage.RECIEVE_TIMEOUT,
      409 => ResponseMessage.CONFLICT,
      422 => ResponseMessage.API_LOGIC_ERROR,
      429 => ResponseMessage.TOO_MANY_REQUESTS,
      >= 500 => ResponseMessage.INTERNAL_SERVER_ERROR,
      _ => ResponseMessage.DEFAULT,
    };
  }

  static String? _extractServerMessage(dynamic data) {
    if (data is! Map) {
      return null;
    }

    // Common API response:
    // {"message": "Invalid credentials"}
    for (final key in ['message', 'error', 'detail']) {
      final value = data[key];

      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }

    // Common validation response:
    // {"errors": {"email": ["Email is required"]}}
    final errors = data['errors'];

    if (errors is Map) {
      for (final value in errors.values) {
        if (value is String && value.trim().isNotEmpty) {
          return value.trim();
        }

        if (value is List && value.isNotEmpty) {
          final first = value.first;

          if (first is String && first.trim().isNotEmpty) {
            return first.trim();
          }
        }
      }
    }

    // FastAPI-style validation response.
    final detail = data['detail'];

    if (detail is List) {
      for (final item in detail) {
        if (item is Map) {
          final message = item['msg'];

          if (message is String && message.trim().isNotEmpty) {
            return message.trim();
          }
        }
      }
    }

    return null;
  }
}

abstract final class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
