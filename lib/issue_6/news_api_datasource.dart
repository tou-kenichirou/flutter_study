import 'package:dio/dio.dart';
import 'package:flutter_study/issue_6/news_update_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_datasource.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class NewsApiDatasource {
  factory NewsApiDatasource(Dio dio, {String baseUrl}) = _NewsApiDatasource;

  @GET('/v2/top-headlines')
  Future<NewsUpdateResponse> getLatestNews(
      @Query('category') String? category,
      @Query('country') String? country,
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('q') String? query,
      );
}
