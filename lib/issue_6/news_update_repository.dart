import 'package:flutter_study/issue_6/news_update_response.dart';

abstract class NewsUpdateRepository {
  Future<NewsUpdateResponse> getTopHeadlines(
      String? category,
      String? country,
      int? page,
      int? pageSize,
      String? query,
      ) {
    throw UnimplementedError();
  }
}
