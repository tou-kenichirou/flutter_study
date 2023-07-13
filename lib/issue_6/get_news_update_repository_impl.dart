import 'package:flutter_study/issue_6/get_news_update_repository.dart';
import 'package:flutter_study/issue_6/news_update_repository_impl.dart';
import 'package:flutter_study/issue_6/news_update_response.dart';

class GetNewsUpdateRepositoryImpl implements GetNewsUpdateRepository {
  GetNewsUpdateRepositoryImpl(this._repository);

  final NewsUpdateRepositoryImpl _repository;

  @override
  Future<NewsUpdateResponse> get(
      String? category,
      String? country,
      int? page,
      int? pageSize,
      String? query,
      ) async {
    return _repository.getTopHeadlines(
      category,
      country,
      page,
      pageSize,
      query,
    );
  }
}
