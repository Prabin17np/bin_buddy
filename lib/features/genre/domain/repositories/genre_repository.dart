import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/features/genre/domain/entities/genre_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getAllGenre();
  Future<Either<Failure, GenreEntity>> getGenreById(String genreId);
  Future<Either<Failure, bool>> createBatch(GenreEntity genre);
  Future<Either<Failure, bool>> updateBatch(GenreEntity genre);
  Future<Either<Failure, bool>> deleteBatch(String genreId);
}
