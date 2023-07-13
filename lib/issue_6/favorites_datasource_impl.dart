import 'dart:convert';
import 'dart:io';
import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/favorites_datasource.dart';
import 'package:path_provider/path_provider.dart';

class FavoritesDatasourceImpl implements FavoritesDatasource {
  static const String _favoritesFileName = 'favorites.json';

  @override
  Future<File> getFavoritesFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_favoritesFileName').create();
  }

  @override
  Future<void> saveFavoritesFile(List<Article> favorites) async {
    final file = await getFavoritesFile();
    final jsonString = json.encode(favorites);
    await file.writeAsString(jsonString);
  }
}
