import 'package:flutter/material.dart';
import 'package:news_x/home/view/screens/categories_grid.dart';
import 'package:news_x/shared/app_theme.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('News App')),
        body: const CategoriesGrid(),
      ),
    );
  }
}
