import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/github_api_client.dart';
import 'package:flutter_study/github_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GithubAPIAppResult extends StatefulWidget {
  const GithubAPIAppResult({super.key, required this.query});

  final String query;

  @override
  SearchGithubResultScreenState createState() =>
      SearchGithubResultScreenState();
}

class SearchGithubResultScreenState extends State<GithubAPIAppResult> {
  late final PagingController<int, GithubRepository> _pagingController;
  late final GithubApiClient client;
  final List<GithubRepository> itemList = [];
  final dio = Dio();
  int currentPage = 1;
  bool isLoading = false;

  Future<void> fetchItems() async {
    final newData = await client.getGitHubRepoList(widget.query, currentPage);
    setState(() {
      itemList.addAll(newData.items);
      currentPage++;
    });

    try {
      final hasNext = newData.items.isNotEmpty;
      if (hasNext) {
        _pagingController.appendPage(newData.items, currentPage);
      } else {
        _pagingController.appendLastPage(newData.items);
      }
    } on Exception catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    client = GithubApiClient(dio);
    _pagingController = PagingController(firstPageKey: currentPage);
    _pagingController.addPageRequestListener((pageKey) {
      fetchItems();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '${widget.query}を名前に含むリポジトリ',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: PagedListView<int, GithubRepository>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<GithubRepository>(
            itemBuilder: (context, repo, index) {
              return ListTile(
                title: Text(
                  repo.name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  repo.description ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
                leading: switch (repo.owner.avatarUrl) {
                  final avatarUrl? => CachedNetworkImage(
                      imageUrl: avatarUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  _ => const Icon(Icons.account_circle),
                },
                trailing: Text(
                  '⭐️${repo.stargazersCount}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
