import 'package:equatable/equatable.dart';

/// Base Failure class for error handling across the application
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Failure related to local cache / SharedPreferences operations
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache Failure']);
}
