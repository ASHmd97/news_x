import 'package:flutter/material.dart';
import 'package:news_x/news/data/data_source/news_data_source.dart';
import 'package:news_x/news/data/models/news_model.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  bool isLoading = false;
  String? errorMessage;
  List<News> news = [];

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    final response = await dataSource.getNews(sourceId);

    try {
      if (response.status == 'ok') {
        news = response.articles;
      } else {
        errorMessage = 'Failed To Get The Articles';
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
