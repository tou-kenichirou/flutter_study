import 'package:flutter_study/issue_6/app_exception.dart';
import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/favorites_repository_impl.dart';
import 'package:flutter_study/issue_6/post_favorites_repository.dart';

class PostFavoritesRepositoryImpl implements PostFavoritesRepository {
  PostFavoritesRepositoryImpl(this._repository);

  final FavoritesRepositoryImpl _repository;

  @override
  Future<void> post(Article article) async {
    try {
      await _repository.addFavorite(article);
    } on AlreadyExistsException {
      rethrow;
    }
  }
}
