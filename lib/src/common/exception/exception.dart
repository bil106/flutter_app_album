class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

// parent for all 4xx response exceptions
class ClientException extends AppException {
  ClientException(String message, String prefix) : super(message, prefix);
}

// 404 response
class NotFoundException extends ClientException {
  NotFoundException([message]) : super(message, 'Not found: ');
}

// 401 response
class UnauthorisedException extends ClientException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

// parent for all 5xx response exceptions
class ServerException extends AppException {
  ServerException.withoutPrefix(String message) : super(message, '');
  ServerException(String message) : super(message, 'Internal server error: ');
}

// network problem
class NetworkException extends AppException {
  NetworkException(String message) : super(message, 'Network error: ');
}
