import 'package:flutter/cupertino.dart';
import 'package:flutter_study/issue_5/github_owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class GithubRepository {
  const GithubRepository({
    this.description,
    required this.name,
    required this.owner,
    required this.stargazersCount,
  });

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);
  final String? description;
  final String name;
  final GithubOwner owner;
  final int stargazersCount;

  Map<String, dynamic> toJson() => _$GithubRepositoryToJson(this);

  GithubRepository copyWith({
    String? description,
    required String? name,
    required GithubOwner? owner,
    required int? stargazersCount,
  }) =>
      GithubRepository(
        description: description ?? this.description,
        name: name ?? this.name,
        owner: owner ?? this.owner,
        stargazersCount: stargazersCount ?? this.stargazersCount,
      );
}
