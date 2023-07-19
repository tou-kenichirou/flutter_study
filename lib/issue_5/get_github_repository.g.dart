// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGitHubRepository _$GetGitHubRepositoryFromJson(Map<String, dynamic> json) =>
    GetGitHubRepository(
      items: (json['items'] as List<dynamic>)
          .map((e) => GithubRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
