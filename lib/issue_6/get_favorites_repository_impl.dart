import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/favorites_repository_impl.dart';
import 'package:flutter_study/issue_6/get_favorites_repository.dart';

class GetFavoritesRepositoryImpl implements GetFavoritesRepository {
  GetFavoritesRepositoryImpl(this._repository);

  final FavoritesRepositoryImpl _repository;

  @override
  Future<List<Article>> get() async {
    return _repository.getFavorites();
  }
}
