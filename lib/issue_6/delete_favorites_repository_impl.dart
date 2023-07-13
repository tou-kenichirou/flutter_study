import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/delete_favorites_repository.dart';
import 'package:flutter_study/issue_6/favorites_repository_impl.dart';

class DeleteFavoritesRepositoryImpl implements DeleteFavoritesRepository {
  DeleteFavoritesRepositoryImpl(this._repository);

  final FavoritesRepositoryImpl _repository;

  @override
  Future<void> delete(Article article) async {
    await _repository.removeFavorite(article);
  }
}
