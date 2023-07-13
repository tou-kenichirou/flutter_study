import 'package:flutter_study/issue_6/news_api_datasource.dart';
import 'package:flutter_study/issue_6/news_update_repository.dart';
import 'package:flutter_study/issue_6/news_update_response.dart';

class NewsUpdateRepositoryImpl implements NewsUpdateRepository {
  NewsUpdateRepositoryImpl(this.datasource);

  final NewsApiDatasource datasource;

  @override
  Future<NewsUpdateResponse> getTopHeadlines(
      String? category,
      String? country,
      int? page,
      int? pageSize,
      String? query,
      ) async {
    try {
      final newData = await datasource.getLatestNews(
        category,
        country,
        page,
        pageSize,
        query,
      );
      return newData;
    } on Exception {
      rethrow;
    }
  }
}
