abstract class BaseException implements Exception {
  final String? message;
  final String? code;

  BaseException({this.message, this.code});

  @override
  String toString() {
    return 'Code: $code, Message: $message';
  }
}

class AuthException extends BaseException {
  AuthException({String? message, String? code}) : super(message: message);
}

class ServerRouteException extends BaseException {
  ServerRouteException([String? message]) : super(message: message);
}

class NoInternetException extends BaseException {
  NoInternetException([String? message]) : super(message: message);
}

class CacheException extends BaseException {
  CacheException([String? message]) : super(message: message);
}
