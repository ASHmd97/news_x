import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/view/widgets/news_list.dart';
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
    // --------------------------------------- //
    List<NewsModel> news = List.generate(
      12,
      (index) => NewsModel(
          imageUrl:
              'https://letsenhance.io/static/a31ab775f44858f1d1b80ee51738f4f3/11499/EnhanceAfter.jpg',
          sourceName: 'BBC news',
          title: "Why are football's biggest clubs starting a new tournament?",
          date: '3 hours ago'),
    );
    // --------------------------------------- //
    return Column(
      children: [
        SourcesTabs(sources: sources),
        NewsList(news: news),
      ],
    );
  }
}
