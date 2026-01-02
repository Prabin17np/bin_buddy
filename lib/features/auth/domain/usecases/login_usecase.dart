import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/core/usecases/app_usecases.dart';
import 'package:bin_buddy/features/auth/domain/repositories/auth_repository.dart';
import 'package:bin_buddy/features/auth/domain/entities/auth_entity.dart';
import 'package:vedaverse/features/auth/domain/repositories/auth_repository.dart';

// Provider
final loginUseCaseProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginUsecase(authRepository: authRepository);
});

class LoginUsecaseParams extends Equatable {
  final String email;
  final String password;

  const LoginUsecaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginUsecase
    implements UseCaseWithParams<AuthEntity, LoginUsecaseParams> {
  final IAuthRepository _authRepository;

  LoginUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(LoginUsecaseParams params) {
    return _authRepository.login(params.email, params.password);
  }
}
