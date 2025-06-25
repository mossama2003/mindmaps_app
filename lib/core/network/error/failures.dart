import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = 'An error occurred']);

  @override
  List<Object> get props => [message];
}

class NoInternetConnection extends Failure {
  const NoInternetConnection([super.message = 'No Internet Connection']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server Error']);

  factory ServerFailure.fromStatusCode(int? code) {
    switch (code) {
      case 400:
        return ServerFailure('failure.code.400'.tr());
      case 401:
        return ServerFailure('failure.code.401'.tr());
      case 403:
        return ServerFailure('failure.code.403'.tr());
      case 404:
        return ServerFailure('failure.code.404'.tr());
      case 500:
        return ServerFailure('failure.code.500'.tr());
      default:
        return ServerFailure('failure.code.default'.tr());
    }
  }

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('failure.dio.connection_error'.tr());
      case DioExceptionType.connectionTimeout:
        return ServerFailure('failure.dio.connection_timeout'.tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure('failure.dio.send_timeout'.tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure('failure.dio.receive_timeout'.tr());
      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailure.fromResponse(dioError.response!);
        } else {
          return ServerFailure('failure.dio.ops_error'.tr());
        }
      case DioExceptionType.cancel:
        return ServerFailure('failure.dio.request_canceled'.tr());
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure('failure.no_internet'.tr());
        }
        return ServerFailure('failure.dio.unexpected_error'.tr());
      default:
        return ServerFailure('failure.dio.ops_error'.tr());
    }
  }

  factory ServerFailure.fromCatchError(dynamic e) {
    if (e is SocketException) {
      return ServerFailure('failure.no_internet'.tr());
    } else if (e is DioException) {
      return ServerFailure.fromDioError(e);
    } else {
      return ServerFailure('failure.unexpected_error'.tr());
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      final meta = data['meta'];
      final dataMessage = data['data']?['message'];
      final metaErrors = meta?['errors'];
      if (meta is Map<String, dynamic> && meta.containsKey('code')) {
        final code = meta['code'];
        if (metaErrors is List && metaErrors.isNotEmpty) {
          return ServerFailure(metaErrors.first.toString());
        }
        if (dataMessage != null) {
          return ServerFailure(dataMessage.toString());
        }
        return ServerFailure.fromStatusCode(code);
      }
      if (dataMessage != null) {
        return ServerFailure(dataMessage.toString());
      } else if (data['error'] != null) {
        return ServerFailure(data['error'].toString());
      }
    }
    return ServerFailure.fromStatusCode(response.statusCode);
  }
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache Error']);
}
