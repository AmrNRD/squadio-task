class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    if (_message == null) return _prefix ?? "";

    String _msg = _message?.replaceAll('\$', '\n')??"";
    _msg = _msg.replaceAll('"', '');
    _msg = _msg.trim();
    _msg = "\n$_msg";

    return "$_prefix $_msg";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class ServerErrorException extends AppException {
  ServerErrorException([String? message]) : super(message, "Please Try again later");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised");
}

class UnauthenticatedException extends AppException {
  UnauthenticatedException([String? message]) : super(message, "Unauthenticated");
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, "Request time out");
}

class UnprocessableEntityException extends AppException {
  final String message;
  final Map<dynamic, dynamic>? errors;

  UnprocessableEntityException(this.message, {this.errors}) : super(message, "Please fix the following errors: ");

  @override
  String toString() {
    String errorMessage = super.toString();

      errors?.forEach((key, error) {
        errorMessage += "\n $error";
      });

    return errorMessage;
  }
}

class BadRequestException extends UnprocessableEntityException {
  BadRequestException(String message, {Map<dynamic, dynamic>? errors}) : super(message, errors: errors);
}
