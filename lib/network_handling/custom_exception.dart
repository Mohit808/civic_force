class AppException implements Exception{
  final message;
  final prefix;
  AppException([this.message,this.prefix]);
  @override
  String toString() {
    // TODO: implement toString
    return "$prefix$message";
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]):super(message,"Error During communication: ");
}
class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,"");
}
class UnauthorizedException extends AppException{
  UnauthorizedException([String? message]):super(message,"Unauthorised: ");
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message,"Invalid Input: ");
}
class ExhaustException extends AppException{
  ExhaustException([String? message]):super(message,"");
}