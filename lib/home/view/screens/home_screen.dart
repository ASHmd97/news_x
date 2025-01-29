import 'package:flutter/material.dart';
import 'package:news_x/home/view/screens/categories_screen.dart';
import 'package:news_x/home/view/widgets/home_drawer.dart';
import 'package:news_x/settings/view/screens/settings_screen.dart';
import 'package:news_x/shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  DrawerItem selectedItem = DrawerItem.categories;
  void onSelectedItem(DrawerItem item) {
    selectedItem = item;
    setState(() {});
    Navigator.of(context).pop();
  }

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
        drawer: HomeDrawer(onSelectedItem),
        body: selectedItem == DrawerItem.categories
            ? const CategoriesScreen()
            : const SettingsScreen(),
      ),
    );
  }
}
