import 'package:flutter/material.dart';
import 'package:flutter_study/issue_6/country_code.dart';
import 'package:flutter_study/issue_6/news_header_drawer.dart';

class CountryDrawer extends StatelessWidget {
  const CountryDrawer({super.key, required this.onTap});

  final void Function(Country) onTap;

  @override
  Widget build(BuildContext context) {
    final countryTiles = Country.values.map(
      (country) => ListTile(
        title: Text(
          country.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () => onTap(country),
      ),
    );

    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          const NewsHeaderDrawer(headerTitle: '国一覧'),
          ...countryTiles,
        ],
      ),
    );
  }
}
