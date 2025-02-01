import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/view/widgets/news_item.dart';

import 'package:news_x/news/view_model/news_view_model.dart';
import 'package:news_x/shared/widgets/error_indicator.dart';
import 'package:news_x/shared/widgets/loading_indicator.dart';

import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(message: viewModel.errorMessage!);
          } else {
            List<News> news = viewModel.news;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
              child: ListView.separated(
                itemCount: news.length,
                itemBuilder: (_, index) => NewsItem(
                  newsModel: news[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
