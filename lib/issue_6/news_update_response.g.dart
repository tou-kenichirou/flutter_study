// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsUpdateResponse _$NewsUpdateResponseFromJson(Map<String, dynamic> json) =>
    NewsUpdateResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
