import 'package:equatable/equatable.dart';

/// Base abstract Failure class
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Local database failure
class LocalDataBaseFailure extends Failure {
  const LocalDataBaseFailure({
    String message = 'Local database operation failed',
  }) : super(message);
}

/// API failure with optional status code
class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({required String message, this.statusCode}) : super(message);

  @override
  List<Object?> get props => [message, statusCode];
}
