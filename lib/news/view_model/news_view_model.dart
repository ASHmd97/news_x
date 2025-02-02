import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/data/repositories/news_repository.dart';
import 'package:news_x/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final  NewsRepository newsRepo;
  bool isLoading = false;
  String? errorMessage;
  List<News> news = [];

  NewsViewModel(){
    newsRepo = NewsRepository(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();

    try {
      news = await newsRepo.getNews(sourceId);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
