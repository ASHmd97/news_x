import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${category.name} Category Details',
      ),
    );
  }
}
 