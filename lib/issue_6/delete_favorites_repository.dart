import 'package:flutter_study/issue_6/article.dart';

abstract class DeleteFavoritesRepository {
  Future<void> delete(Article article) {
    throw UnimplementedError();
  }
}
