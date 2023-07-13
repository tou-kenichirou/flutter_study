import 'package:flutter/cupertino.dart';
import 'package:flutter_study/issue_6/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_update_response.g.dart';

@immutable
@JsonSerializable()
class NewsUpdateResponse {
  const NewsUpdateResponse({
    required this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory NewsUpdateResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$NewsUpdateResponseFromJson(json);

  final String status;
  final int? totalResults;
  final List<Article>? articles;
  final String? code;
  final String? message;

  NewsUpdateResponse copyWith() => NewsUpdateResponse(
    status: status,
    totalResults: totalResults,
    articles: articles,
    code: code,
    message: message,
  );
}
