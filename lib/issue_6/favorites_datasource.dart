import 'dart:io';
import 'package:flutter_study/issue_6/article.dart';

abstract class FavoritesDatasource {
  Future<File> getFavoritesFile() {
    throw UnimplementedError();
  }

  Future<void> saveFavoritesFile(List<Article> favorites) {
    throw UnimplementedError();
  }
}
