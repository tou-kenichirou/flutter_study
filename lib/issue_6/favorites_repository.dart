import 'package:flutter_study/issue_6/article.dart';

abstract class FavoritesRepository {
  Future<List<Article>> getFavorites() {
    throw UnimplementedError();
  }

  Future<void> addFavorite(Article article) {
    throw UnimplementedError();
  }

  Future<void> removeFavorite(Article article) {
    throw UnimplementedError();
  }
}
