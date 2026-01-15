import 'package:bin_buddy/core/services/hive/hive_service.dart';
import 'package:bin_buddy/features/genre/data/datasources/genre_datasource.dart';
import 'package:bin_buddy/features/genre/data/models/genre_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreLocalDatasourceProvider = Provider<IGenreLocalDatasource>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return GenreLocalDatasource(hiveService: hiveService);
});

class GenreLocalDatasource implements IGenreLocalDatasource {
  final HiveService _hiveService;

  GenreLocalDatasource({required HiveService hiveService})
    : _hiveService = hiveService;

  @override
  Future<bool> createGenre(GenreHiveModel genre) async {
    try {
      await _hiveService.createGenre(genre);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteGenre(String genreId) async {
    try {
      await _hiveService.deleteGenre(genreId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<GenreHiveModel>> getAllGenre() async {
    try {
      return _hiveService.getAllGenre();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<GenreHiveModel?> getGenreById(String genreId) async {
    try {
      return _hiveService.getGenreById(genreId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> updateGenre(GenreHiveModel genre) async {
    try {
      await _hiveService.updateGenre(genre);
      return true;
    } catch (e) {
      return false;
    }
  }
}
