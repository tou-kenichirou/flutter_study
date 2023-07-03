import 'package:flutter/cupertino.dart';
import 'package:flutter_study/github_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_github_repository.g.dart';

@immutable
@JsonSerializable()
class GetGitHubRepository {
  const GetGitHubRepository({required this.items});

  factory GetGitHubRepository.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GetGitHubRepositoryFromJson(json);

  final List<GithubRepository> items;

  GetGitHubRepository copyWith({
    required List<GithubRepository>? items,
  }) =>
      GetGitHubRepository(
        items: items ?? this.items,
      );
}
