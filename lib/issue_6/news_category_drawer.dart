import 'package:flutter/material.dart';
import 'package:flutter_study/issue_6/news_category.dart';
import 'package:flutter_study/issue_6/news_header_drawer.dart';

class NewsCategoryDrawer extends StatelessWidget {
  const NewsCategoryDrawer({super.key, required this.onTap});

  final void Function(NewsCategory) onTap;

  @override
  Widget build(BuildContext context) {
    final categoryTiles = NewsCategory.values.map(
      (category) => ListTile(
        title: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () => onTap(category),
      ),
    );

    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          const NewsHeaderDrawer(headerTitle: 'カテゴリー 一覧'),
          ...categoryTiles,
        ],
      ),
    );
  }
}
