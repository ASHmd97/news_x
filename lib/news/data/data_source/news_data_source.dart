import 'package:news_x/news/data/models/news_model.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId);
}
