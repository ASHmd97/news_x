import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
              bottomRight:
                  (index.isOdd) ? const Radius.circular(16) : Radius.zero,
              bottomLeft:
                  (index.isEven) ? const Radius.circular(16) : Radius.zero,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${category.imageName}.png'),
            Text(
              category.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
 