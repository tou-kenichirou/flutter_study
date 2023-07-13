import 'package:flutter_study/issue_6/news_api_datasource.dart';
import 'package:flutter_study/issue_6/news_update_response.dart';

class NewsApiDatasourceImpl implements NewsApiDatasource {
  NewsApiDatasourceImpl(this._datasource);

  final NewsApiDatasource _datasource;

  @override
  Future<NewsUpdateResponse> getLatestNews(
      String? category,
      String? country,
      int? page,
      int? pageSize,
      String? query,
      ) async {
    final newData = await _datasource.getLatestNews(
      category,
      country,
      page,
      pageSize,
      query,
    );

    if (newData.status == 'ok') {
      return newData;
    } else {
      throw Exception('getTopHeadlines exception');
    }
  }
}
