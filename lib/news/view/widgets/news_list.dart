import 'package:flutter/material.dart';
import 'package:news_x/api/api_serves.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/view/widgets/news_item.dart';
import 'package:news_x/shared/widgets/error_indicator.dart';
import 'package:news_x/shared/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServes.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator(message: snapshot.error.toString());
        } else {
          List<News> news = snapshot.data?.articles ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            child: ListView.separated(
              itemCount: news.length,
              itemBuilder: (_, index) => NewsItem(
                newsModel: news[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
          );
        }
      },
    );
  }
}
