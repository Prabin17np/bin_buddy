import 'package:bin_buddy/features/genre/data/models/genre_api_model.dart';
import 'package:bin_buddy/features/genre/data/models/genre_hive_model.dart';

abstract interface class IGenreLocalDatasource {
  Future<List<GenreHiveModel>> getAllGenre();
  Future<GenreHiveModel?> getGenreById(String genreId);
  Future<bool> createGenre(GenreHiveModel genre);
  Future<bool> updateGenre(GenreHiveModel genre);
  Future<bool> deleteGenre(String genreId);
}

abstract interface class IGenreRemoteDatasource {
  Future<List<GenreApiModel>> getAllGenre();
  Future<GenreApiModel?> getGenreById(String genreId);
  Future<bool> createGenre(GenreApiModel genre);
  Future<bool> updateGenre(GenreApiModel genre);
}
