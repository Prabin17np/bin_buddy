import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/core/usecases/app_usecases.dart';
import 'package:bin_buddy/features/auth/data/repositories/auth_repository.dart';
import 'package:bin_buddy/features/auth/domain/entities/auth_entity.dart';
import 'package:bin_buddy/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterUsecase(authRepository: authRepository);
});

class RegisterUsecaseParams extends Equatable {
  final String fullName;
  final String email;
  final String username;
  final String password;

  const RegisterUsecaseParams({
    required this.fullName,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [fullName, email, username, password];
}

class RegisterUsecase implements UsecaseWithParms<bool, RegisterUsecaseParams> {
  final IAuthRepository _authRepository;

  RegisterUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call(RegisterUsecaseParams params) {
    final entity = AuthEntity(
      fullName: params.fullName,
      email: params.email,
      username: params.username,
      password: params.password,
    );
    return _authRepository.register(entity);
  }
}
