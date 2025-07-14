import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          'Connection timed out. Please check your internet connection.',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send request timed out. Please try again.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          'Receiving data timed out. Please try again later.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          'Could not verify server identity (bad certificate).',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          statusCode: dioException.response?.statusCode,
          responseData: dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled. Please try again.');

      case DioExceptionType.connectionError:
        return ServerFailure(
          'Connection failed. Please check your network or try again later.',
        );

      case DioExceptionType.unknown:
        // Check if it's a SocketException (common for no internet)
        if (dioException.error is SocketException) {
          return ServerFailure(
            'No internet connection. Please connect and try again.',
          );
        }
        return ServerFailure(
          dioException.message ?? 'An unexpected error occurred.',
        );
    }
  }

  factory ServerFailure.fromBadResponse({
    required int? statusCode,
    required dynamic responseData,
  }) {
    String message;

    // Step 1: Default message based on status code
    if (statusCode == null) {
      message = 'An unexpected error occurred. Please try again later.';
    } else if (statusCode >= 500) {
      message = 'Something went wrong on our end. Please try again later.';
    } else if (statusCode == 404) {
      message = 'The requested resource was not found.';
    } else if (statusCode == 401) {
      message = 'You need to log in to continue.';
    } else if (statusCode == 403) {
      message = 'You don’t have permission to access this.';
    } else if (statusCode == 400) {
      message =
          'There was a problem with your request. Please check and try again.';
    } else {
      message = 'Something went wrong. Please try again.';
    }

    // Step 2: Override if API returns a specific message
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('message')) {
        final apiMessage = responseData['message'].toString().trim();
        if (apiMessage.isNotEmpty) message = apiMessage;
      } else if (responseData.containsKey('error')) {
        final apiError = responseData['error'].toString().trim();
        if (apiError.isNotEmpty) message = apiError;
      }
    } else if (responseData is String) {
      final raw = responseData.trim();
      if (raw.isNotEmpty) message = raw;
    }

    return ServerFailure(message);
  }
}
