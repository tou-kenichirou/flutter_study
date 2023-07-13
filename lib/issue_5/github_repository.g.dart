// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepository _$GithubRepositoryFromJson(Map<String, dynamic> json) =>
    GithubRepository(
      description: json['description'] as String?,
      name: json['name'] as String,
      owner: GithubOwner.fromJson(json['owner'] as Map<String, dynamic>),
      stargazersCount: json['stargazers_count'] as int,
    );

Map<String, dynamic> _$GithubRepositoryToJson(GithubRepository instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'owner': instance.owner,
      'stargazers_count': instance.stargazersCount,
    };
