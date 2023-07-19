import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study/issue_6/app_exception.dart';
import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/favorites_datasource_impl.dart';
import 'package:flutter_study/issue_6/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl(this.datasource);

  final FavoritesDatasourceImpl datasource;

  @override
  Future<List<Article>> getFavorites() async {
    final file = await datasource.getFavoritesFile();
    debugPrint('file: $file');
    final jsonString = await file.readAsString();
    debugPrint('jsonString: $jsonString');
    if (jsonString.isNotEmpty) {
      final jsonList = json.decode(jsonString) as List<dynamic>;
      final favorites = jsonList
          .map((json) => Article.fromJson(json as Map<String, dynamic>))
          .toList();
      return favorites;
    }
    return [];
  }

  @override
  Future<void> addFavorite(Article article) async {
    final favorites = await getFavorites();
    if (favorites.contains(article)) {
      throw AlreadyExistsException();
    }
    favorites.add(article);
    await datasource.saveFavoritesFile(favorites);
  }

  @override
  Future<void> removeFavorite(Article article) async {
    final favorites = await getFavorites();
    favorites.removeWhere((fav) => fav.url == article.url);
    await datasource.saveFavoritesFile(favorites);
  }
}
