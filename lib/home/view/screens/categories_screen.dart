import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/home/view/widgets/category_item.dart';
import 'package:news_x/shared/app_theme.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onSelectedCategory});
  final void Function(CategoryModel) onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'technology',
        name: 'Politics',
        imageName: 'Politics',
        color: AppTheme.blue,
      ),
      const CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      const CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'business',
        color: AppTheme.brown,
      ),
      const CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      const CategoryModel(
        id: 'science',
        name: 'Science',
        imageName: 'science',
        color: AppTheme.yellow,
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Pick your category\nof interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: .9,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onSelectedCategory(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                ),
                itemCount: categoryList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
