import 'package:flutter_study/issue_6/article.dart';

abstract class PostFavoritesRepository {
  Future<void> post(Article article) {
    throw UnimplementedError();
  }
}
