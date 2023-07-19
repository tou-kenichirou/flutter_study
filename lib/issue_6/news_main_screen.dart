import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/issue_4/webview_screen.dart';
import 'package:flutter_study/issue_6/app_exception.dart';
import 'package:flutter_study/issue_6/article.dart';
import 'package:flutter_study/issue_6/country_code.dart';
import 'package:flutter_study/issue_6/country_drawer.dart';
import 'package:flutter_study/issue_6/favorites_datasource_impl.dart';
import 'package:flutter_study/issue_6/favorites_repository_impl.dart';
import 'package:flutter_study/issue_6/get_news_update_repository_impl.dart';
import 'package:flutter_study/issue_6/news_api_datasource.dart';
import 'package:flutter_study/issue_6/news_api_datasource_impl.dart';
import 'package:flutter_study/issue_6/news_category.dart';
import 'package:flutter_study/issue_6/news_category_drawer.dart';
import 'package:flutter_study/issue_6/news_update_repository_impl.dart';
import 'package:flutter_study/issue_6/post_favorites_repository_impl.dart';
import 'package:flutter_study/issue_6/show_snack_bar.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NewsMainScreen extends StatefulWidget {
  const NewsMainScreen({super.key, required this.title});

  final String title;

  @override
  NewsMainScreenState createState() => NewsMainScreenState();
}

class NewsMainScreenState extends State<NewsMainScreen> {
  final postFavoriteRepository = PostFavoritesRepositoryImpl(
    FavoritesRepositoryImpl(FavoritesDatasourceImpl()),
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final PagingController<int, Article> _pagingController;
  final defaultPage = 1;
  NewsCategory _selectedCategory = NewsCategory.sports;
  Country _selectedCountry = Country.japan;
  int currentPage = 1;
  bool isLoading = false;
  final _dio = Dio();
  late final GetNewsUpdateRepositoryImpl _useCase;

  Future<void> fetchItems(int page) async {
    try {
      final newData = await _useCase.get(
        _selectedCategory.name,
        _selectedCountry.countryCode,
        currentPage,
        null,
        null,
      );

      setState(() {
        currentPage++;
      });

      switch (newData.articles) {
        case final article?:
          article.isNotEmpty
              ? _pagingController.appendPage(
                  article,
                  currentPage,
                )
              : _pagingController.appendLastPage(article);
        case null:
          break;
      }
    } on Exception catch (e) {
      _pagingController.error = e;
    }
  }

  void _refresh() {
    setState(() {
      currentPage = defaultPage;
    });
    _pagingController.refresh();
  }

  void _refreshWithDrawer(Object item) {
    Navigator.pop(context);
    switch (item) {
      case final Country country:
        setState(() {
          _selectedCountry = country;
        });
      case final NewsCategory category:
        setState(() {
          _selectedCategory = category;
        });
      default:
        break;
    }
    _refresh();
  }

  @override
  void initState() {
    const newsApiKey = String.fromEnvironment('NEWS_API_KEY');

    if (newsApiKey.isEmpty) {
      throw AssertionError('NEWS_API_KEY is not set');
    }

    _dio.options.headers['X-Api-Key'] = newsApiKey;

    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

    _useCase = GetNewsUpdateRepositoryImpl(
      NewsUpdateRepositoryImpl(
        NewsApiDatasourceImpl(
          NewsApiDatasource(_dio),
        ),
      ),
    );

    _pagingController = PagingController(firstPageKey: currentPage);

    _pagingController.addPageRequestListener((pageKey) {
      fetchItems(currentPage);
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
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          _selectedCountry.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.replay,
              color: Colors.white,
            ),
            tooltip: 'refresh top-headlines',
            onPressed: _refresh,
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.public),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          _refresh,
        ),
        child: PagedListView<int, Article>.separated(
          separatorBuilder: (context, _) => const Divider(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Article>(
            itemBuilder: (context, article, _) {
              return ListTile(
                title: Text(
                  article.title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  article.author ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: article.urlToImage != null
                    ? CachedNetworkImage(
                        imageUrl: article.urlToImage!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.no_photography_outlined),
                      )
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => WebViewScreen(
                        url: article.url,
                      ),
                    ),
                  );
                },
                onLongPress: () async {
                  // use_build_context_synchronously対策
                  final isMounted = context.mounted;
                  final scaffoldMessenger = ScaffoldMessenger.of(context);

                  try {
                    await postFavoriteRepository.post(article);
                    if (!isMounted) {
                      return;
                    }
                    showSnackBar(
                      scaffoldMessenger,
                      'お気に入りに追加しました\n${article.title}\n${article.author}',
                    );
                  } on AlreadyExistsException catch (e) {
                    showSnackBar(
                      scaffoldMessenger,
                      '${e.message}\n${article.title}\n${article.author}',
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
      drawer: NewsCategoryDrawer(
        onTap: _refreshWithDrawer,
      ),
      endDrawer: CountryDrawer(
        onTap: _refreshWithDrawer,
      ),
    );
  }
}
