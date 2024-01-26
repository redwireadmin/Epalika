class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimedOut extends AppExceptions {
  RequestTimedOut([String? message]) : super(message, 'Request Timed Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal Server error');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error while communicating with server');
}
