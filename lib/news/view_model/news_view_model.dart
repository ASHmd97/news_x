import 'package:flutter/material.dart';
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/data/repositories/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  final newsRepo = NewsRepository();
  bool isLoading = false;
  String? errorMessage;
  List<News> news = [];

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
