import 'package:flutter/material.dart';
import 'package:news_x/category_details/view/screens/category_details.dart';
import 'package:news_x/home/data/models/category_model.dart';
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
  CategoryModel? selectedCategory;

  void onSelectedItem(DrawerItem item) {
    selectedItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onSelectedCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
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
        appBar: AppBar(
            title: Text(
          selectedCategory != null
              ? selectedCategory!.name
              : selectedItem == DrawerItem.categories
                  ? 'News App'
                  : 'Settings',
        )),
        drawer: HomeDrawer(onSelectedItem),
        body: selectedCategory != null
            ? CategoryDetails(category: selectedCategory!)
            : selectedItem == DrawerItem.categories
                ? CategoriesScreen(onSelectedCategory: onSelectedCategory)
                : const SettingsScreen(),
      ),
    );
  }
}
