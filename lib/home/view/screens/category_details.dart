import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/sources/data/models/source_model.dart';
import 'package:news_x/sources/view/widgets/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    List<SourceModel> sources = List.generate(
      12,
      (index) => SourceModel(
        id: '$index',
        name: 'BBC News $index',
      ),
    );
    return Column(
      children: [
        SourcesTabs(sources: sources),
      ],
    );
  }
}
