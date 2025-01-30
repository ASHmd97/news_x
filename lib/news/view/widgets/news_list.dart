import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/view/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.news});
  final List<NewsModel> news;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
        child: ListView.separated(
          itemCount: 12,
          itemBuilder: (_, index) => NewsItem(
            newsModel: news[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
