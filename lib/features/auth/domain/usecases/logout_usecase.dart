import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/core/usecases/app_usecases.dart';
import 'package:bin_buddy/features/auth/data/repositories/auth_repository.dart';
import 'package:bin_buddy/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LogoutUsecase(authRepository: authRepository);
});

class LogoutUsecase implements UsecaseWithoutParms<bool> {
  final IAuthRepository _authRepository;

  LogoutUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  // ignore: override_on_non_overriding_member
  Future<Either<Failure, bool>> call() {
    return _authRepository.logout();
  }
}
