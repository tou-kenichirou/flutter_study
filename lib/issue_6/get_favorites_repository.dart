import 'package:flutter_study/issue_6/article.dart';

abstract class GetFavoritesRepository {
  Future<List<Article>> get() {
    throw UnimplementedError();
  }
}
