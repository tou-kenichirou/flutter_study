import 'package:flutter_study/issue_6/news_update_response.dart';

abstract class GetNewsUpdateRepository {
  Future<NewsUpdateResponse> get(
      String? category,
      String? country,
      int? page,
      int? pageSize,
      String? query,
      ) {
    throw UnimplementedError();
  }
}
