import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/core/usecases/app_usecases.dart';
import 'package:bin_buddy/features/genre/data/repositories/genre_repository.dart';
import 'package:bin_buddy/features/genre/domain/entities/genre_entity.dart';
import 'package:bin_buddy/features/genre/domain/repositories/genre_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// NOTE: Dependency Injection using Provider
final getAllGenreUsecaseProvider = Provider<GetAllGenreUsecase>((ref) {
  return GetAllGenreUsecase(genreRepository: ref.read(genreRepositoryProvider));
});

class GetAllGenreUsecase implements UsecaseWithoutParms<List<GenreEntity>> {
  final IGenreRepository _genreRepository;

  GetAllGenreUsecase({required IGenreRepository genreRepository})
    : _genreRepository = genreRepository;

  @override
  Future<Either<Failure, List<GenreEntity>>> call() {
    return _genreRepository.getAllGenre();
  }
}
