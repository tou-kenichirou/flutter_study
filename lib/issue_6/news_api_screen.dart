import 'package:flutter/material.dart';
import 'news_facorites_screen.dart';
import 'news_main_screen.dart';

class NewsAPIApp extends StatefulWidget {
  const NewsAPIApp({super.key, required this.title});

  final String title;

  @override
  NewsAPITopScreenState createState() => NewsAPITopScreenState();
}

class NewsAPITopScreenState extends State<NewsAPIApp>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static List<Widget> screens = [
    NewsMainScreen(
      title: tabs[0].text ?? 'ニュース',
    ),
    NewsFavoritesScreen(
      title: tabs[1].text ?? 'お気に入り',
    ),
  ];

  static const List<Tab> tabs = [
    Tab(
      text: 'メイン',
      icon: Icon(Icons.newspaper),
    ),
    Tab(
      text: 'お気に入り',
      icon: Icon(Icons.favorite),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: screens,
      ),
      bottomNavigationBar: SafeArea(
        child: ColoredBox(
          color: Colors.black,
          child: TabBar(
            dividerColor: Colors.transparent,
            controller: _tabController,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
