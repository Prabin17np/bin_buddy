import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/core/usecases/app_usecases.dart';
import 'package:bin_buddy/features/auth/data/repositories/auth_repository.dart';
import 'package:bin_buddy/features/auth/domain/entities/auth_entity.dart';
import 'package:bin_buddy/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider
final getCurrentUserUsecaseProvider = Provider<GetCurrentUserUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GetCurrentUserUsecase(authRepository: authRepository);
});

class GetCurrentUserUsecase implements UsecaseWithoutParms<AuthEntity> {
  final IAuthRepository _authRepository;

  GetCurrentUserUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  // ignore: override_on_non_overriding_member
  Future<Either<Failure, AuthEntity>> call() {
    return _authRepository.getCurrentUser();
  }
}
