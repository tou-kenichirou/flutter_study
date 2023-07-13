import 'package:flutter/material.dart';

class NewsHeaderDrawer extends StatelessWidget {
  const NewsHeaderDrawer({
    super.key,
    required this.headerTitle,
  });

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: Text(
        headerTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
